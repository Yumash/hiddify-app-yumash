package config

import (
	"bytes"
	_ "embed"
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"regexp"
	"strings"
	"sync"

	"github.com/hiddify/hiddify-core/xray"
	"github.com/hiddify/ray2sing/ray2sing"
	"github.com/sagernet/sing-box/experimental/libbox"
	"github.com/sagernet/sing-box/option"
	"github.com/xmdhs/clash2singbox/convert"
	"github.com/xmdhs/clash2singbox/model/clash"
	"gopkg.in/yaml.v3"
)

func init() {
	// Register xray outbound checker callback to avoid import cycle
	xray.SetIsXrayOutboundFunc(IsXrayOutbound)
}
// XrayProxyInfo contains info about an xhttp proxy
type XrayProxyInfo struct {
	Tag         string                 `json:"tag"`
	Link        string                 `json:"link"`
	Index       int                    `json:"index"`
	ProxyName   string                 `json:"proxy_name"`
	RawOutbound map[string]interface{} `json:"raw_outbound,omitempty"` // Raw Xray outbound JSON from Hiddify Manager
	RawFragment map[string]interface{} `json:"raw_fragment,omitempty"` // Raw xray_fragment settings
}

// XrayLinksStore holds xhttp links that require Xray-core
var (
	xrayLinksStore    []string
	xrayOutboundsInfo []XrayProxyInfo
	xrayLinksMutex    sync.RWMutex
)

// GetXrayLinks returns stored xray links
func GetXrayLinks() []string {
	xrayLinksMutex.RLock()
	defer xrayLinksMutex.RUnlock()
	result := make([]string, len(xrayLinksStore))
	copy(result, xrayLinksStore)
	return result
}

// GetXrayOutboundsInfo returns info about xray outbounds
func GetXrayOutboundsInfo() []XrayProxyInfo {
	xrayLinksMutex.RLock()
	defer xrayLinksMutex.RUnlock()
	result := make([]XrayProxyInfo, len(xrayOutboundsInfo))
	copy(result, xrayOutboundsInfo)
	return result
}

// SetXrayLinks stores xray links and outbounds info
func SetXrayLinks(links []string, outbounds []XrayProxyInfo) {
	xrayLinksMutex.Lock()
	defer xrayLinksMutex.Unlock()
	xrayLinksStore = make([]string, len(links))
	copy(xrayLinksStore, links)
	xrayOutboundsInfo = make([]XrayProxyInfo, len(outbounds))
	copy(xrayOutboundsInfo, outbounds)
}

// ClearXrayLinks clears stored xray links
func ClearXrayLinks() {
	xrayLinksMutex.Lock()
	defer xrayLinksMutex.Unlock()
	xrayLinksStore = nil
	xrayOutboundsInfo = nil
}

// HasXrayLinks checks if there are xray links stored
func HasXrayLinks() bool {
	xrayLinksMutex.RLock()
	defer xrayLinksMutex.RUnlock()
	return len(xrayLinksStore) > 0
}

// GetXrayIndexByTag returns xray link index by outbound tag, -1 if not found
func GetXrayIndexByTag(tag string) int {
	xrayLinksMutex.RLock()
	defer xrayLinksMutex.RUnlock()
	for _, info := range xrayOutboundsInfo {
		if info.Tag == tag {
			return info.Index
		}
	}
	return -1
}

// IsXrayOutbound checks if tag belongs to an xray outbound
func IsXrayOutbound(tag string) bool {
	return GetXrayIndexByTag(tag) >= 0
}

// GetXrayInfoByTag returns full XrayProxyInfo by outbound tag
// Returns nil if not found
func GetXrayInfoByTag(tag string) *XrayProxyInfo {
	xrayLinksMutex.RLock()
	defer xrayLinksMutex.RUnlock()
	for _, info := range xrayOutboundsInfo {
		if info.Tag == tag {
			// Return a copy
			infoCopy := info
			return &infoCopy
		}
	}
	return nil
}

// xrayConfigJson stores raw Xray JSON config from Hiddify Manager /xray endpoint
var (
	xrayConfigJson   string
	xrayConfigMutex  sync.RWMutex
)

