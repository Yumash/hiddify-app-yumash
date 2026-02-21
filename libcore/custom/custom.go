package main

/*
#include "stdint.h"
*/
import "C"

import (
	"encoding/json"
	"fmt"
	"os"
	"unsafe"

	"github.com/hiddify/hiddify-core/bridge"
	"github.com/hiddify/hiddify-core/config"
	pb "github.com/hiddify/hiddify-core/hiddifyrpc"
	v2 "github.com/hiddify/hiddify-core/v2"
	"github.com/hiddify/hiddify-core/xray"

	"github.com/sagernet/sing-box/log"
)

//export setupOnce
func setupOnce(api unsafe.Pointer) {
	bridge.InitializeDartApi(api)
}

//export setup
func setup(baseDir *C.char, workingDir *C.char, tempDir *C.char, statusPort C.longlong, debug bool) (CErr *C.char) {
	err := v2.Setup(C.GoString(baseDir), C.GoString(workingDir), C.GoString(tempDir), int64(statusPort), debug)
	return emptyOrErrorC(err)
}

//export parse
func parse(path *C.char, tempPath *C.char, debug bool) (CErr *C.char) {
	res, err := v2.Parse(&pb.ParseRequest{
		ConfigPath: C.GoString(path),
		TempPath:   C.GoString(tempPath),
	})
	if err != nil {
		log.Error(err.Error())
		return C.CString(err.Error())
	}

	err = os.WriteFile(C.GoString(path), []byte(res.Content), 0o644)
	return emptyOrErrorC(err)
}

//export changeHiddifyOptions
func changeHiddifyOptions(HiddifyOptionsJson *C.char) (CErr *C.char) {
	_, err := v2.ChangeHiddifySettings(&pb.ChangeHiddifySettingsRequest{
		HiddifySettingsJson: C.GoString(HiddifyOptionsJson),
	})
	return emptyOrErrorC(err)
}

//export generateConfig
func generateConfig(path *C.char) (res *C.char) {
	conf, err := v2.GenerateConfig(&pb.GenerateConfigRequest{
		Path: C.GoString(path),
	})
	if err != nil {
		return emptyOrErrorC(err)
	}
	fmt.Printf("Config: %+v\n", conf)
	fmt.Printf("ConfigContent: %+v\n", conf.ConfigContent)
	return C.CString(conf.ConfigContent)
}

//export start
func start(configPath *C.char, disableMemoryLimit bool) (CErr *C.char) {
	_, err := v2.Start(&pb.StartRequest{
		ConfigPath:             C.GoString(configPath),
		EnableOldCommandServer: true,
		DisableMemoryLimit:     disableMemoryLimit,
	})
	return emptyOrErrorC(err)
}

//export stop
func stop() (CErr *C.char) {
	_, err := v2.Stop()
	return emptyOrErrorC(err)
}

//export restart
func restart(configPath *C.char, disableMemoryLimit bool) (CErr *C.char) {
	_, err := v2.Restart(&pb.StartRequest{
		ConfigPath:             C.GoString(configPath),
		EnableOldCommandServer: true,
		DisableMemoryLimit:     disableMemoryLimit,
	})
	return emptyOrErrorC(err)
}

//export startCommandClient
func startCommandClient(command C.int, port C.longlong) *C.char {
	err := v2.StartCommand(int32(command), int64(port))
	return emptyOrErrorC(err)
}

//export stopCommandClient
func stopCommandClient(command C.int) *C.char {
	err := v2.StopCommand(int32(command))
	return emptyOrErrorC(err)
}

//export selectOutbound
func selectOutbound(groupTag *C.char, outboundTag *C.char) (CErr *C.char) {
	_, err := v2.SelectOutbound(&pb.SelectOutboundRequest{
		GroupTag:    C.GoString(groupTag),
		OutboundTag: C.GoString(outboundTag),
	})

	return emptyOrErrorC(err)
}

//export urlTest
func urlTest(groupTag *C.char) (CErr *C.char) {
	_, err := v2.UrlTest(&pb.UrlTestRequest{
		GroupTag: C.GoString(groupTag),
	})

	return emptyOrErrorC(err)
}

