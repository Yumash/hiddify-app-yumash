package xray

import (
	"encoding/base64"
	"encoding/json"
	"fmt"
	"net/url"
	"strconv"
	"strings"
)

// ProxyLink represents a parsed proxy link
type ProxyLink struct {
	Protocol    string
	Tag         string
	Server      string
	Port        uint16
	UUID        string
	Password    string
	Method      string // For shadowsocks
	Flow        string // For VLESS
	Transport   string // ws, grpc, tcp, xhttp
	TLS         bool
	SNI         string
	Fingerprint string
	ALPN        []string
	Path        string
	Host        string
	ServiceName string
	// XHTTP specific
	XHTTPMode   string // auto, packet-up, stream-up, stream-one
	XHTTPExtra  map[string]string
}

// ParseLink parses a proxy link (vless://, vmess://, trojan://, ss://)
func ParseLink(link string) (*ProxyLink, error) {
	link = strings.TrimSpace(link)

	if strings.HasPrefix(link, "vless://") {
		return parseVLESS(link)
	}
	if strings.HasPrefix(link, "vmess://") {
		return parseVMess(link)
	}
	if strings.HasPrefix(link, "trojan://") {
		return parseTrojan(link)
	}
	if strings.HasPrefix(link, "ss://") {
		return parseShadowsocks(link)
	}

	return nil, fmt.Errorf("unsupported protocol: %s", link)
}

func parseVLESS(link string) (*ProxyLink, error) {
	u, err := url.Parse(link)
	if err != nil {
		return nil, err
	}

	port, _ := strconv.ParseUint(u.Port(), 10, 16)
	params := u.Query()

	p := &ProxyLink{
		Protocol:    "vless",
		Tag:         u.Fragment,
		Server:      u.Hostname(),
		Port:        uint16(port),
		UUID:        u.User.String(),
		Flow:        params.Get("flow"),
		Transport:   params.Get("type"),
		TLS:         params.Get("security") == "tls" || params.Get("security") == "reality",
		SNI:         params.Get("sni"),
		Fingerprint: params.Get("fp"),
		Path:        params.Get("path"),
		Host:        params.Get("host"),
		ServiceName: params.Get("serviceName"),
		XHTTPMode:   params.Get("mode"),
	}

	if p.Transport == "" {
		p.Transport = "tcp"
	}
	if p.SNI == "" {
		p.SNI = p.Server
	}
	if p.Fingerprint == "" {
		p.Fingerprint = "chrome"
	}
	if alpn := params.Get("alpn"); alpn != "" {
		p.ALPN = strings.Split(alpn, ",")
	}

	return p, nil
}

func parseVMess(link string) (*ProxyLink, error) {
	// vmess:// links are base64 encoded JSON
	encoded := strings.TrimPrefix(link, "vmess://")
	decoded, err := base64.StdEncoding.DecodeString(encoded)
	if err != nil {
		// Try URL-safe base64
		decoded, err = base64.URLEncoding.DecodeString(encoded)
		if err != nil {
			// Try without padding
			decoded, err = base64.RawStdEncoding.DecodeString(encoded)
			if err != nil {
				return nil, fmt.Errorf("failed to decode vmess link: %w", err)
			}
		}
	}

	var vmessConfig map[string]interface{}
	if err := json.Unmarshal(decoded, &vmessConfig); err != nil {
		return nil, fmt.Errorf("failed to parse vmess JSON: %w", err)
	}

	p := &ProxyLink{
		Protocol: "vmess",
	}

	if v, ok := vmessConfig["ps"].(string); ok {
		p.Tag = v
	}
	if v, ok := vmessConfig["add"].(string); ok {
		p.Server = v
	}
	if v, ok := vmessConfig["port"]; ok {
		switch port := v.(type) {
		case float64:
			p.Port = uint16(port)
		case string:
			portNum, _ := strconv.ParseUint(port, 10, 16)
			p.Port = uint16(portNum)
		}
	}
	if v, ok := vmessConfig["id"].(string); ok {
		p.UUID = v
	}
	if v, ok := vmessConfig["net"].(string); ok {
		p.Transport = v
	}
	if v, ok := vmessConfig["tls"].(string); ok {
		p.TLS = v == "tls"
	}
	if v, ok := vmessConfig["sni"].(string); ok {
		p.SNI = v
	}
	if v, ok := vmessConfig["host"].(string); ok {
		p.Host = v
	}
	if v, ok := vmessConfig["path"].(string); ok {
		p.Path = v
	}
	if v, ok := vmessConfig["fp"].(string); ok {
		p.Fingerprint = v
	}

	if p.Transport == "" {
		p.Transport = "tcp"
	}
	if p.SNI == "" {
		p.SNI = p.Server
	}
	if p.Fingerprint == "" {
		p.Fingerprint = "chrome"
	}

	return p, nil
}