// SetXrayConfigFromJson stores Xray config JSON from Hiddify Manager
// This parses the JSON to extract outbound tags and links
func SetXrayConfigFromJson(jsonStr string) error {
	xrayConfigMutex.Lock()
	defer xrayConfigMutex.Unlock()

	xrayConfigJson = jsonStr

	// Parse JSON to extract outbound info
	// Xray /xray endpoint returns array of configs
	var configs []map[string]interface{}
	if err := json.Unmarshal([]byte(jsonStr), &configs); err != nil {
		// Try as single config
		var singleConfig map[string]interface{}
		if err2 := json.Unmarshal([]byte(jsonStr), &singleConfig); err2 != nil {
			return fmt.Errorf("failed to parse xray config JSON: %w", err)
		}
		configs = []map[string]interface{}{singleConfig}
	}

	// Extract outbounds from all configs
	var links []string
	var outboundsInfo []XrayProxyInfo

	for _, cfg := range configs {
		outbounds, ok := cfg["outbounds"].([]interface{})
		if !ok {
			continue
		}

		for _, ob := range outbounds {
			obMap, ok := ob.(map[string]interface{})
			if !ok {
				continue
			}

			tag, _ := obMap["tag"].(string)
			protocol, _ := obMap["protocol"].(string)

			// Skip non-proxy outbounds
			if protocol == "freedom" || protocol == "blackhole" || tag == "direct" || tag == "block" {
				continue
			}

			// Store as a link placeholder (we'll use the full config for Xray)
			linkPlaceholder := fmt.Sprintf("xray-config://%s", tag)
			links = append(links, linkPlaceholder)
			outboundsInfo = append(outboundsInfo, XrayProxyInfo{
				Tag:       tag,
				Link:      linkPlaceholder,
				Index:     len(links) - 1,
				ProxyName: tag,
			})
		}
	}

	// Store extracted info
	xrayLinksMutex.Lock()
	xrayLinksStore = links
	xrayOutboundsInfo = outboundsInfo
	xrayLinksMutex.Unlock()

	fmt.Printf("[Parser] SetXrayConfigFromJson: stored %d xray outbounds\n", len(outboundsInfo))
	return nil
}

// GetXrayConfigJson returns stored Xray JSON config
func GetXrayConfigJson() string {
	xrayConfigMutex.RLock()
	defer xrayConfigMutex.RUnlock()
	return xrayConfigJson
}

// Supported sing-box outbound types
var supportedOutboundTypes = map[string]bool{
	"direct":       true,
	"block":        true,
	"socks":        true,
	"http":         true,
	"shadowsocks":  true,
	"vmess":        true,
	"trojan":       true,
	"naive":        true,
	"wireguard":    true,
	"hysteria":     true,
	"tor":          true,
	"ssh":          true,
	"shadowtls":    true,
	"shadowsocksr": true,
	"vless":        true,
	"tuic":         true,
	"hysteria2":    true,
	"selector":     true,
	"urltest":      true,
	"dns":          true,
	"anytls":       true,
}

//go:embed config.json.template
var configByte []byte

// ConfigFormat represents the detected format of the config
type ConfigFormat int

const (
	FormatUnknown ConfigFormat = iota
	FormatSingboxJSON
	FormatV2rayLinks
	FormatClash
)

// detectFormat determines the format of the config content
func detectFormat(content []byte) ConfigFormat {
	trimmed := bytes.TrimSpace(content)
	if len(trimmed) == 0 {
		return FormatUnknown
	}

	// Check for JSON object or array
	if trimmed[0] == '{' || trimmed[0] == '[' {
		return FormatSingboxJSON
	}

	// Check for YAML (Clash format) - starts with specific keys or has "proxies:"
	contentStr := string(trimmed)
	if strings.HasPrefix(contentStr, "proxies:") ||
		strings.HasPrefix(contentStr, "port:") ||
		strings.HasPrefix(contentStr, "mixed-port:") {
		return FormatClash
	}

	// Check for V2ray links (base64 or plain text links)
	// V2ray subscriptions are either:
	// 1. Base64 encoded text
	// 2. Plain text with protocol:// links
	if isV2rayFormat(contentStr) {
		return FormatV2rayLinks
	}

	// Try to decode as base64 and check again
	decoded, err := decodeBase64IfNeeded(contentStr)
	if err == nil && decoded != contentStr {
		if isV2rayFormat(decoded) {
			return FormatV2rayLinks
		}
	}

	return FormatUnknown
}

// isV2rayFormat checks if content looks like V2ray subscription links
func isV2rayFormat(content string) bool {
	lines := strings.Split(content, "\n")
	v2rayPrefixes := []string{
		"vmess://", "vless://", "trojan://", "ss://", "ssr://",
		"hysteria://", "hysteria2://", "hy2://", "tuic://",
		"wg://", "wireguard://", "ssh://", "socks://", "http://", "https://",
	}

	validLines := 0
	for _, line := range lines {
		line = strings.TrimSpace(line)
		if line == "" || strings.HasPrefix(line, "#") || strings.HasPrefix(line, "//") {
			continue
		}
		for _, prefix := range v2rayPrefixes {
			if strings.HasPrefix(line, prefix) {
				validLines++
				break
			}
		}
	}

	// If at least one valid V2ray link found, treat as V2ray format
	return validLines > 0
}

// decodeBase64IfNeeded tries to decode base64 content
func decodeBase64IfNeeded(content string) (string, error) {
	return ray2sing.DecodeBase64IfNeeded(content)
}

