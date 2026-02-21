package v2

import (
	"context"
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"time"

	"github.com/hiddify/hiddify-core/bridge"
	"github.com/hiddify/hiddify-core/config"
	pb "github.com/hiddify/hiddify-core/hiddifyrpc"
	"github.com/sagernet/sing-box/experimental/libbox"
	"github.com/sagernet/sing-box/log"
)

var (
	Box              *BoxServiceWrapper // Using BoxServiceWrapper for proper CommandServer integration
	HiddifyOptions   *config.HiddifyOptions
	activeConfigPath string
	coreLogFactory   log.Factory
	useFlutterBridge bool = true
)

func StopAndAlert(msgType pb.MessageType, message string) {
	SetCoreStatus(pb.CoreState_STOPPED, msgType, message)
	config.DeactivateTunnelService()
	if Box != nil {
		Box.Close()
		Box = nil
	}
	if oldCommandServer != nil {
		oldCommandServer.Close()
	}
	if useFlutterBridge {
		alert := msgType.String()
		msg, _ := json.Marshal(StatusMessage{Status: convert2OldState(CoreState), Alert: &alert, Message: &message})
		bridge.SendStringToPort(statusPropagationPort, string(msg))
	}
}

func (s *CoreService) Start(ctx context.Context, in *pb.StartRequest) (*pb.CoreInfoResponse, error) {
	return Start(in)
}

func Start(in *pb.StartRequest) (*pb.CoreInfoResponse, error) {
	defer config.DeferPanicToError("start", func(err error) {
		Log(pb.LogLevel_FATAL, pb.LogType_CORE, err.Error())
		StopAndAlert(pb.MessageType_UNEXPECTED_ERROR, err.Error())
	})
	Log(pb.LogLevel_INFO, pb.LogType_CORE, "Starting")
	if CoreState != pb.CoreState_STOPPED {
		Log(pb.LogLevel_INFO, pb.LogType_CORE, "Starting0000")
		Stop()
		// return &pb.CoreInfoResponse{
		// 	CoreState:   CoreState,
		// 	MessageType: pb.MessageType_INSTANCE_NOT_STOPPED,
		// }, fmt.Errorf("instance not stopped")
	}
	Log(pb.LogLevel_DEBUG, pb.LogType_CORE, "Starting Core")
	SetCoreStatus(pb.CoreState_STARTING, pb.MessageType_EMPTY, "")
	libbox.SetMemoryLimit(!in.DisableMemoryLimit)
	resp, err := StartService(in)
	return resp, err
}

func (s *CoreService) StartService(ctx context.Context, in *pb.StartRequest) (*pb.CoreInfoResponse, error) {
	return StartService(in)
}

