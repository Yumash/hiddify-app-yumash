package config

import (
	"github.com/sagernet/sing-box/option"
	dns "github.com/sagernet/sing-dns"
)

type HiddifyOptions struct {
	EnableFullConfig        bool   `json:"enable-full-config"`
	LogLevel                string `json:"log-level"`
	LogFile                 string `json:"log-file"`
	Region                  string `json:"region"`
	BlockAds                bool   `json:"block-ads"`
	UseXrayCoreWhenPossible bool   `json:"use-xray-core-when-possible"`
	// GeoIPPath        string      `json:"geoip-path"`
	// GeoSitePath      string      `json:"geosite-path"`
	Rules     []Rule     `json:"rules"`
	Mux       MuxOptions `json:"mux"`
	TLSTricks TLSTricks  `json:"tls-tricks"`
	DNSOptions
	InboundOptions
	URLTestOptions
	RouteOptions
	WireGuardServerOptions
}

// WireGuardServerOptions - WireGuard server for LAN sharing
type WireGuardServerOptions struct {
	WGServerEnabled    bool   `json:"wg-server-enabled"`
	WGServerPort       uint16 `json:"wg-server-port"`
	WGServerSubnet     string `json:"wg-server-subnet"`      // e.g. "10.10.0.0/24"
	WGServerPrivateKey string `json:"wg-server-private-key"` // Base64-encoded
	WGServerPublicKey  string `json:"wg-server-public-key"`  // Derived, for display
	WGClientPrivateKey string `json:"wg-client-private-key"` // Base64-encoded
	WGClientPublicKey  string `json:"wg-client-public-key"`  // Derived, for server config
}

type DNSOptions struct {
	RemoteDnsAddress        string                `json:"remote-dns-address"`
	RemoteDnsDomainStrategy option.DomainStrategy `json:"remote-dns-domain-strategy"`
	DirectDnsAddress        string                `json:"direct-dns-address"`
	DirectDnsDomainStrategy option.DomainStrategy `json:"direct-dns-domain-strategy"`
	IndependentDNSCache     bool                  `json:"independent-dns-cache"`
	EnableFakeDNS           bool                  `json:"enable-fake-dns"`
	EnableDNSRouting        bool                  `json:"enable-dns-routing"`
}

type InboundOptions struct {
	EnableTun        bool   `json:"enable-tun"`
	EnableTunService bool   `json:"enable-tun-service"`
	SetSystemProxy   bool   `json:"set-system-proxy"`
	MixedPort        uint16 `json:"mixed-port"`
	TProxyPort       uint16 `json:"tproxy-port"`
	LocalDnsPort     uint16 `json:"local-dns-port"`
	MTU              uint32 `json:"mtu"`
	StrictRoute      bool   `json:"strict-route"`
	TUNStack         string `json:"tun-implementation"`
	TUNAddress       string `json:"tun-address"` // VPN subnet, e.g. "100.64.0.1/28"
}

type URLTestOptions struct {
	ConnectionTestUrl string            `json:"connection-test-url"`
	URLTestInterval   DurationInSeconds `json:"url-test-interval"`
	// URLTestIdleTimeout DurationInSeconds `json:"url-test-idle-timeout"`
}

type RouteOptions struct {
	ResolveDestination     bool   `json:"resolve-destination"`
	BypassLAN              bool   `json:"bypass-lan"`
	LANBypassIPs           string `json:"lan-bypass-ips"` // Comma-separated CIDR ranges for LAN bypass
	AllowConnectionFromLAN bool   `json:"allow-connection-from-lan"`
	ExcludedDomains        string `json:"excluded-domains"`
	ExcludedIPs            string `json:"excluded-ips"`
	ExcludedProcesses      string `json:"excluded-processes"`
	BypassRussianDomains   bool   `json:"bypass-russian-domains"`
	BypassRussianIps       bool   `json:"bypass-russian-ips"`
	// Custom rule-set URLs (comma-separated)
	BlockAdsRuleSetUrls string `json:"block-ads-ruleset-urls"`
	RussianGeositeUrl   string `json:"russian-geosite-url"`
	RussianGeoipUrl     string `json:"russian-geoip-url"`
	// Rule-set cache options
	RuleSetUpdateInterval DurationInSeconds `json:"rule-set-update-interval"` // Default: 7 days
}

type TLSTricks struct {
	EnableFragment bool   `json:"enable-fragment"`
	FragmentSize   string `json:"fragment-size"`
	FragmentSleep  string `json:"fragment-sleep"`
	MixedSNICase   bool   `json:"mixed-sni-case"`
	EnablePadding  bool   `json:"enable-padding"`
	PaddingSize    string `json:"padding-size"`
}

type MuxOptions struct {
	Enable     bool   `json:"enable"`
	Padding    bool   `json:"padding"`
	MaxStreams int    `json:"max-streams"`
	Protocol   string `json:"protocol"`
}

func DefaultHiddifyOptions() *HiddifyOptions {
	return &HiddifyOptions{
		DNSOptions: DNSOptions{
			RemoteDnsAddress:        "1.1.1.1",
			RemoteDnsDomainStrategy: option.DomainStrategy(dns.DomainStrategyAsIS),
			DirectDnsAddress:        "1.1.1.1",
			DirectDnsDomainStrategy: option.DomainStrategy(dns.DomainStrategyAsIS),
			IndependentDNSCache:     false,
			EnableFakeDNS:           false,
			EnableDNSRouting:        false,
		},
		InboundOptions: InboundOptions{
			EnableTun:      false,
			SetSystemProxy: false,
			// Yumash Edition: different ports to allow running alongside original Hiddify
			MixedPort:      22334,
			TProxyPort:     22335,
			LocalDnsPort:   26450,
			MTU:            1400,
			StrictRoute:    true,
			TUNStack:       "mixed",
			TUNAddress:     "100.64.1.1/28", // CGNAT range, different from original Hiddify
		},
		URLTestOptions: URLTestOptions{
			ConnectionTestUrl: "http://cp.cloudflare.com/",
			URLTestInterval:   DurationInSeconds(600),
			// URLTestIdleTimeout: DurationInSeconds(6000),
		},
		RouteOptions: RouteOptions{
			ResolveDestination:     false,
			BypassLAN:              false,
			AllowConnectionFromLAN: false,
			RuleSetUpdateInterval:  DurationInSeconds(7 * 24 * 60 * 60), // 7 days
		},
		LogLevel: "warn",
		// LogFile:        "/dev/null",
		LogFile:        "box.log",
		Region:         "other",
		// GeoIPPath:      "geoip.db",
		// GeoSitePath:    "geosite.db",
		Rules: []Rule{},
		Mux: MuxOptions{
			Enable:     false,
			Padding:    true,
			MaxStreams: 8,
			Protocol:   "h2mux",
		},
		TLSTricks: TLSTricks{
			EnableFragment: false,
			FragmentSize:   "10-100",
			FragmentSleep:  "50-200",
			MixedSNICase:   false,
			EnablePadding:  false,
			PaddingSize:    "1200-1500",
		},
		UseXrayCoreWhenPossible: false,
		WireGuardServerOptions: WireGuardServerOptions{
			WGServerEnabled: false,
			WGServerPort:    51820,
			WGServerSubnet:  "10.10.0.0/24",
			// Keys will be generated on first enable
		},
	}
}