// ParseConfig reads and parses a config file
func ParseConfig(path string, debug bool) ([]byte, error) {
	content, err := os.ReadFile(path)
	os.Chdir(filepath.Dir(path))
	if err != nil {
		return nil, err
	}
	return ParseConfigContent(string(content), debug, nil, false)
}

// ParseConfigContentToOptions parses content and returns sing-box Options
func ParseConfigContentToOptions(contentstr string, debug bool, configOpt *HiddifyOptions, fullConfig bool) (*option.Options, error) {
	content, err := ParseConfigContent(contentstr, debug, configOpt, fullConfig)
	if err != nil {
		return nil, err
	}
	var options option.Options
	err = json.Unmarshal(content, &options)
	if err != nil {
		return nil, err
	}
	return &options, nil
}

// ParseConfigContent is the main entry point for parsing subscription content
// It detects the format and delegates to the appropriate parser
func ParseConfigContent(contentstr string, debug bool, configOpt *HiddifyOptions, fullConfig bool) ([]byte, error) {
	if configOpt == nil {
		configOpt = DefaultHiddifyOptions()
	}

	content := []byte(contentstr)
	format := detectFormat(content)

	if debug {
		fmt.Printf("[Parser] Content length: %d bytes\n", len(content))
		fmt.Printf("[Parser] Detected format: %v\n", formatName(format))
	}

	switch format {
	case FormatSingboxJSON:
		return parseSingboxJSON(content, configOpt, fullConfig, debug)

	case FormatV2rayLinks:
		return parseV2rayLinks(content, configOpt, debug)

	case FormatClash:
		return parseClash(content, configOpt, debug)

	default:
		// Try each parser in order as fallback
		if result, err := parseV2rayLinks(content, configOpt, debug); err == nil {
			return result, nil
		}
		if result, err := parseSingboxJSON(content, configOpt, fullConfig, debug); err == nil {
			return result, nil
		}
		if result, err := parseClash(content, configOpt, debug); err == nil {
			return result, nil
		}
		return nil, fmt.Errorf("unable to determine config format")
	}
}

func formatName(f ConfigFormat) string {
	switch f {
	case FormatSingboxJSON:
		return "SingboxJSON"
	case FormatV2rayLinks:
		return "V2rayLinks"
	case FormatClash:
		return "Clash"
	default:
		return "Unknown"
	}
}

// parseSingboxJSON parses sing-box native JSON config
func parseSingboxJSON(content []byte, configOpt *HiddifyOptions, fullConfig bool, debug bool) ([]byte, error) {
	var jsonObj map[string]interface{}

	decoder := json.NewDecoder(bytes.NewReader(content))
	if err := decoder.Decode(&jsonObj); err != nil {
		return nil, fmt.Errorf("[SingboxParser] JSON decode error: %w", err)
	}

	// Must have outbounds array
	outbounds, ok := jsonObj["outbounds"]
	if !ok {
		return nil, fmt.Errorf("[SingboxParser] missing 'outbounds' field")
	}

	outboundsArr, ok := outbounds.([]interface{})
	if !ok {
		return nil, fmt.Errorf("[SingboxParser] 'outbounds' is not an array")
	}

	if len(outboundsArr) == 0 {
		return nil, fmt.Errorf("[SingboxParser] empty 'outbounds' array")
	}

	// Clean unsupported Hiddify Manager fields that sing-box doesn't understand
	cleanHiddifyManagerFields(jsonObj, debug)

	// Convert xray type outbounds to socks outbounds pointing to local Xray
	xrayLinks, xrayInfos := convertXrayOutboundsToSocks(jsonObj, debug)
	if len(xrayLinks) > 0 {
		SetXrayLinks(xrayLinks, xrayInfos)
		if debug {
			fmt.Printf("[SingboxParser] Created %d socks outbounds for Xray proxies\n", len(xrayLinks))
		}
	} else {
		ClearXrayLinks()
	}

	// Filter unsupported outbounds (xray type already converted above)
	removedTypes, removedCount := filterUnsupportedOutbounds(jsonObj)
	if debug && removedCount > 0 {
		fmt.Printf("[SingboxParser] Filtered %d unsupported outbounds: %v\n", removedCount, removedTypes)
	}

	// Check if we have any outbounds left
	if outbounds, ok := jsonObj["outbounds"].([]interface{}); !ok || len(outbounds) == 0 {
		return nil, fmt.Errorf("[SingboxParser] no supported outbounds found (removed: %v)", removedTypes)
	}

	// If not full config mode, extract only outbounds
	var result map[string]interface{}
	if fullConfig || configOpt.EnableFullConfig {
		result = jsonObj
	} else {
		result = map[string]interface{}{
			"outbounds": jsonObj["outbounds"],
		}
	}

	newContent, err := json.MarshalIndent(result, "", "  ")
	if err != nil {
		return nil, fmt.Errorf("[SingboxParser] marshal error: %w", err)
	}

	return finalizeConfig(newContent, "SingboxParser", configOpt, debug)
}

