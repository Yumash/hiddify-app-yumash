package ray2sing

import (
	"encoding/json"
	"fmt"
	"net/url"
	"runtime"
	"strconv"
	"strings"

	C "github.com/sagernet/sing-box/constant"
	T "github.com/sagernet/sing-box/option"
	E "github.com/sagernet/sing/common/exceptions"
)

// ConvertResult contains both sing-box outbounds and xray-required links
type ConvertResult struct {
	SingboxConfig string      // JSON with sing-box outbounds
	XrayLinks     []string    // Links requiring Xray-core (xhttp transport)
	XrayOutbounds []XrayProxy // Parsed xray proxy info for socks outbounds
}

// XrayProxy contains info about an xhttp proxy for chain proxy setup
type XrayProxy struct {
	Tag       string // Outbound tag in sing-box
	Link      string // Original link for Xray
	Index     int    // Index in xrayLinks array
	ProxyName string // Display name from link
}

var configTypes = map[string]ParserFunc{
	"vmess://":     VmessSingbox,
	"vless://":     VlessSingbox,
	"trojan://":    TrojanSingbox,
	"svmess://":    VmessSingbox,
	"svless://":    VlessSingbox,
	"strojan://":   TrojanSingbox,
	"ss://":        ShadowsocksSingbox,
	"tuic://":      TuicSingbox,
	"hysteria://":  HysteriaSingbox,
	"hysteria2://": Hysteria2Singbox,
	"hy2://":       Hysteria2Singbox,
	"ssh://":       SSHSingbox,
	"wg://":        WiregaurdSingbox,
	"wireguard://": WiregaurdSingbox,
	"ssconf://":    BeepassSingbox,
	// "warp://" removed - WARP is blocked in Russia
	"direct://": DirectSingbox,
	"socks://":  SocksSingbox,
	"phttp://":  HttpSingbox,
	"phttps://": HttpsSingbox,
	"http://":   HttpSingbox,
	"https://":  HttpsSingbox,
}

func decodeUrlBase64IfNeeded(config string) string {
	splt := strings.SplitN(config, "://", 2)
	if len(splt) < 2 {
		//return config
	}
	rest, _ := decodeBase64IfNeeded(splt[1])
	return splt[0] + "://" + rest
}

func processSingleConfig(config string, useXrayWhenPossible bool) (outbound *T.Outbound, err error) {
	defer func() {
		if r := recover(); r != nil {
			outbound = nil
			stackTrace := make([]byte, 1024)
			s := runtime.Stack(stackTrace, false)
			stackStr := fmt.Sprint(string(stackTrace[:s]))
			err = E.New("Error in Parsing:", r, "Stack trace:", stackStr)
		}
	}()

	var configSingbox *T.Outbound
	for k, v := range configTypes {
		if strings.HasPrefix(config, k) {
			configSingbox, err = v(config)
			break
		}
	}

	if err != nil {
		return nil, err
	}
	if configSingbox == nil {
		return nil, E.New("Not supported config type")
	}
	if configSingbox.Tag == "" {
		configSingbox.Tag = configSingbox.Type
	}

	return configSingbox, nil
}

// extractDialerOptions extracts DialerOptions from outbound Options using type assertion
func extractDialerOptions(configSingbox *T.Outbound) *T.DialerOptions {
	if configSingbox.Options == nil {
		return nil
	}

	switch configSingbox.Type {
	case C.TypeWireGuard:
		if opts, ok := configSingbox.Options.(*T.LegacyWireGuardOutboundOptions); ok {
			return &opts.DialerOptions
		}
	case C.TypeVLESS:
		if opts, ok := configSingbox.Options.(*T.VLESSOutboundOptions); ok {
			return &opts.DialerOptions
		}
	case C.TypeVMess:
		if opts, ok := configSingbox.Options.(*T.VMessOutboundOptions); ok {
			return &opts.DialerOptions
		}
	case C.TypeDirect:
		if opts, ok := configSingbox.Options.(*T.DirectOutboundOptions); ok {
			return &opts.DialerOptions
		}
	case C.TypeTrojan:
		if opts, ok := configSingbox.Options.(*T.TrojanOutboundOptions); ok {
			return &opts.DialerOptions
		}
	case C.TypeHysteria:
		if opts, ok := configSingbox.Options.(*T.HysteriaOutboundOptions); ok {
			return &opts.DialerOptions
		}
	case C.TypeHysteria2:
		if opts, ok := configSingbox.Options.(*T.Hysteria2OutboundOptions); ok {
			return &opts.DialerOptions
		}
	case C.TypeTUIC:
		if opts, ok := configSingbox.Options.(*T.TUICOutboundOptions); ok {
			return &opts.DialerOptions
		}
	case C.TypeSSH:
		if opts, ok := configSingbox.Options.(*T.SSHOutboundOptions); ok {
			return &opts.DialerOptions
		}
	case C.TypeShadowsocks:
		if opts, ok := configSingbox.Options.(*T.ShadowsocksOutboundOptions); ok {
			return &opts.DialerOptions
		}
	}
	return nil
}