func StartService(in *pb.StartRequest) (*pb.CoreInfoResponse, error) {
	fmt.Println("[TRACE] StartService: entering")
	Log(pb.LogLevel_INFO, pb.LogType_CORE, "Starting Core Service")

	// Step 1: Read config content
	content := in.ConfigContent
	if content == "" {
		fmt.Printf("[TRACE] StartService: reading config from %s\n", in.ConfigPath)
		activeConfigPath = in.ConfigPath
		fileContent, err := os.ReadFile(activeConfigPath)
		if err != nil {
			fmt.Printf("[TRACE] StartService: ERROR reading config: %v\n", err)
			Log(pb.LogLevel_FATAL, pb.LogType_CORE, err.Error())
			resp := SetCoreStatus(pb.CoreState_STOPPED, pb.MessageType_ERROR_READING_CONFIG, err.Error())
			StopAndAlert(pb.MessageType_UNEXPECTED_ERROR, err.Error())
			return resp, err
		}
		content = string(fileContent)
		fmt.Printf("[TRACE] StartService: config read, %d bytes\n", len(content))
	}

	// Step 2: Parse and build config if needed
	var finalConfigJson string
	if in.EnableRawConfig {
		finalConfigJson = content
	} else {
		fmt.Println("[TRACE] StartService: parsing config")
		Log(pb.LogLevel_INFO, pb.LogType_CORE, "Parsing Config")
		parsedContent, err := readOptions(content)
		if err != nil {
			fmt.Printf("[TRACE] StartService: ERROR parsing config: %v\n", err)
			Log(pb.LogLevel_FATAL, pb.LogType_CORE, err.Error())
			resp := SetCoreStatus(pb.CoreState_STOPPED, pb.MessageType_ERROR_PARSING_CONFIG, err.Error())
			StopAndAlert(pb.MessageType_UNEXPECTED_ERROR, err.Error())
			return resp, err
		}
		fmt.Println("[TRACE] StartService: building config")
		Log(pb.LogLevel_INFO, pb.LogType_CORE, "Building config")
		finalConfigJson, err = config.BuildConfigJson(*HiddifyOptions, parsedContent)
		if err != nil {
			fmt.Printf("[TRACE] StartService: ERROR building config: %v\n", err)
			Log(pb.LogLevel_FATAL, pb.LogType_CORE, err.Error())
			resp := SetCoreStatus(pb.CoreState_STOPPED, pb.MessageType_ERROR_BUILDING_CONFIG, err.Error())
			StopAndAlert(pb.MessageType_UNEXPECTED_ERROR, err.Error())
			return resp, err
		}
		fmt.Println("[TRACE] StartService: config built successfully")
	}

	// Step 3: Save config for debugging
	fmt.Println("[TRACE] StartService: saving config")
	Log(pb.LogLevel_INFO, pb.LogType_CORE, "Saving config")
	currentBuildConfigPath := filepath.Join(sWorkingPath, "current-config.json")
	os.WriteFile(currentBuildConfigPath, []byte(finalConfigJson), 0644)
	if activeConfigPath == "" {
		activeConfigPath = currentBuildConfigPath
	}

	// Step 4: Start command server
	if in.EnableOldCommandServer {
		fmt.Println("[TRACE] StartService: starting command server")
		Log(pb.LogLevel_INFO, pb.LogType_CORE, "Starting Command Server")
		err := startCommandServer()
		if err != nil {
			fmt.Printf("[TRACE] StartService: ERROR starting command server: %v\n", err)
			Log(pb.LogLevel_FATAL, pb.LogType_CORE, err.Error())
			resp := SetCoreStatus(pb.CoreState_STOPPED, pb.MessageType_START_COMMAND_SERVER, err.Error())
			StopAndAlert(pb.MessageType_UNEXPECTED_ERROR, err.Error())
			return resp, err
		}
		fmt.Println("[TRACE] StartService: command server started")
	}

	// Step 5: Create BoxService using libbox.NewService (properly integrates with CommandServer)
	fmt.Println("[TRACE] StartService: creating sing-box instance via libbox.NewService")
	Log(pb.LogLevel_INFO, pb.LogType_CORE, "Creating Service")
	instance, err := NewService(finalConfigJson)
	if err != nil {
		fmt.Printf("[TRACE] StartService: ERROR creating service: %v\n", err)
		Log(pb.LogLevel_FATAL, pb.LogType_CORE, err.Error())
		resp := SetCoreStatus(pb.CoreState_STOPPED, pb.MessageType_CREATE_SERVICE, err.Error())
		StopAndAlert(pb.MessageType_UNEXPECTED_ERROR, err.Error())
		return resp, err
	}
	fmt.Println("[TRACE] StartService: sing-box instance created")
	Log(pb.LogLevel_INFO, pb.LogType_CORE, "Service created")

	if in.DelayStart {
		fmt.Println("[TRACE] StartService: delay start 250ms")
		<-time.After(250 * time.Millisecond)
	}

	// Step 6: Start the service
	fmt.Println("[TRACE] StartService: calling instance.Start()")
	err = instance.Start()
	if err != nil {
		fmt.Printf("[TRACE] StartService: ERROR starting instance: %v\n", err)
		Log(pb.LogLevel_FATAL, pb.LogType_CORE, err.Error())
		resp := SetCoreStatus(pb.CoreState_STOPPED, pb.MessageType_START_SERVICE, err.Error())
		StopAndAlert(pb.MessageType_UNEXPECTED_ERROR, err.Error())
		return resp, err
	}
	fmt.Println("[TRACE] StartService: instance started successfully!")
	Box = instance

	// Step 7: Register service with CommandServer for groups/status reporting
	if oldCommandServer != nil {
		fmt.Println("[TRACE] StartService: registering service with CommandServer")
		oldCommandServer.SetService(instance)
	}

	fmt.Println("[TRACE] StartService: setting STARTED status")
	resp := SetCoreStatus(pb.CoreState_STARTED, pb.MessageType_EMPTY, "")
	fmt.Println("[TRACE] StartService: DONE!")
	return resp, nil
}