// parseV2rayLinks parses V2ray subscription links (base64 or plain text)
func parseV2rayLinks(content []byte, configOpt *HiddifyOptions, debug bool) ([]byte, error) {
	contentStr := string(content)
	
	// Sanitize links before conversion to fix DNS/TLS issues
	if debug {
		fmt.Printf("[V2rayParser] Sanitizing links for DNS/TLS issues\n")
	}
	contentStr = sanitizeV2rayLinks(contentStr, debug)
	
	// Use new function that creates socks outbounds for xray links
	convertResult, err := ray2sing.Ray2SingboxWithXray(contentStr, configOpt.UseXrayCoreWhenPossible)
	if err != nil {
		return nil, fmt.Errorf("[V2rayParser] conversion failed: %w", err)
	}

	// Store xray links and outbound info for later use
	if len(convertResult.XrayLinks) > 0 {
		// Convert ray2sing.XrayProxy to config.XrayProxyInfo
		outboundsInfo := make([]XrayProxyInfo, len(convertResult.XrayOutbounds))
		for i, xp := range convertResult.XrayOutbounds {
			outboundsInfo[i] = XrayProxyInfo{
				Tag:       xp.Tag,
				Link:      xp.Link,
				Index:     xp.Index,
				ProxyName: xp.ProxyName,
			}
		}
		SetXrayLinks(convertResult.XrayLinks, outboundsInfo)
		if debug {
			fmt.Printf("[V2rayParser] Stored %d xray links with socks outbounds for Xray-core\n", len(convertResult.XrayLinks))
		}
	} else {
		ClearXrayLinks()
	}

	// Check if we have outbounds (now includes xray socks outbounds)
	if convertResult.SingboxConfig == "" {
		return nil, fmt.Errorf("[V2rayParser] no outbounds found")
	}

	if debug {
		fmt.Printf("[V2rayParser] Converted successfully, total outbounds config length: %d, xray proxies: %d\n",
			len(convertResult.SingboxConfig), len(convertResult.XrayLinks))
	}

	return finalizeConfig([]byte(convertResult.SingboxConfig), "V2rayParser", configOpt, debug)
}

// parseClash parses Clash YAML config
func parseClash(content []byte, configOpt *HiddifyOptions, debug bool) ([]byte, error) {
	var clashObj clash.Clash
	if err := yaml.Unmarshal(content, &clashObj); err != nil {
		return nil, fmt.Errorf("[ClashParser] YAML parse error: %w", err)
	}

	if clashObj.Proxies == nil || len(clashObj.Proxies) == 0 {
		return nil, fmt.Errorf("[ClashParser] no proxies found")
	}

	converted, err := convert.Clash2sing(clashObj)
	if err != nil {
		return nil, fmt.Errorf("[ClashParser] conversion error: %w", err)
	}

	output := configByte
	output, err = convert.Patch(output, converted, "", "", nil)
	if err != nil {
		return nil, fmt.Errorf("[ClashParser] patch error: %w", err)
	}

	return finalizeConfig(output, "ClashParser", configOpt, debug)
}

// finalizeConfig applies final processing to the parsed config
func finalizeConfig(content []byte, parserName string, configOpt *HiddifyOptions, debug bool) ([]byte, error) {
	// Work with raw JSON to preserve all fields (option.Options loses nested Options on unmarshal)
	var jsonObj map[string]interface{}
	if err := json.Unmarshal(content, &jsonObj); err != nil {
		return nil, fmt.Errorf("[%s] unmarshal error: %w", parserName, err)
	}

	// Filter out invalid outbounds using raw JSON
	filterInvalidOutboundsJSON(jsonObj, debug)

	// Check if we have any outbounds left
	outbounds, ok := jsonObj["outbounds"].([]interface{})
	if !ok || len(outbounds) == 0 {
		return nil, fmt.Errorf("[%s] no valid outbounds after filtering", parserName)
	}

	finalContent, err := json.MarshalIndent(jsonObj, "", "  ")
	if err != nil {
		return nil, fmt.Errorf("[%s] marshal error: %w", parserName, err)
	}

	if debug {
		fmt.Printf("[%s] Final config before validation (%d bytes, %d outbounds)\n", parserName, len(finalContent), len(outbounds))
	}

	// Validate with sing-box
	if err := libbox.CheckConfig(string(finalContent)); err != nil {
		if debug {
			// Print the actual JSON being validated (first 2000 chars)
			maxLen := len(finalContent)
			if maxLen > 2000 {
				maxLen = 2000
			}
			fmt.Printf("[%s] JSON being validated:\n%s\n", parserName, string(finalContent[:maxLen]))
		}
		return nil, fmt.Errorf("[%s] sing-box validation failed: %w", parserName, err)
	}

	return finalContent, nil
}