func parseTrojan(link string) (*ProxyLink, error) {
	u, err := url.Parse(link)
	if err != nil {
		return nil, err
	}

	port, _ := strconv.ParseUint(u.Port(), 10, 16)
	params := u.Query()

	password, _ := u.User.Password()
	if password == "" {
		password = u.User.String()
	}

	p := &ProxyLink{
		Protocol:    "trojan",
		Tag:         u.Fragment,
		Server:      u.Hostname(),
		Port:        uint16(port),
		Password:    password,
		Transport:   params.Get("type"),
		TLS:         true, // Trojan always uses TLS
		SNI:         params.Get("sni"),
		Fingerprint: params.Get("fp"),
		Path:        params.Get("path"),
		Host:        params.Get("host"),
		ServiceName: params.Get("serviceName"),
	}

	if p.Transport == "" {
		p.Transport = "tcp"
	}
	if p.SNI == "" {
		p.SNI = p.Server
	}
	if p.Fingerprint == "" {
		p.Fingerprint = "chrome"
	}
	if alpn := params.Get("alpn"); alpn != "" {
		p.ALPN = strings.Split(alpn, ",")
	}

	return p, nil
}

func parseShadowsocks(link string) (*ProxyLink, error) {
	// ss://BASE64@server:port#tag or ss://method:password@server:port#tag
	link = strings.TrimPrefix(link, "ss://")

	// Split tag
	var tag string
	if idx := strings.LastIndex(link, "#"); idx != -1 {
		tag, _ = url.QueryUnescape(link[idx+1:])
		link = link[:idx]
	}

	// Parse URL
	u, err := url.Parse("ss://" + link)
	if err != nil {
		return nil, err
	}

	port, _ := strconv.ParseUint(u.Port(), 10, 16)

	var method, password string
	userInfo := u.User.String()

	// Try to decode base64 userinfo
	decoded, err := base64.URLEncoding.DecodeString(userInfo)
	if err != nil {
		decoded, err = base64.StdEncoding.DecodeString(userInfo)
	}

	if err == nil {
		parts := strings.SplitN(string(decoded), ":", 2)
		if len(parts) == 2 {
			method = parts[0]
			password = parts[1]
		}
	} else {
		// Plain text format
		if pwd, ok := u.User.Password(); ok {
			method = u.User.Username()
			password = pwd
		}
	}

	return &ProxyLink{
		Protocol: "shadowsocks",
		Tag:      tag,
		Server:   u.Hostname(),
		Port:     uint16(port),
		Method:   method,
		Password: password,
	}, nil
}

// ToXrayConfig converts a ProxyLink to Xray configuration
func (p *ProxyLink) ToXrayConfig(listenPort uint16) (*Config, error) {
	config := &Config{
		Log: &LogConfig{
			Loglevel: "warning",
		},
		Inbounds: []Inbound{
			{
				Tag:      "socks-in",
				Port:     listenPort,
				Listen:   "127.0.0.1",
				Protocol: "socks",
				Settings: json.RawMessage(`{"auth":"noauth","udp":true}`),
				Sniffing: &Sniffing{
					Enabled:      true,
					DestOverride: []string{"http", "tls"},
				},
			},
			{
				Tag:      "http-in",
				Port:     listenPort + 1,
				Listen:   "127.0.0.1",
				Protocol: "http",
			},
		},
		Outbounds: []Outbound{},
		Routing: &RoutingConfig{
			DomainStrategy: "IPIfNonMatch",
			Rules: []RoutingRule{
				{
					Type:        "field",
					OutboundTag: "proxy",
					InboundTag:  []string{"socks-in", "http-in"},
				},
			},
		},
	}

	outbound, err := p.toOutbound()
	if err != nil {
		return nil, err
	}
	config.Outbounds = append(config.Outbounds, *outbound)

	// Add direct outbound
	config.Outbounds = append(config.Outbounds, Outbound{
		Tag:      "direct",
		Protocol: "freedom",
	})

	return config, nil
}