func (s *CoreService) Parse(ctx context.Context, in *pb.ParseRequest) (*pb.ParseResponse, error) {
	return Parse(in)
}

func Parse(in *pb.ParseRequest) (*pb.ParseResponse, error) {
	defer config.DeferPanicToError("parse", func(err error) {
		Log(pb.LogLevel_FATAL, pb.LogType_CONFIG, err.Error())
		StopAndAlert(pb.MessageType_UNEXPECTED_ERROR, err.Error())
	})

	content := in.Content
	if in.TempPath != "" {
		contentBytes, err := os.ReadFile(in.TempPath)
		content = string(contentBytes)
		os.Chdir(filepath.Dir(in.ConfigPath))
		if err != nil {
			return nil, err
		}

	}

	config, err := config.ParseConfigContent(content, true, HiddifyOptions, false)
	if err != nil {
		return &pb.ParseResponse{
			ResponseCode: pb.ResponseCode_FAILED,
			Message:      err.Error(),
		}, err
	}
	if in.ConfigPath != "" {
		err = os.WriteFile(in.ConfigPath, config, 0o644)
		if err != nil {
			return &pb.ParseResponse{
				ResponseCode: pb.ResponseCode_FAILED,
				Message:      err.Error(),
			}, err
		}
	}
	return &pb.ParseResponse{
		ResponseCode: pb.ResponseCode_OK,
		Content:      string(config),
		Message:      "",
	}, err
}

func (s *CoreService) ChangeHiddifySettings(ctx context.Context, in *pb.ChangeHiddifySettingsRequest) (*pb.CoreInfoResponse, error) {
	return ChangeHiddifySettings(in)
}

func ChangeHiddifySettings(in *pb.ChangeHiddifySettingsRequest) (*pb.CoreInfoResponse, error) {
	HiddifyOptions = config.DefaultHiddifyOptions()
	err := json.Unmarshal([]byte(in.HiddifySettingsJson), HiddifyOptions)
	if err != nil {
		return nil, err
	}
	return &pb.CoreInfoResponse{}, nil
}

func (s *CoreService) GenerateConfig(ctx context.Context, in *pb.GenerateConfigRequest) (*pb.GenerateConfigResponse, error) {
	return GenerateConfig(in)
}

func GenerateConfig(in *pb.GenerateConfigRequest) (*pb.GenerateConfigResponse, error) {
	defer config.DeferPanicToError("generateConfig", func(err error) {
		Log(pb.LogLevel_FATAL, pb.LogType_CONFIG, err.Error())
		StopAndAlert(pb.MessageType_UNEXPECTED_ERROR, err.Error())
	})
	if HiddifyOptions == nil {
		HiddifyOptions = config.DefaultHiddifyOptions()
	}
	config, err := generateConfigFromFile(in.Path, *HiddifyOptions)
	if err != nil {
		return nil, err
	}
	return &pb.GenerateConfigResponse{
		ConfigContent: config,
	}, nil
}

func generateConfigFromFile(path string, configOpt config.HiddifyOptions) (string, error) {
	os.Chdir(filepath.Dir(path))
	content, err := os.ReadFile(path)
	if err != nil {
		return "", err
	}
	options, err := readOptions(string(content))
	if err != nil {
		return "", err
	}
	config, err := config.BuildConfigJson(configOpt, options)
	if err != nil {
		return "", err
	}
	return config, nil
}