// filterInvalidOutboundsJSON filters outbounds working with raw JSON
func filterInvalidOutboundsJSON(jsonObj map[string]interface{}, debug bool) {
	outbounds, ok := jsonObj["outbounds"].([]interface{})
	if !ok {
		return
	}

	var filtered []interface{}
	for _, outbound := range outbounds {
		outboundMap, ok := outbound.(map[string]interface{})
		if !ok {
			continue
		}

		tag, _ := outboundMap["tag"].(string)
		outboundType, _ := outboundMap["type"].(string)

		// Skip outbounds without tags
		if tag == "" {
			if debug {
				fmt.Printf("[Filter] Removed outbound without tag: type=%s\n", outboundType)
			}
			continue
		}

		// Check for empty selector groups
		if outboundType == "selector" {
			if outboundsRef, ok := outboundMap["outbounds"].([]interface{}); ok {
				if len(outboundsRef) == 0 {
					if debug {
						fmt.Printf("[Filter] Removed empty selector: tag=%s\n", tag)
					}
					continue
				}
			}
		}

		// Check for empty urltest groups
		if outboundType == "urltest" {
			if outboundsRef, ok := outboundMap["outbounds"].([]interface{}); ok {
				if len(outboundsRef) == 0 {
					if debug {
						fmt.Printf("[Filter] Removed empty urltest: tag=%s\n", tag)
					}
					continue
				}
			}
		}

		filtered = append(filtered, outbound)
	}

	jsonObj["outbounds"] = filtered
}

// filterInvalidOutbounds removes outbounds without tags or with empty selector/urltest groups
func filterInvalidOutbounds(outbounds []option.Outbound, debug bool) []option.Outbound {
	var filtered []option.Outbound

	for _, outbound := range outbounds {
		// Skip outbounds without tags
		if outbound.Tag == "" {
			if debug {
				fmt.Printf("[Filter] Removed outbound without tag: type=%s\n", outbound.Type)
			}
			continue
		}

		// Check for empty selector groups
		if outbound.Type == "selector" {
			if opts, ok := outbound.Options.(*option.SelectorOutboundOptions); ok {
				if len(opts.Outbounds) == 0 {
					if debug {
						fmt.Printf("[Filter] Removed empty selector: tag=%s\n", outbound.Tag)
					}
					continue
				}
			}
		}

		// Check for empty urltest groups
		if outbound.Type == "urltest" {
			if opts, ok := outbound.Options.(*option.URLTestOutboundOptions); ok {
				if len(opts.Outbounds) == 0 {
					if debug {
						fmt.Printf("[Filter] Removed empty urltest: tag=%s\n", outbound.Tag)
					}
					continue
				}
			}
		}

		filtered = append(filtered, outbound)
	}

	return filtered
}

// filterUnsupportedOutbounds removes outbounds with unsupported types
func filterUnsupportedOutbounds(jsonObj map[string]interface{}) ([]string, int) {
	var removedTypes []string
	var removedTags []string
	removedCount := 0

	outbounds, ok := jsonObj["outbounds"].([]interface{})
	if !ok {
		return removedTypes, 0
	}

	// First pass: identify unsupported outbounds
	var filteredOutbounds []interface{}
	for _, outbound := range outbounds {
		outboundMap, ok := outbound.(map[string]interface{})
		if !ok {
			continue
		}

		outboundType, ok := outboundMap["type"].(string)
		if !ok {
			continue
		}

		if supportedOutboundTypes[outboundType] {
			filteredOutbounds = append(filteredOutbounds, outbound)
		} else {
			removedTypes = append(removedTypes, outboundType)
			removedCount++
			if tag, ok := outboundMap["tag"].(string); ok {
				removedTags = append(removedTags, tag)
			}
		}
	}

	// Second pass: clean up selector/urltest references to removed tags
	removedTagsMap := make(map[string]bool)
	for _, tag := range removedTags {
		removedTagsMap[tag] = true
	}

	var finalOutbounds []interface{}
	for _, outbound := range filteredOutbounds {
		outboundMap, ok := outbound.(map[string]interface{})
		if !ok {
			finalOutbounds = append(finalOutbounds, outbound)
			continue
		}

		outboundType, _ := outboundMap["type"].(string)
		if outboundType == "selector" || outboundType == "urltest" {
			if outboundsRef, ok := outboundMap["outbounds"].([]interface{}); ok {
				var cleanedOutbounds []interface{}
				for _, ref := range outboundsRef {
					if refStr, ok := ref.(string); ok {
						if !removedTagsMap[refStr] {
							cleanedOutbounds = append(cleanedOutbounds, ref)
						}
					}
				}
				if len(cleanedOutbounds) > 0 {
					outboundMap["outbounds"] = cleanedOutbounds
					finalOutbounds = append(finalOutbounds, outbound)
				} else {
					if tag, ok := outboundMap["tag"].(string); ok {
						removedTags = append(removedTags, tag)
					}
					removedTypes = append(removedTypes, outboundType)
					removedCount++
				}
			} else {
				finalOutbounds = append(finalOutbounds, outbound)
			}
		} else {
			finalOutbounds = append(finalOutbounds, outbound)
		}
	}

	jsonObj["outbounds"] = finalOutbounds
	return removedTypes, removedCount
}

