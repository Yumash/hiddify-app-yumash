package xray

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strings"
	"sync"
	"time"

	"golang.org/x/net/proxy"
)

// CoreType represents which core is handling traffic
type CoreType string

const (
	CoreTypeSingBox CoreType = "sing-box"
	CoreTypeXray    CoreType = "xray"
)

// XrayFixedPort is the fixed port used for Xray SOCKS proxy
// This allows sing-box socks outbounds to be pre-configured
const XrayFixedPort uint16 = 12380

// CoreInfo provides information about the active core
type CoreInfo struct {
	Type       CoreType `json:"type"`
	Version    string   `json:"version"`
	ListenPort uint16   `json:"listen_port"`
}

// CoreSelector manages selection between sing-box and Xray cores
type CoreSelector struct {
	xrayService   *XrayService
	activeCore    CoreType
	xrayPort      uint16
	singboxPort   uint16
	mu            sync.RWMutex
}

var (
	selector     *CoreSelector
	selectorOnce sync.Once

	// isXrayOutboundFunc is a callback to check if an outbound tag is xray
	// This is set by config package to avoid import cycle
	isXrayOutboundFunc func(tag string) bool
	isXrayOutboundMu   sync.RWMutex
)

// SetIsXrayOutboundFunc sets the callback function for checking xray outbounds
// This should be called from config package during initialization
func SetIsXrayOutboundFunc(fn func(tag string) bool) {
	isXrayOutboundMu.Lock()
	defer isXrayOutboundMu.Unlock()
	isXrayOutboundFunc = fn
}

// IsXrayOutboundTag checks if an outbound tag is an xray outbound
// Uses the callback set by config package
func IsXrayOutboundTag(tag string) bool {
	isXrayOutboundMu.RLock()
	defer isXrayOutboundMu.RUnlock()
	if isXrayOutboundFunc != nil {
		return isXrayOutboundFunc(tag)
	}
	return false
}

// GetSelector returns the global CoreSelector instance
func GetSelector() *CoreSelector {
	selectorOnce.Do(func() {
		selector = &CoreSelector{
			activeCore: CoreTypeSingBox,
		}
	})
	return selector
}

// ActiveCore returns the currently active core type
func (cs *CoreSelector) ActiveCore() CoreType {
	cs.mu.RLock()
	defer cs.mu.RUnlock()
	return cs.activeCore
}

// GetCoreInfo returns information about the active core
func (cs *CoreSelector) GetCoreInfo() CoreInfo {
	cs.mu.RLock()
	defer cs.mu.RUnlock()

	info := CoreInfo{
		Type: cs.activeCore,
	}

	if cs.activeCore == CoreTypeXray {
		info.Version = "v25.12.8" // Hardcoded for now
		info.ListenPort = cs.xrayPort
	} else {
		info.Version = "1.12.14"
		info.ListenPort = cs.singboxPort
	}

	return info
}

// SetSingBoxPort sets the sing-box listen port (called when sing-box starts)
func (cs *CoreSelector) SetSingBoxPort(port uint16) {
	cs.mu.Lock()
	defer cs.mu.Unlock()
	cs.singboxPort = port
}

// StartXrayForLink starts Xray for a proxy link that requires it
// Returns the SOCKS port to connect to (always XrayFixedPort)
func (cs *CoreSelector) StartXrayForLink(link string) (uint16, error) {
	cs.mu.Lock()
	defer cs.mu.Unlock()

	// Stop existing Xray if running
	if cs.xrayService != nil {
		cs.xrayService.Close()
		cs.xrayService = nil
	}

	// Parse the link
	proxyLink, err := ParseLink(link)
	if err != nil {
		return 0, fmt.Errorf("failed to parse link: %w", err)
	}

	// Use fixed port for Xray - allows sing-box socks outbounds to be pre-configured
	port := XrayFixedPort

	// Create Xray config
	config, err := proxyLink.ToXrayConfig(port)
	if err != nil {
		return 0, fmt.Errorf("failed to create config: %w", err)
	}

	// Start Xray service
	service, err := NewService(config, port)
	if err != nil {
		return 0, fmt.Errorf("failed to create xray service: %w", err)
	}

	if err := service.Start(); err != nil {
		return 0, fmt.Errorf("failed to start xray: %w", err)
	}

	cs.xrayService = service
	cs.xrayPort = port
	cs.activeCore = CoreTypeXray

	return port, nil
}