func emptyOrErrorC(err error) *C.char {
	if err == nil {
		return C.CString("")
	}
	log.Error(err.Error())
	return C.CString(err.Error())
}

//export listRunningProcesses
func listRunningProcesses() *C.char {
	processes, err := ListRunningProcesses()
	if err != nil {
		return C.CString(fmt.Sprintf(`{"error":"%s"}`, err.Error()))
	}

	jsonBytes, err := json.Marshal(processes)
	if err != nil {
		return C.CString(fmt.Sprintf(`{"error":"%s"}`, err.Error()))
	}
	return C.CString(string(jsonBytes))
}

// WireGuardKeysResult is returned by generateWireGuardKeys
type WireGuardKeysResult struct {
	ServerPrivateKey string `json:"serverPrivateKey"`
	ServerPublicKey  string `json:"serverPublicKey"`
	ClientPrivateKey string `json:"clientPrivateKey"`
	ClientPublicKey  string `json:"clientPublicKey"`
	Error            string `json:"error,omitempty"`
}

//export generateWireGuardKeys
func generateWireGuardKeys() *C.char {
	result := WireGuardKeysResult{}

	// Generate server keys
	serverPriv, serverPub, err := config.GenerateWireGuardKeys()
	if err != nil {
		result.Error = fmt.Sprintf("Failed to generate server keys: %v", err)
		jsonBytes, _ := json.Marshal(result)
		return C.CString(string(jsonBytes))
	}
	result.ServerPrivateKey = serverPriv
	result.ServerPublicKey = serverPub

	// Generate client keys
	clientPriv, clientPub, err := config.GenerateWireGuardKeys()
	if err != nil {
		result.Error = fmt.Sprintf("Failed to generate client keys: %v", err)
		jsonBytes, _ := json.Marshal(result)
		return C.CString(string(jsonBytes))
	}
	result.ClientPrivateKey = clientPriv
	result.ClientPublicKey = clientPub

	jsonBytes, err := json.Marshal(result)
	if err != nil {
		return C.CString(fmt.Sprintf(`{"error":"%s"}`, err.Error()))
	}
	return C.CString(string(jsonBytes))
}

// WireGuardServerInfoResult contains all info needed for UI
type WireGuardServerInfoResult struct {
	LanIP   string `json:"lanIp"`
	Error   string `json:"error,omitempty"`
}

//export getLocalLanIP
func getLocalLanIP() *C.char {
	result := WireGuardServerInfoResult{}

	lanIP, err := config.GetLocalLANIP()
	if err != nil {
		result.Error = fmt.Sprintf("Failed to get LAN IP: %v", err)
		result.LanIP = "?.?.?.?"
	} else {
		result.LanIP = lanIP
	}

	jsonBytes, err := json.Marshal(result)
	if err != nil {
		return C.CString(fmt.Sprintf(`{"error":"%s"}`, err.Error()))
	}
	return C.CString(string(jsonBytes))
}

// XrayLinksResult is returned by getXrayLinks
type XrayLinksResult struct {
	Links []string `json:"links"`
	Count int      `json:"count"`
}

//export getXrayLinks
func getXrayLinks() *C.char {
	links := config.GetXrayLinks()
	result := XrayLinksResult{
		Links: links,
		Count: len(links),
	}

	jsonBytes, err := json.Marshal(result)
	if err != nil {
		return C.CString(fmt.Sprintf(`{"links":[],"count":0,"error":"%s"}`, err.Error()))
	}
	return C.CString(string(jsonBytes))
}

//export hasXrayLinks
func hasXrayLinks() bool {
	return config.HasXrayLinks()
}

// XrayStartResult is returned by startXrayForLink
type XrayStartResult struct {
	Port  uint16 `json:"port"`
	Error string `json:"error,omitempty"`
}