// XrayFixedPort is the fixed port used for Xray SOCKS proxy
// Must match the value in xray/core_selector.go and ray2sing/convert.go
const XrayFixedPort uint16 = 12380

// convertXrayOutboundsToSocks finds outbounds with type "xray" and converts them to socks outbounds
// Returns the xray links and info for later Xray startup
// Supports both "link" field (vless://...) and "xray_outbound_raw" (ready Xray JSON from Hiddify Manager)
func convertXrayOutboundsToSocks(jsonObj map[string]interface{}, debug bool) ([]string, []XrayProxyInfo) {
	outbounds, ok := jsonObj["outbounds"].([]interface{})
	if !ok {
		return nil, nil
	}

	var xrayLinks []string
	var xrayInfos []XrayProxyInfo
	var newOutbounds []interface{}
	xrayIndex := 0

	for _, outbound := range outbounds {
		outboundMap, ok := outbound.(map[string]interface{})
		if !ok {
			newOutbounds = append(newOutbounds, outbound)
			continue
		}

		outboundType, _ := outboundMap["type"].(string)
		if outboundType != "xray" {
			newOutbounds = append(newOutbounds, outbound)
			continue
		}

		// This is an xray outbound - extract config for Xray-core
		originalTag, _ := outboundMap["tag"].(string)

		// Try xray_outbound_raw first (ready Xray JSON from Hiddify Manager)
		rawOutbound, hasRawOutbound := outboundMap["xray_outbound_raw"].(map[string]interface{})
		rawFragment, _ := outboundMap["xray_fragment"].(map[string]interface{})
		link, _ := outboundMap["link"].(string)

		// Need either raw outbound or link
		if !hasRawOutbound && link == "" {
			if debug {
				fmt.Printf("[SingboxParser] Xray outbound without xray_outbound_raw or link, skipping: tag=%s\n", originalTag)
			}
			continue
		}

		// Create new tag with xray marker
		newTag := fmt.Sprintf("%s [xray:%d]", originalTag, xrayIndex)

		// Create socks outbound pointing to local Xray
		socksOutbound := map[string]interface{}{
			"type": "socks",
			"tag":  newTag,
			"server":      "127.0.0.1",
			"server_port": XrayFixedPort,
		}

		if debug {
			if hasRawOutbound {
				fmt.Printf("[SingboxParser] Converting xray outbound with raw config: %s -> %s\n",
					originalTag, newTag)
			} else {
				fmt.Printf("[SingboxParser] Converting xray outbound with link: %s -> %s (link length: %d)\n",
					originalTag, newTag, len(link))
			}
		}

		// Store xray info with raw outbound if available
		info := XrayProxyInfo{
			Tag:       newTag,
			Link:      link,
			Index:     xrayIndex,
			ProxyName: originalTag,
		}
		if hasRawOutbound {
			info.RawOutbound = rawOutbound
		}
		if rawFragment != nil {
			info.RawFragment = rawFragment
		}

		xrayLinks = append(xrayLinks, link) // Keep for backward compatibility
		xrayInfos = append(xrayInfos, info)

		newOutbounds = append(newOutbounds, socksOutbound)
		xrayIndex++
	}

	// Update selector/urltest references to use new tags
	if len(xrayInfos) > 0 {
		// Build mapping from old tag to new tag
		tagMapping := make(map[string]string)
		for _, info := range xrayInfos {
			tagMapping[info.ProxyName] = info.Tag
		}

		// Update references in selector/urltest outbounds
		for _, outbound := range newOutbounds {
			outboundMap, ok := outbound.(map[string]interface{})
			if !ok {
				continue
			}

			outboundType, _ := outboundMap["type"].(string)
			if outboundType != "selector" && outboundType != "urltest" {
				continue
			}

			if outboundsRef, ok := outboundMap["outbounds"].([]interface{}); ok {
				for i, ref := range outboundsRef {
					if refStr, ok := ref.(string); ok {
						if newTag, exists := tagMapping[refStr]; exists {
							outboundsRef[i] = newTag
						}
					}
				}
			}
		}
	}

	jsonObj["outbounds"] = newOutbounds
	return xrayLinks, xrayInfos
}