// StartXrayForRawOutbound starts Xray using a raw outbound config from Hiddify Manager
// This is more reliable than parsing links as the config is already in correct format
// rawOutbound is the xray_outbound_raw object, rawFragment is optional xray_fragment settings
func (cs *CoreSelector) StartXrayForRawOutbound(rawOutbound map[string]interface{}, rawFragment map[string]interface{}) (uint16, error) {
	cs.mu.Lock()
	defer cs.mu.Unlock()

	// Stop existing Xray if running
	if cs.xrayService != nil {
		cs.xrayService.Close()
		cs.xrayService = nil
	}

	port := XrayFixedPort

	// Create full Xray config with inbounds and the raw outbound
	config := &Config{
		Log: &LogConfig{
			Loglevel: "warning",
		},
		Inbounds: []Inbound{
			{
				Tag:      "socks-in",
				Port:     port,
				Listen:   "127.0.0.1",
				Protocol: "socks",
				Settings: json.RawMessage(`{"auth":"noauth","udp":true}`),
				Sniffing: &Sniffing{
					Enabled:      true,
					DestOverride: []string{"http", "tls"},
				},
			},
		},
		Outbounds: []Outbound{},
		Routing: &RoutingConfig{
			DomainStrategy: "IPIfNonMatch",
			Rules: []RoutingRule{
				{
					Type:        "field",
					OutboundTag: "proxy",
					InboundTag:  []string{"socks-in"},
				},
			},
		},
	}

	// Convert raw outbound to Outbound struct
	outboundJson, err := json.Marshal(rawOutbound)
	if err != nil {
		return 0, fmt.Errorf("failed to marshal raw outbound: %w", err)
	}

	var outbound Outbound
	if err := json.Unmarshal(outboundJson, &outbound); err != nil {
		return 0, fmt.Errorf("failed to unmarshal raw outbound: %w", err)
	}

	// Set proxy tag for routing
	outbound.Tag = "proxy"
	config.Outbounds = append(config.Outbounds, outbound)

	// Add direct outbound
	config.Outbounds = append(config.Outbounds, Outbound{
		Tag:      "direct",
		Protocol: "freedom",
	})

	// Apply fragment settings if present
	if rawFragment != nil {
		// TODO: Apply xray_fragment settings to streamSettings.sockopt
		// Fragment settings include: packets, length, interval
		fmt.Printf("[Xray] Fragment settings provided but not yet applied: %v\n", rawFragment)
	}

	// Start Xray service
	service, err := NewService(config, port)
	if err != nil {
		return 0, fmt.Errorf("failed to create xray service: %w", err)
	}

	if err := service.Start(); err != nil {
		return 0, fmt.Errorf("failed to start xray: %w", err)
	}

	cs.xrayService = service
	cs.xrayPort = port
	cs.activeCore = CoreTypeXray

	return port, nil
}

// StopXray stops the Xray service and switches back to sing-box
func (cs *CoreSelector) StopXray() error {
	cs.mu.Lock()
	defer cs.mu.Unlock()

	if cs.xrayService != nil {
		err := cs.xrayService.Close()
		cs.xrayService = nil
		cs.xrayPort = 0
		cs.activeCore = CoreTypeSingBox
		return err
	}

	cs.activeCore = CoreTypeSingBox
	return nil
}

// IsXrayRunning returns whether Xray is currently running
func (cs *CoreSelector) IsXrayRunning() bool {
	cs.mu.RLock()
	defer cs.mu.RUnlock()
	return cs.xrayService != nil && cs.xrayService.IsRunning()
}

// GetXrayPort returns the Xray SOCKS port (0 if not running)
func (cs *CoreSelector) GetXrayPort() uint16 {
	cs.mu.RLock()
	defer cs.mu.RUnlock()
	return cs.xrayPort
}

// TestConnection tests connectivity through the active core
func (cs *CoreSelector) TestConnection(testURL string) (time.Duration, error) {
	cs.mu.RLock()
	port := cs.xrayPort
	if cs.activeCore == CoreTypeSingBox {
		port = cs.singboxPort
	}
	cs.mu.RUnlock()

	if port == 0 {
		return 0, fmt.Errorf("no active core")
	}

	dialer, err := proxy.SOCKS5("tcp", fmt.Sprintf("127.0.0.1:%d", port), nil, proxy.Direct)
	if err != nil {
		return 0, fmt.Errorf("failed to create dialer: %w", err)
	}

	transport := &http.Transport{
		Dial: dialer.Dial,
	}

	client := &http.Client{
		Transport: transport,
		Timeout:   10 * time.Second,
	}

	start := time.Now()
	resp, err := client.Head(testURL)
	if err != nil {
		return 0, err
	}
	resp.Body.Close()

	return time.Since(start), nil
}

// ShouldUseXray determines if a config requires Xray-core
func ShouldUseXray(configContent string) bool {
	// Check for XHTTP transport indicators
	lowerContent := strings.ToLower(configContent)

	// Xray-specific transports
	if strings.Contains(lowerContent, `"network":"xhttp"`) ||
		strings.Contains(lowerContent, `"network":"splithttp"`) ||
		strings.Contains(lowerContent, `type=xhttp`) ||
		strings.Contains(lowerContent, `type=splithttp`) {
		return true
	}

	// Future: add more Xray-specific features here
	return false
}

// DetectCoreFromLinks analyzes proxy links and returns recommended core
func DetectCoreFromLinks(links []string) CoreType {
	for _, link := range links {
		if NeedsXrayForLink(link) {
			return CoreTypeXray
		}
	}
	return CoreTypeSingBox
}