func (s *CoreService) Stop(ctx context.Context, empty *pb.Empty) (*pb.CoreInfoResponse, error) {
	return Stop()
}

func Stop() (*pb.CoreInfoResponse, error) {
	fmt.Printf("[TRACE] Stop: entering, CoreState=%v, Box=%v\n", CoreState, Box != nil)
	defer config.DeferPanicToError("stop", func(err error) {
		Log(pb.LogLevel_FATAL, pb.LogType_CORE, err.Error())
		StopAndAlert(pb.MessageType_UNEXPECTED_ERROR, err.Error())
	})

	if CoreState != pb.CoreState_STARTED {
		fmt.Printf("[TRACE] Stop: CoreState is not STARTED, it's %v\n", CoreState)
		Log(pb.LogLevel_FATAL, pb.LogType_CORE, "Core is not started")
		return &pb.CoreInfoResponse{
			CoreState:   CoreState,
			MessageType: pb.MessageType_INSTANCE_NOT_STARTED,
			Message:     "instance is not started",
		}, fmt.Errorf("instance not started")
	}
	if Box == nil {
		return &pb.CoreInfoResponse{
			CoreState:   CoreState,
			MessageType: pb.MessageType_INSTANCE_NOT_FOUND,
			Message:     "instance is not found",
		}, fmt.Errorf("instance not found")
	}
	SetCoreStatus(pb.CoreState_STOPPING, pb.MessageType_EMPTY, "")
	config.DeactivateTunnelService()

	err := Box.Close()
	if err != nil {
		return &pb.CoreInfoResponse{
			CoreState:   CoreState,
			MessageType: pb.MessageType_UNEXPECTED_ERROR,
			Message:     "Error while stopping the service.",
		}, fmt.Errorf("Error while stopping the service.")
	}
	Box = nil
	if oldCommandServer != nil {
		err = oldCommandServer.Close()
		if err != nil {
			return &pb.CoreInfoResponse{
				CoreState:   CoreState,
				MessageType: pb.MessageType_UNEXPECTED_ERROR,
				Message:     "Error while closing the command server.",
			}, fmt.Errorf("error while closing the command server")
		}
		oldCommandServer = nil
	}
	resp := SetCoreStatus(pb.CoreState_STOPPED, pb.MessageType_EMPTY, "")
	return resp, nil
}

func (s *CoreService) Restart(ctx context.Context, in *pb.StartRequest) (*pb.CoreInfoResponse, error) {
	return Restart(in)
}

func Restart(in *pb.StartRequest) (*pb.CoreInfoResponse, error) {
	defer config.DeferPanicToError("restart", func(err error) {
		Log(pb.LogLevel_FATAL, pb.LogType_CORE, err.Error())
		StopAndAlert(pb.MessageType_UNEXPECTED_ERROR, err.Error())
	})
	log.Debug("[Service] Restarting")

	if CoreState != pb.CoreState_STARTED {
		return &pb.CoreInfoResponse{
			CoreState:   CoreState,
			MessageType: pb.MessageType_INSTANCE_NOT_STARTED,
			Message:     "instance is not started",
		}, fmt.Errorf("instance not started")
	}
	if Box == nil {
		return &pb.CoreInfoResponse{
			CoreState:   CoreState,
			MessageType: pb.MessageType_INSTANCE_NOT_FOUND,
			Message:     "instance is not found",
		}, fmt.Errorf("instance not found")
	}

	resp, err := Stop()
	if err != nil {
		return resp, err
	}

	SetCoreStatus(pb.CoreState_STARTING, pb.MessageType_EMPTY, "")
	<-time.After(250 * time.Millisecond)

	libbox.SetMemoryLimit(!in.DisableMemoryLimit)
	resp, gErr := StartService(in)
	return resp, gErr
}
