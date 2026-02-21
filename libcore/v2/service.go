package v2

import (
	"context"
	"io"
	"os"
	runtimeDebug "runtime/debug"
	"time"

	"github.com/hiddify/hiddify-core/v2/db"
	"github.com/hiddify/hiddify-core/v2/service_manager"

	B "github.com/sagernet/sing-box"
	"github.com/sagernet/sing-box/adapter"
	"github.com/sagernet/sing-box/common/urltest"
	"github.com/sagernet/sing-box/experimental/libbox"
	"github.com/sagernet/sing-box/log"
	"github.com/sagernet/sing-box/option"
	E "github.com/sagernet/sing/common/exceptions"
	"github.com/sagernet/sing/service"
	"github.com/sagernet/sing/service/filemanager"
	"github.com/sagernet/sing/service/pause"
)

var (
	sWorkingPath          string
	sTempPath             string
	sUserID               int
	sGroupID              int
	statusPropagationPort int64
)

func InitHiddifyService() error {
	return service_manager.StartServices()
}

func Setup(basePath string, workingPath string, tempPath string, statusPort int64, debug bool) error {
	statusPropagationPort = int64(statusPort)
	// In sing-box 1.12+, Setup takes SetupOptions struct
	libbox.Setup(&libbox.SetupOptions{
		BasePath:     basePath,
		WorkingPath:  workingPath,
		TempPath:     tempPath,
		IsTVOS:       false,
	})
	sWorkingPath = workingPath
	os.Chdir(sWorkingPath)
	db.SetDataDir(sWorkingPath)
	sTempPath = tempPath
	sUserID = os.Getuid()
	sGroupID = os.Getgid()

	var defaultWriter io.Writer
	if !debug {
		defaultWriter = io.Discard
	}
	factory, err := log.New(
		log.Options{
			DefaultWriter: defaultWriter,
			BaseTime:      time.Now(),
			Observable:    true,
		})
	coreLogFactory = factory

	if err != nil {
		return E.Cause(err, "create logger")
	}
	return InitHiddifyService()
}

// BoxServiceWrapper wraps the sing-box instance for service management
// It provides access to ClashServer for CommandServer integration
type BoxServiceWrapper struct {
	ctx                   context.Context
	cancel                context.CancelFunc
	instance              *B.Box
	urlTestHistoryStorage *urltest.HistoryStorage
	clashServer           adapter.ClashServer
}

func (s *BoxServiceWrapper) Start() error {
	return s.instance.Start()
}

func (s *BoxServiceWrapper) Close() error {
	s.cancel()
	return s.instance.Close()
}

// GetContext returns the context for CommandServer integration (implements libbox.ServiceInterface)
func (s *BoxServiceWrapper) GetContext() context.Context {
	return s.ctx
}

// GetClashServer returns the ClashServer for CommandServer integration (implements libbox.ServiceInterface)
func (s *BoxServiceWrapper) GetClashServer() adapter.ClashServer {
	return s.clashServer
}

// GetInstance returns the underlying Box instance (implements libbox.ServiceInterface)
func (s *BoxServiceWrapper) GetInstance() *B.Box {
	return s.instance
}

// NewService creates a BoxServiceWrapper from JSON config content
// This properly sets up ClashServer for groups/status reporting
func NewService(configContent string) (*BoxServiceWrapper, error) {
	runtimeDebug.FreeOSMemory()

	// Parse config using libbox context (has registries for protocols)
	ctx := libbox.BaseContext(nil)
	var options option.Options
	err := options.UnmarshalJSONContext(ctx, []byte(configContent))
	if err != nil {
		return nil, E.Cause(err, "parse config")
	}

	// Create context with required services
	ctx, cancel := context.WithCancel(ctx)
	ctx = filemanager.WithDefault(ctx, sWorkingPath, sTempPath, sUserID, sGroupID)

	// Register URLTestHistoryStorage
	urlTestHistoryStorage := urltest.NewHistoryStorage()
	ctx = service.ContextWithPtr(ctx, urlTestHistoryStorage)

	// Register PauseManager
	ctx = pause.WithDefaultManager(ctx)

	// Create Box instance - it will create ClashServer if ClashAPI is configured
	instance, err := B.New(B.Options{
		Context: ctx,
		Options: options,
	})
	if err != nil {
		cancel()
		return nil, E.Cause(err, "create service")
	}

	// Get ClashServer from context (registered by box.New if ClashAPI is configured)
	clashServer := service.FromContext[adapter.ClashServer](ctx)

	runtimeDebug.FreeOSMemory()
	return &BoxServiceWrapper{
		ctx:                   ctx,
		cancel:                cancel,
		instance:              instance,
		urlTestHistoryStorage: urlTestHistoryStorage,
		clashServer:           clashServer,
	}, nil
}

func readOptions(configContent string) (option.Options, error) {
	var options option.Options
	// In sing-box 1.12+, Options uses UnmarshalJSONContext with registries
	ctx := libbox.BaseContext(nil)
	err := options.UnmarshalJSONContext(ctx, []byte(configContent))
	if err != nil {
		return option.Options{}, E.Cause(err, "decode config")
	}
	return options, nil
}