// sanitizeV2rayLinks fixes common DNS/TLS issues in V2ray subscription links
func sanitizeV2rayLinks(content string, debug bool) string {
	sanitized := content
	
	// Fix fake_ip_for_sub_link in SNI fields
	if strings.Contains(sanitized, "fake_ip_for_sub_link") {
		if debug {
			fmt.Printf("[Sanitizer] Replacing fake_ip_for_sub_link with 1.1.1.1\n")
		}
		sanitized = strings.ReplaceAll(sanitized, "fake_ip_for_sub_link", "1.1.1.1")
	}
	
	// Fix invalid hostname patterns like digits.digits--digits.digits.time
	invalidHostnamePattern := regexp.MustCompile(`\d+\.\d+--\d+\.\d+\.time`)
	if invalidHostnamePattern.MatchString(sanitized) {
		if debug {
			fmt.Printf("[Sanitizer] Replacing invalid hostname patterns with cloudflare-dns.com\n")
		}
		sanitized = invalidHostnamePattern.ReplaceAllString(sanitized, "cloudflare-dns.com")
	}
	
	// Handle encoded special characters that cause parsing issues
	if strings.Contains(sanitized, "%E2%8F%B3") {
		if debug {
			fmt.Printf("[Sanitizer] Removing problematic encoded characters\n")
		}
		sanitized = strings.ReplaceAll(sanitized, "%E2%8F%B3", "")
	}

	return sanitized
}