//export startXrayForLink
func startXrayForLink(linkIndex C.int) *C.char {
	result := XrayStartResult{}

	links := config.GetXrayLinks()
	idx := int(linkIndex)
	if idx < 0 || idx >= len(links) {
		result.Error = fmt.Sprintf("invalid link index: %d (have %d links)", idx, len(links))
		jsonBytes, _ := json.Marshal(result)
		return C.CString(string(jsonBytes))
	}

	link := links[idx]
	selector := xray.GetSelector()
	port, err := selector.StartXrayForLink(link)
	if err != nil {
		result.Error = err.Error()
		jsonBytes, _ := json.Marshal(result)
		return C.CString(string(jsonBytes))
	}

	result.Port = port
	jsonBytes, err := json.Marshal(result)
	if err != nil {
		return C.CString(fmt.Sprintf(`{"error":"%s"}`, err.Error()))
	}
	return C.CString(string(jsonBytes))
}

//export stopXray
func stopXray() *C.char {
	selector := xray.GetSelector()
	err := selector.StopXray()
	return emptyOrErrorC(err)
}

//export isXrayRunning
func isXrayRunning() bool {
	selector := xray.GetSelector()
	return selector.IsXrayRunning()
}

// XrayCoreInfoResult contains info about Xray core state
type XrayCoreInfoResult struct {
	Running bool   `json:"running"`
	Port    uint16 `json:"port"`
	Type    string `json:"type"`
}

//export getXrayCoreInfo
func getXrayCoreInfo() *C.char {
	selector := xray.GetSelector()
	info := selector.GetCoreInfo()

	result := XrayCoreInfoResult{
		Running: selector.IsXrayRunning(),
		Port:    info.ListenPort,
		Type:    string(info.Type),
	}

	jsonBytes, err := json.Marshal(result)
	if err != nil {
		return C.CString(fmt.Sprintf(`{"error":"%s"}`, err.Error()))
	}
	return C.CString(string(jsonBytes))
}

//export isXrayOutbound
func isXrayOutbound(tag *C.char) bool {
	return config.IsXrayOutbound(C.GoString(tag))
}

//export getXrayIndexByTag
func getXrayIndexByTag(tag *C.char) C.int {
	return C.int(config.GetXrayIndexByTag(C.GoString(tag)))
}

// StartXrayByTagResult is returned by startXrayByTag
type StartXrayByTagResult struct {
	Port      uint16 `json:"port"`
	IsXray    bool   `json:"is_xray"`
	Error     string `json:"error,omitempty"`
}

//export startXrayByTag
func startXrayByTag(tag *C.char) *C.char {
	result := StartXrayByTagResult{}
	tagStr := C.GoString(tag)

	// Get full xray info (includes RawOutbound if available)
	xrayInfo := config.GetXrayInfoByTag(tagStr)
	if xrayInfo == nil {
		// Not an xray outbound, just return success with isXray=false
		result.IsXray = false
		jsonBytes, _ := json.Marshal(result)
		return C.CString(string(jsonBytes))
	}

	result.IsXray = true
	selector := xray.GetSelector()
	var port uint16
	var err error

	// Prefer RawOutbound (ready Xray JSON) over link parsing
	if xrayInfo.RawOutbound != nil {
		fmt.Printf("[Xray] Starting with raw outbound config for tag=%s\n", tagStr)
		port, err = selector.StartXrayForRawOutbound(xrayInfo.RawOutbound, xrayInfo.RawFragment)
	} else if xrayInfo.Link != "" {
		fmt.Printf("[Xray] Starting with link for tag=%s\n", tagStr)
		port, err = selector.StartXrayForLink(xrayInfo.Link)
	} else {
		result.Error = fmt.Sprintf("no raw outbound or link available for tag: %s", tagStr)
		jsonBytes, _ := json.Marshal(result)
		return C.CString(string(jsonBytes))
	}

	if err != nil {
		result.Error = err.Error()
		jsonBytes, _ := json.Marshal(result)
		return C.CString(string(jsonBytes))
	}

	result.Port = port
	fmt.Printf("[Xray] Started for tag=%s, index=%d, port=%d\n", tagStr, xrayInfo.Index, port)

	jsonBytes, err := json.Marshal(result)
	if err != nil {
		return C.CString(fmt.Sprintf(`{"error":"%s"}`, err.Error()))
	}
	return C.CString(string(jsonBytes))
}

//export setXrayConfigJson
func setXrayConfigJson(configJson *C.char) *C.char {
	jsonStr := C.GoString(configJson)
	err := config.SetXrayConfigFromJson(jsonStr)
	return emptyOrErrorC(err)
}

func main() {}