// extractProxyName extracts display name from a proxy link
func extractProxyName(link string) string {
	// Try to get name from fragment (after #)
	if idx := strings.LastIndex(link, "#"); idx != -1 {
		name := link[idx+1:]
		// URL decode the fragment
		if decoded, err := url.QueryUnescape(name); err == nil && decoded != "" {
			return decoded
		}
		return name
	}
	// Fallback: use protocol type
	if idx := strings.Index(link, "://"); idx != -1 {
		return link[:idx]
	}
	return "xhttp"
}

// XrayFixedPort is the fixed port used for Xray SOCKS proxy
// Must match the value in xray/core_selector.go
const XrayFixedPort uint16 = 12380

// createXraySocksOutbound creates a socks outbound that points to local Xray
// The tag includes special marker [xray:INDEX] for identification
func createXraySocksOutbound(proxyName string, xrayIndex int, counter int) T.Outbound {
	// Tag format: "ProxyName [xray:0] § 5" - allows identification of xray proxies
	tag := fmt.Sprintf("%s [xray:%d] § %d", proxyName, xrayIndex, counter)

	return T.Outbound{
		Type: C.TypeSOCKS,
		Tag:  tag,
		Options: &T.SOCKSOutboundOptions{
			// Xray always listens on fixed port, so socks outbound can be pre-configured
			ServerOptions: T.ServerOptions{
				Server:     "127.0.0.1",
				ServerPort: XrayFixedPort,
			},
		},
	}
}

func GenerateConfigLite(input string, useXrayWhenPossible bool) (string, error) {
	configArray := strings.Split(strings.ReplaceAll(input, "\r", "\n"), "\n")

	fmt.Printf("[GenerateConfigLite] Processing %d lines, useXrayWhenPossible=%v\n", len(configArray), useXrayWhenPossible)

	var outbounds []T.Outbound
	counter := 0
	skippedCount := 0
	for _, config := range configArray {
		if len(config) < 5 || config[0] == '#' || config[0] == '/' {
			continue
		}
		detourTag := ""

		chains := strings.Split(config, "&&detour=")
		for _, chain1 := range chains {
			chain, _ := decodeBase64IfNeeded(chain1)
			configSingbox, err := processSingleConfig(chain, useXrayWhenPossible)

			if err != nil {
				fmt.Printf("[GenerateConfigLite] SKIPPED: %s... - error: %v\n", chain[:min(50, len(chain))], err)
				skippedCount++
				continue
			}
			configSingbox.Tag += " § " + strconv.Itoa(counter)
			fmt.Printf("[GenerateConfigLite] PARSED: type=%s tag=%s\n", configSingbox.Type, configSingbox.Tag)

			dialer := extractDialerOptions(configSingbox)
			if dialer != nil {
				dialer.Detour = detourTag
			}
			detourTag = configSingbox.Tag

			outbounds = append(outbounds, *configSingbox)
			counter += 1
		}
	}
	fmt.Printf("[GenerateConfigLite] Total parsed: %d, skipped: %d\n", len(outbounds), skippedCount)
	if len(outbounds) == 0 {
		return "", E.New("No outbounds found")
	}
	fullConfig := T.Options{
		Outbounds: outbounds,
	}

	jsonOutbound, err := json.MarshalIndent(fullConfig, "", "  ")
	if err != nil {
		return "", err
	}
	return string(jsonOutbound), nil
}