func (p *ProxyLink) toOutbound() (*Outbound, error) {
	outbound := &Outbound{
		Tag:      "proxy",
		Protocol: p.Protocol,
	}

	// Build stream settings
	if p.Transport != "" || p.TLS {
		outbound.StreamSettings = &StreamSettings{}

		if p.TLS {
			outbound.StreamSettings.Security = "tls"
			outbound.StreamSettings.TLSSettings = &TLSSettings{
				ServerName:    p.SNI,
				Fingerprint:   p.Fingerprint,
				AllowInsecure: false,
				ALPN:          p.ALPN,
			}
		}

		switch p.Transport {
		case "xhttp", "splithttp":
			outbound.StreamSettings.Network = "xhttp"
			outbound.StreamSettings.XHTTPSettings = &XHTTPSettings{
				Path: p.Path,
				Host: p.Host,
				Mode: p.XHTTPMode,
			}
		case "ws", "websocket":
			outbound.StreamSettings.Network = "ws"
			headers := make(map[string]string)
			if p.Host != "" {
				headers["Host"] = p.Host
			}
			outbound.StreamSettings.WSSettings = &WSSettings{
				Path:    p.Path,
				Headers: headers,
			}
		case "grpc":
			outbound.StreamSettings.Network = "grpc"
			outbound.StreamSettings.GRPCSettings = &GRPCSettings{
				ServiceName: p.ServiceName,
			}
		case "tcp", "":
			outbound.StreamSettings.Network = "tcp"
		default:
			outbound.StreamSettings.Network = p.Transport
		}
	}

	// Build protocol-specific settings
	switch p.Protocol {
	case "vless":
		settings := map[string]interface{}{
			"vnext": []map[string]interface{}{
				{
					"address": p.Server,
					"port":    p.Port,
					"users": []map[string]interface{}{
						{
							"id":         p.UUID,
							"flow":       p.Flow,
							"encryption": "none",
						},
					},
				},
			},
		}
		data, _ := json.Marshal(settings)
		outbound.Settings = data

	case "vmess":
		settings := map[string]interface{}{
			"vnext": []map[string]interface{}{
				{
					"address": p.Server,
					"port":    p.Port,
					"users": []map[string]interface{}{
						{
							"id":       p.UUID,
							"security": "auto",
						},
					},
				},
			},
		}
		data, _ := json.Marshal(settings)
		outbound.Settings = data

	case "trojan":
		settings := map[string]interface{}{
			"servers": []map[string]interface{}{
				{
					"address":  p.Server,
					"port":     p.Port,
					"password": p.Password,
				},
			},
		}
		data, _ := json.Marshal(settings)
		outbound.Settings = data

	case "shadowsocks":
		settings := map[string]interface{}{
			"servers": []map[string]interface{}{
				{
					"address":  p.Server,
					"port":     p.Port,
					"method":   p.Method,
					"password": p.Password,
				},
			},
		}
		data, _ := json.Marshal(settings)
		outbound.Settings = data

	default:
		return nil, fmt.Errorf("unsupported protocol: %s", p.Protocol)
	}

	return outbound, nil
}

// NeedsXray returns true if this proxy link requires Xray-core (XHTTP transport)
func (p *ProxyLink) NeedsXray() bool {
	return p.Transport == "xhttp" || p.Transport == "splithttp"
}

// NeedsXrayForLink checks if a proxy link string requires Xray-core
func NeedsXrayForLink(link string) bool {
	// Quick check without full parsing
	link = strings.ToLower(link)
	return strings.Contains(link, "type=xhttp") ||
	       strings.Contains(link, "type=splithttp") ||
	       strings.Contains(link, "\"net\":\"xhttp\"") ||
	       strings.Contains(link, "\"net\":\"splithttp\"")
}