// cleanHiddifyManagerFields converts Hiddify Manager specific fields to sing-box format
// Hiddify Manager sends "tls_tricks" object in TLS config which sing-box doesn't understand
// We convert it to proper sing-box fields: fragment, fragment_fallback_delay, record_fragment
//
// Hiddify Manager also sends "tls_fragment" as a separate outbound-level field which we need to remove.
//
// Mapping from Hiddify tls_tricks to sing-box TLS options:
// - enable_fragment / enabled / enable -> fragment (bool)
// - record_fragment / enable_record_fragment -> record_fragment (bool) - better performance than fragment
// - fragment_size -> configured via route rules in sing-box 1.12+, we log it for debugging
// - fragment_sleep -> fragment_fallback_delay (duration, e.g. "100ms")
// - mixed_sni_case -> mixed_sni_case (bool) - NOW SUPPORTED in our fork
// - enable_padding / padding_size -> NOT supported in vanilla sing-box (Hiddify-specific)
func cleanHiddifyManagerFields(jsonObj map[string]interface{}, debug bool) {
	outbounds, ok := jsonObj["outbounds"].([]interface{})
	if !ok {
		return
	}

	convertedCount := 0
	for _, outbound := range outbounds {
		outboundMap, ok := outbound.(map[string]interface{})
		if !ok {
			continue
		}

		// Remove Hiddify Manager specific fields that sing-box doesn't understand
		// Note: xray_outbound_raw and xray_fragment are now handled by convertXrayOutboundsToSocks()
		// and stored in XrayProxyInfo for use by Xray-core
		hiddifyFields := []string{"fake_packets"}
		for _, field := range hiddifyFields {
			if _, exists := outboundMap[field]; exists {
				delete(outboundMap, field)
				if debug {
					tag, _ := outboundMap["tag"].(string)
					fmt.Printf("[HiddifyFields] Removed unsupported field '%s' from outbound: %s\n", field, tag)
				}
			}
		}

		// Clean up xray-specific fields after they've been processed by convertXrayOutboundsToSocks
		// These fields should only exist in "xray" type outbounds which get converted to "socks"
		// If we see them in non-xray outbounds, remove them
		outboundType, _ := outboundMap["type"].(string)
		if outboundType != "xray" {
			xrayFields := []string{"xray_fragment", "xray_outbound_raw"}
			for _, field := range xrayFields {
				if _, exists := outboundMap[field]; exists {
					delete(outboundMap, field)
					if debug {
						tag, _ := outboundMap["tag"].(string)
						fmt.Printf("[HiddifyFields] Removed xray-specific field '%s' from non-xray outbound: %s\n", field, tag)
					}
				}
			}
		}

		// Remove tls_fragment field from outbound level (Hiddify Manager specific)
		// This is a separate object like: "tls_fragment": {"enabled": true, "size": "10-100", "sleep": "50-200"}
		// We need to convert it to sing-box TLS options
		if tlsFragment, hasTlsFragment := outboundMap["tls_fragment"].(map[string]interface{}); hasTlsFragment {
			tag, _ := outboundMap["tag"].(string)

			// Get or create TLS config
			tlsConfig, hasTls := outboundMap["tls"].(map[string]interface{})
			if !hasTls {
				tlsConfig = make(map[string]interface{})
				outboundMap["tls"] = tlsConfig
			}

			// Check if enabled
			if enabled, ok := tlsFragment["enabled"].(bool); ok && enabled {
				tlsConfig["fragment"] = true

				// Convert sleep to fragment_fallback_delay
				if sleep, ok := tlsFragment["sleep"].(string); ok && sleep != "" {
					parts := strings.Split(sleep, "-")
					if len(parts) == 2 {
						var min, max int
						fmt.Sscanf(parts[0], "%d", &min)
						fmt.Sscanf(parts[1], "%d", &max)
						avg := (min + max) / 2
						if avg > 0 {
							tlsConfig["fragment_fallback_delay"] = fmt.Sprintf("%dms", avg)
						}
					}
				}

				if debug {
					fmt.Printf("[HiddifyFields] Converted tls_fragment to TLS fragment for outbound: %s\n", tag)
				}
				convertedCount++
			}

			// Remove the unsupported tls_fragment field
			delete(outboundMap, "tls_fragment")
		}

		// Check if TLS config exists
		tlsConfig, ok := outboundMap["tls"].(map[string]interface{})
		if !ok {
			continue
		}

		// Check for tls_tricks field from Hiddify Manager
		tlsTricks, hasTlsTricks := tlsConfig["tls_tricks"].(map[string]interface{})
		if !hasTlsTricks {
			continue
		}

		tag, _ := outboundMap["tag"].(string)
		converted := false

		// Check for record_fragment first (better performance than fragment per sing-box docs)
		recordFragmentEnabled := false
		if enabled, ok := tlsTricks["record_fragment"].(bool); ok && enabled {
			recordFragmentEnabled = true
		}
		if enabled, ok := tlsTricks["enable_record_fragment"].(bool); ok && enabled {
			recordFragmentEnabled = true
		}

		// Check if regular fragment is enabled
		fragmentEnabled := false
		if enabled, ok := tlsTricks["enable_fragment"].(bool); ok && enabled {
			fragmentEnabled = true
		}
		if enabled, ok := tlsTricks["enabled"].(bool); ok && enabled {
			fragmentEnabled = true
		}
		if enabled, ok := tlsTricks["enable"].(bool); ok && enabled {
			fragmentEnabled = true
		}

		// Apply record_fragment if enabled (preferred), otherwise regular fragment
		if recordFragmentEnabled {
			tlsConfig["record_fragment"] = true
			converted = true
			if debug {
				fmt.Printf("[HiddifyFields] Enabled record_fragment for outbound: %s\n", tag)
			}
		} else if fragmentEnabled {
			tlsConfig["fragment"] = true
			converted = true

			// Convert fragment_sleep to fragment_fallback_delay if present
			if fragmentSleep, ok := tlsTricks["fragment_sleep"].(string); ok && fragmentSleep != "" {
				// fragment_sleep is typically "50-200" format, take the average as fallback delay
				// sing-box expects duration like "100ms"
				parts := strings.Split(fragmentSleep, "-")
				if len(parts) == 2 {
					var min, max int
					fmt.Sscanf(parts[0], "%d", &min)
					fmt.Sscanf(parts[1], "%d", &max)
					avg := (min + max) / 2
					if avg > 0 {
						tlsConfig["fragment_fallback_delay"] = fmt.Sprintf("%dms", avg)
					}
				} else if len(parts) == 1 {
					// Single value like "100"
					var val int
					fmt.Sscanf(parts[0], "%d", &val)
					if val > 0 {
						tlsConfig["fragment_fallback_delay"] = fmt.Sprintf("%dms", val)
					}
				}
			}

			if debug {
				fmt.Printf("[HiddifyFields] Enabled fragment for outbound: %s\n", tag)
			}
		}

		// Convert mixed_sni_case (now supported in our fork)
		if mixedCase, ok := tlsTricks["mixed_sni_case"].(bool); ok && mixedCase {
			tlsConfig["mixed_sni_case"] = true
			if debug {
				fmt.Printf("[HiddifyFields] Enabled mixed_sni_case for outbound: %s\n", tag)
			}
			converted = true
		}
		// Also check for mixedcase_sni (alternative naming)
		if mixedCase, ok := tlsTricks["mixedcase_sni"].(bool); ok && mixedCase {
			tlsConfig["mixed_sni_case"] = true
			if debug {
				fmt.Printf("[HiddifyFields] Enabled mixed_sni_case (from mixedcase_sni) for outbound: %s\n", tag)
			}
			converted = true
		}

		// Log unsupported features for debugging
		if debug {
			if padding, ok := tlsTricks["enable_padding"].(bool); ok && padding {
				fmt.Printf("[HiddifyFields] WARNING: enable_padding not supported in sing-box, ignoring for: %s\n", tag)
			}
			if fragmentSize, ok := tlsTricks["fragment_size"].(string); ok && fragmentSize != "" {
				fmt.Printf("[HiddifyFields] INFO: fragment_size=%s (configured via route rules in sing-box 1.12+) for: %s\n", fragmentSize, tag)
			}
		}

		if converted {
			convertedCount++
		}

		// Remove the unsupported tls_tricks field
		delete(tlsConfig, "tls_tricks")
	}

	if debug && convertedCount > 0 {
		fmt.Printf("[HiddifyFields] Converted %d outbounds with tls_tricks to sing-box fragment/record_fragment\n", convertedCount)
	}
}