func Ray2Singbox(configs string, useXrayWhenPossible bool) (out string, err error) {
	defer func() {
		if r := recover(); r != nil {
			out = ""
			stackTrace := make([]byte, 1024)
			s := runtime.Stack(stackTrace, false)
			stackStr := fmt.Sprint(string(stackTrace[:s]))
			err = E.New("Error in Parsing", configs, r, "Stack trace:", stackStr)
		}
	}()

	configs, _ = decodeBase64IfNeeded(configs)

	convertedData, err := GenerateConfigLite(configs, useXrayWhenPossible)
	return convertedData, err
}

// Ray2SingboxWithXray converts configs and returns both sing-box outbounds and xray links
func Ray2SingboxWithXray(configs string, useXrayWhenPossible bool) (result *ConvertResult, err error) {
	defer func() {
		if r := recover(); r != nil {
			result = nil
			stackTrace := make([]byte, 1024)
			s := runtime.Stack(stackTrace, false)
			stackStr := fmt.Sprint(string(stackTrace[:s]))
			err = E.New("Error in Parsing", configs, r, "Stack trace:", stackStr)
		}
	}()

	configs, _ = decodeBase64IfNeeded(configs)

	return GenerateConfigWithXray(configs, useXrayWhenPossible)
}

// GenerateConfigWithXray processes configs and creates socks outbounds for xhttp links
func GenerateConfigWithXray(input string, useXrayWhenPossible bool) (*ConvertResult, error) {
	configArray := strings.Split(strings.ReplaceAll(input, "\r", "\n"), "\n")

	fmt.Printf("[GenerateConfigWithXray] Processing %d lines\n", len(configArray))

	var outbounds []T.Outbound
	var xrayLinks []string
	var xrayOutbounds []XrayProxy
	counter := 0
	xrayIndex := 0

	for _, config := range configArray {
		config = strings.TrimSpace(config)
		if len(config) < 5 || config[0] == '#' || config[0] == '/' {
			continue
		}

		detourTag := ""
		chains := strings.Split(config, "&&detour=")

		for _, chain1 := range chains {
			chain, _ := decodeBase64IfNeeded(chain1)
			configSingbox, err := processSingleConfig(chain, useXrayWhenPossible)

			if err != nil {
				// Check if this is an xhttp link that needs Xray
				if IsXHTTPError(err) {
					proxyName := extractProxyName(chain)
					fmt.Printf("[GenerateConfigWithXray] XHTTP link found, creating socks outbound: %s\n", proxyName)

					// Save link for Xray
					xrayLinks = append(xrayLinks, chain)

					// Create socks outbound pointing to local Xray
					socksOutbound := createXraySocksOutbound(proxyName, xrayIndex, counter)

					// Save xray proxy info
					xrayOutbounds = append(xrayOutbounds, XrayProxy{
						Tag:       socksOutbound.Tag,
						Link:      chain,
						Index:     xrayIndex,
						ProxyName: proxyName,
					})

					outbounds = append(outbounds, socksOutbound)
					xrayIndex++
					counter++
					continue
				}
				fmt.Printf("[GenerateConfigWithXray] SKIPPED: %s... - error: %v\n", chain[:min(50, len(chain))], err)
				continue
			}

			configSingbox.Tag += " § " + strconv.Itoa(counter)
			fmt.Printf("[GenerateConfigWithXray] PARSED: type=%s tag=%s\n", configSingbox.Type, configSingbox.Tag)

			dialer := extractDialerOptions(configSingbox)
			if dialer != nil {
				dialer.Detour = detourTag
			}
			detourTag = configSingbox.Tag

			outbounds = append(outbounds, *configSingbox)
			counter++
		}
	}

	fmt.Printf("[GenerateConfigWithXray] Total: singbox=%d, xray=%d\n", len(outbounds)-len(xrayLinks), len(xrayLinks))

	// We need at least some outbounds
	if len(outbounds) == 0 {
		return nil, E.New("No outbounds found")
	}

	fullConfig := T.Options{
		Outbounds: outbounds,
	}

	jsonOutbound, err := json.MarshalIndent(fullConfig, "", "  ")
	if err != nil {
		return nil, err
	}

	return &ConvertResult{
		SingboxConfig: string(jsonOutbound),
		XrayLinks:     xrayLinks,
		XrayOutbounds: xrayOutbounds,
	}, nil
}
