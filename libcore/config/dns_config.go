package config

import (
	"strings"

	"github.com/sagernet/sing/common"

	C "github.com/sagernet/sing-box/constant"
	"github.com/sagernet/sing-box/option"
)

// parseDnsAddress parses DNS address and returns server and type
// Supports: udp://1.1.1.1, 1.1.1.1, tcp://1.1.1.1, tls://1.1.1.1, https://...
func parseDnsAddress(address string) (server string, dnsType string) {
	if strings.HasPrefix(address, "udp://") {
		return strings.TrimPrefix(address, "udp://"), C.DNSTypeUDP
	}
	if strings.HasPrefix(address, "tcp://") {
		return strings.TrimPrefix(address, "tcp://"), C.DNSTypeTCP
	}
	if strings.HasPrefix(address, "tls://") {
		return strings.TrimPrefix(address, "tls://"), C.DNSTypeTLS
	}
	if strings.HasPrefix(address, "https://") {
		return strings.TrimPrefix(address, "https://"), C.DNSTypeHTTPS
	}
	// Default to UDP for plain IP addresses
	return address, C.DNSTypeUDP
}

// createRemoteDNSServer creates a remote DNS server (goes through proxy)
func createRemoteDNSServer(tag string, server string, dnsType string, strategy option.DomainStrategy) option.DNSServerOptions {
	return option.DNSServerOptions{
		Type: dnsType,
		Tag:  tag,
		Options: &option.RemoteDNSServerOptions{
			DNSServerAddressOptions: option.DNSServerAddressOptions{
				Server: server,
			},
		},
	}
}

// createDirectDNSServer creates a direct DNS server (no detour - sing-box 1.12 routes it directly)
func createDirectDNSServer(tag string, server string, dnsType string) option.DNSServerOptions {
	return option.DNSServerOptions{
		Type: dnsType,
		Tag:  tag,
		Options: &option.RemoteDNSServerOptions{
			DNSServerAddressOptions: option.DNSServerAddressOptions{
				Server: server,
			},
		},
	}
}

// createLocalDNSServer creates a local system DNS server
func createLocalDNSServer(tag string) option.DNSServerOptions {
	return option.DNSServerOptions{
		Type:    C.DNSTypeLocal,
		Tag:     tag,
		Options: &option.LocalDNSServerOptions{},
	}
}

// makeDNSRuleBlock creates a DNS rule that blocks (returns NXDOMAIN)
func makeDNSRuleBlock(raw option.RawDefaultDNSRule) option.DefaultDNSRule {
	return option.DefaultDNSRule{
		RawDefaultDNSRule: raw,
		DNSRuleAction: option.DNSRuleAction{
			Action: C.RuleActionTypePredefined,
			PredefinedOptions: option.DNSRouteActionPredefined{
				Rcode: common.Ptr(option.DNSRCode(3)), // NXDOMAIN
			},
		},
	}
}
