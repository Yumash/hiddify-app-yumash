package config

import (
	"bytes"
	"encoding/json"
	"fmt"
	"net"
	"net/netip"
	"net/url"
	"strings"

	C "github.com/sagernet/sing-box/constant"
	"github.com/sagernet/sing-box/experimental/libbox"
	"github.com/sagernet/sing-box/option"
	dns "github.com/sagernet/sing-dns"
	"github.com/sagernet/sing/common/json/badoption"
	singJson "github.com/sagernet/sing/common/json"
)

const (
	DNSRemoteTag = "dns-remote"
	DNSLocalTag  = "dns-local"
	DNSDirectTag = "dns-direct"
	DNSFakeTag   = "dns-fake"

	OutboundDirectTag  = "direct"
	OutboundBypassTag  = "bypass"
	OutboundBlockTag   = "block"
	OutboundSelectTag  = "select"
	OutboundURLTestTag = "auto"
	OutboundDNSTag     = "dns-out"

	InboundTUNTag   = "tun-in"
	InboundMixedTag = "mixed-in"
	InboundDNSTag   = "dns-in"
)

var OutboundMainProxyTag = OutboundSelectTag

func BuildConfigJson(configOpt HiddifyOptions, input option.Options) (string, error) {
	options, err := BuildConfig(configOpt, input)
	if err != nil {
		return "", err
	}
	// Use MarshalContext with libbox context to properly serialize DNS options
	ctx := libbox.BaseContext(nil)
	jsonData, err := singJson.MarshalContext(ctx, options)
	if err != nil {
		return "", err
	}
	// Pretty print for debugging
	var prettyJSON bytes.Buffer
	err = json.Indent(&prettyJSON, jsonData, "", "  ")
	if err != nil {
		return string(jsonData), nil
	}
	return prettyJSON.String(), nil
}

func BuildConfig(opt HiddifyOptions, input option.Options) (*option.Options, error) {
	var options option.Options
	if opt.EnableFullConfig {
		options.Inbounds = input.Inbounds
		options.DNS = input.DNS
		options.Route = input.Route
	}

	setLog(&options, &opt)
	setInbound(&options, &opt)
	setDns(&options, &opt)
	setRoutingOptions(&options, &opt)
	setFakeDns(&options, &opt)
	setExperimental(&options, &opt)
	err := setOutbounds(&options, &input, &opt)
	if err != nil {
		return nil, err
	}

	// Add WireGuard LAN server endpoint if enabled
	if err := setWireGuardServer(&options, &opt); err != nil {
		return nil, err
	}

	return &options, nil
}

// setExperimental configures cache file and ClashAPI for status/groups reporting
func setExperimental(options *option.Options, opt *HiddifyOptions) {
	options.Experimental = &option.ExperimentalOptions{
		CacheFile: &option.CacheFileOptions{
			Enabled:     true,
			StoreFakeIP: opt.EnableFakeDNS,
		},
		// ClashAPI enables the ClashServer which is required for:
		// - CommandServer groups/status reporting
		// - URL test history storage
		ClashAPI: &option.ClashAPIOptions{
			ExternalController: "127.0.0.1:19090", // Yumash Edition uses different port
		},
	}
}

// setWireGuardServer adds WireGuard endpoint for LAN sharing
func setWireGuardServer(options *option.Options, opt *HiddifyOptions) error {
	endpoint, err := opt.BuildWireGuardServerEndpoint()
	if err != nil {
		return fmt.Errorf("failed to build WireGuard server endpoint: %w", err)
	}
	if endpoint != nil {
		options.Endpoints = append(options.Endpoints, *endpoint)
	}
	return nil
}

func addForceDirect(options *option.Options, opt *HiddifyOptions, directDNSDomains map[string]bool) {
	remoteDNSAddress := opt.RemoteDnsAddress
	if strings.Contains(remoteDNSAddress, "://") {
		remoteDNSAddress = strings.SplitAfter(remoteDNSAddress, "://")[1]
	}
	parsedUrl, err := url.Parse(fmt.Sprintf("https://%s", remoteDNSAddress))
	if err == nil && net.ParseIP(parsedUrl.Host) == nil {
		directDNSDomains[parsedUrl.Host] = true
	}
	if len(directDNSDomains) > 0 {
		directDNSDomainskeys := make([]string, 0, len(directDNSDomains))
		for key := range directDNSDomains {
			directDNSDomainskeys = append(directDNSDomainskeys, key)
		}

		domains := strings.Join(directDNSDomainskeys, ",")
		directRule := Rule{Domains: domains, Outbound: OutboundBypassTag}
		rawDnsRule := directRule.MakeDNSRule()
		dnsRule := makeDNSRuleWithServer(rawDnsRule, DNSDirectTag, false, nil)
		options.DNS.Rules = append([]option.DNSRule{{Type: C.RuleTypeDefault, DefaultOptions: dnsRule}}, options.DNS.Rules...)
	}
}

func setOutbounds(options *option.Options, input *option.Options, opt *HiddifyOptions) error {
	directDNSDomains := make(map[string]bool)
	var outbounds []option.Outbound
	var tags []string
	OutboundMainProxyTag = OutboundSelectTag

	for _, out := range input.Outbounds {
		outbound, serverDomain, err := patchOutbound(out, *opt)
		if err != nil {
			return err
		}

		if serverDomain != "" {
			directDNSDomains[serverDomain] = true
		}
		out = *outbound

		switch out.Type {
		case C.TypeDirect, C.TypeBlock, C.TypeDNS:
			continue
		case C.TypeSelector, C.TypeURLTest:
			continue
		default:
			if !strings.Contains(out.Tag, "§hide§") {
				tags = append(tags, out.Tag)
			}
			outbounds = append(outbounds, out)
		}
	}

	// Only create selector/urltest groups if we have actual proxy outbounds
	if len(tags) > 0 {
		urlTest := option.Outbound{
			Type: C.TypeURLTest,
			Tag:  OutboundURLTestTag,
			Options: &option.URLTestOutboundOptions{
				Outbounds:                 tags,
				URL:                       opt.ConnectionTestUrl,
				Interval:                  badoption.Duration(opt.URLTestInterval.Duration()),
				Tolerance:                 1,
				IdleTimeout:               badoption.Duration(opt.URLTestInterval.Duration() * 3),
				InterruptExistConnections: true,
			},
		}
		defaultSelect := urlTest.Tag

		for _, tag := range tags {
			if strings.Contains(tag, "§default§") {
				defaultSelect = "§default§"
			}
		}
		selector := option.Outbound{
			Type: C.TypeSelector,
			Tag:  OutboundSelectTag,
			Options: &option.SelectorOutboundOptions{
				Outbounds:                 append([]string{urlTest.Tag}, tags...),
				Default:                   defaultSelect,
				InterruptExistConnections: true,
			},
		}

		outbounds = append([]option.Outbound{selector, urlTest}, outbounds...)
	}

	options.Outbounds = append(
		outbounds,
		[]option.Outbound{
			{
				Tag:     OutboundDNSTag,
				Type:    C.TypeDNS,
				Options: &option.StubOptions{},
			},
			{
				Tag:     OutboundDirectTag,
				Type:    C.TypeDirect,
				Options: &option.DirectOutboundOptions{},
			},
			{
				Tag:     OutboundBypassTag,
				Type:    C.TypeDirect,
				Options: &option.DirectOutboundOptions{},
			},
			{
				Tag:     OutboundBlockTag,
				Type:    C.TypeBlock,
				Options: &option.StubOptions{},
			},
		}...,
	)

	addForceDirect(options, opt, directDNSDomains)
	return nil
}

func setLog(options *option.Options, opt *HiddifyOptions) {
	options.Log = &option.LogOptions{
		Level:        opt.LogLevel,
		Output:       opt.LogFile,
		Disabled:     false,
		Timestamp:    true,
		DisableColor: true,
	}
}

func setInbound(options *option.Options, opt *HiddifyOptions) {
	var inboundDomainStrategy option.DomainStrategy
	if !opt.ResolveDestination {
		inboundDomainStrategy = option.DomainStrategy(dns.DomainStrategyAsIS)
	} else {
		// Always use IPv4 only
		inboundDomainStrategy = option.DomainStrategy(dns.DomainStrategyUseIPv4)
	}
	if opt.EnableTunService {
		ActivateTunnelService(*opt)
	} else if opt.EnableTun {
		// Parse TUN address from config, fallback to default
		// Yumash Edition: using 100.64.1.x to allow running alongside original Hiddify
		tunAddress := opt.TUNAddress
		if tunAddress == "" {
			tunAddress = "100.64.1.1/28"
		}
		tunPrefix, err := netip.ParsePrefix(tunAddress)
		if err != nil {
			// Invalid address, use default
			tunPrefix = netip.MustParsePrefix("100.64.1.1/28")
		}

		tunInbound := option.Inbound{
			Type: C.TypeTun,
			Tag:  InboundTUNTag,
			Options: &option.TunInboundOptions{
				Stack:       opt.TUNStack,
				MTU:         opt.MTU,
				AutoRoute:   true,
				StrictRoute: opt.StrictRoute,
				// Note: EndpointIndependentNat removed in sing-box 1.12
				// GSO removed in sing-box 1.12
				InboundOptions: option.InboundOptions{
					SniffEnabled:             true,
					SniffOverrideDestination: false,
					DomainStrategy:           inboundDomainStrategy,
				},
				// Use configurable TUN address
				Address: []netip.Prefix{tunPrefix},
			},
		}
		options.Inbounds = append(options.Inbounds, tunInbound)
	}

	var bind string
	if opt.AllowConnectionFromLAN {
		bind = "0.0.0.0"
	} else {
		bind = "127.0.0.1"
	}

	bindAddr := netip.MustParseAddr(bind)
	options.Inbounds = append(
		options.Inbounds,
		option.Inbound{
			Type: C.TypeMixed,
			Tag:  InboundMixedTag,
			Options: &option.HTTPMixedInboundOptions{
				ListenOptions: option.ListenOptions{
					Listen:     (*badoption.Addr)(&bindAddr),
					ListenPort: opt.MixedPort,
					InboundOptions: option.InboundOptions{
						SniffEnabled:             true,
						SniffOverrideDestination: true,
						DomainStrategy:           inboundDomainStrategy,
					},
				},
				SetSystemProxy: opt.SetSystemProxy,
			},
		},
	)

	options.Inbounds = append(
		options.Inbounds,
		option.Inbound{
			Type: C.TypeDirect,
			Tag:  InboundDNSTag,
			Options: &option.DirectInboundOptions{
				ListenOptions: option.ListenOptions{
					Listen:     (*badoption.Addr)(&bindAddr),
					ListenPort: opt.LocalDnsPort,
				},
			},
		},
	)
}

func setDns(options *option.Options, opt *HiddifyOptions) {
	// sing-box 1.12+ DNS configuration using new transport types
	// Parse remote DNS address to determine type and server
	remoteDnsServer, remoteDnsType := parseDnsAddress(opt.RemoteDnsAddress)
	directDnsServer, directDnsType := parseDnsAddress(opt.DirectDnsAddress)

	options.DNS = &option.DNSOptions{
		RawDNSOptions: option.RawDNSOptions{
			DNSClientOptions: option.DNSClientOptions{
				IndependentCache: opt.IndependentDNSCache,
			},
			Final: DNSRemoteTag,
			Servers: []option.DNSServerOptions{
				// Remote DNS (for proxied traffic) - goes through default route
				createRemoteDNSServer(DNSRemoteTag, remoteDnsServer, remoteDnsType, opt.RemoteDnsDomainStrategy),
				// Direct DNS (for bypassed traffic)
				createDirectDNSServer(DNSDirectTag, directDnsServer, directDnsType),
				// Local system DNS
				createLocalDNSServer(DNSLocalTag),
			},
		},
	}
}

// makeDNSRuleWithServer creates a DefaultDNSRule with server routing action
func makeDNSRuleWithServer(raw option.RawDefaultDNSRule, server string, disableCache bool, rewriteTTL *uint32) option.DefaultDNSRule {
	return option.DefaultDNSRule{
		RawDefaultDNSRule: raw,
		DNSRuleAction: option.DNSRuleAction{
			Action: C.RuleActionTypeRoute,
			RouteOptions: option.DNSRouteActionOptions{
				Server:       server,
				DisableCache: disableCache,
				RewriteTTL:   rewriteTTL,
			},
		},
	}
}

// makeRouteRule creates a DefaultRule with outbound routing action
func makeRouteRule(raw option.RawDefaultRule, outbound string) option.DefaultRule {
	return option.DefaultRule{
		RawDefaultRule: raw,
		RuleAction: option.RuleAction{
			Action: C.RuleActionTypeRoute,
			RouteOptions: option.RouteActionOptions{
				Outbound: outbound,
			},
		},
	}
}

func setFakeDns(options *option.Options, opt *HiddifyOptions) {
	if opt.EnableFakeDNS {
		inet4Range := badoption.Prefix(netip.MustParsePrefix("198.18.0.0/15"))
		inet6Range := badoption.Prefix(netip.MustParsePrefix("fc00::/18"))
		// FakeIP is now handled via legacy options that get upgraded
		options.DNS.FakeIP = &option.LegacyDNSFakeIPOptions{
			Enabled:    true,
			Inet4Range: &inet4Range,
			Inet6Range: &inet6Range,
		}
		options.DNS.Servers = append(
			options.DNS.Servers,
			option.DNSServerOptions{
				Type: C.DNSTypeFakeIP,
				Tag:  DNSFakeTag,
				Options: &option.FakeIPDNSServerOptions{
					Inet4Range: &inet4Range,
					Inet6Range: &inet6Range,
				},
			},
		)
		options.DNS.Rules = append(
			options.DNS.Rules,
			option.DNSRule{
				Type: C.RuleTypeDefault,
				DefaultOptions: option.DefaultDNSRule{
					RawDefaultDNSRule: option.RawDefaultDNSRule{
						Inbound: []string{InboundTUNTag},
					},
					DNSRuleAction: option.DNSRuleAction{
						Action: C.RuleActionTypeRoute,
						RouteOptions: option.DNSRouteActionOptions{
							Server:       DNSFakeTag,
							DisableCache: true,
						},
					},
				},
			},
		)
	}
}

func setRoutingOptions(options *option.Options, opt *HiddifyOptions) {
	dnsRules := []option.DefaultDNSRule{}
	routeRules := []option.Rule{}
	rulesets := []option.RuleSet{}

	// DNS rule for local domains - use system DNS (supports hosts file)
	dnsRules = append(dnsRules, makeDNSRuleWithServer(
		option.RawDefaultDNSRule{
			DomainSuffix: []string{".local", ".localhost", ".internal", ".lan", ".home", ".localdomain"},
		},
		DNSLocalTag, false, nil,
	))

	routeRules = append(routeRules, option.Rule{
		Type: C.RuleTypeDefault,
		DefaultOptions: option.DefaultRule{
			RawDefaultRule: option.RawDefaultRule{
				Inbound: []string{InboundDNSTag},
			},
			RuleAction: option.RuleAction{
				Action: C.RuleActionTypeRoute,
				RouteOptions: option.RouteActionOptions{
					Outbound: OutboundDNSTag,
				},
			},
		},
	})
	routeRules = append(routeRules, option.Rule{
		Type: C.RuleTypeDefault,
		DefaultOptions: option.DefaultRule{
			RawDefaultRule: option.RawDefaultRule{
				Port: []uint16{53},
			},
			RuleAction: option.RuleAction{
				Action: C.RuleActionTypeRoute,
				RouteOptions: option.RouteActionOptions{
					Outbound: OutboundDNSTag,
				},
			},
		},
	})

	if opt.BypassLAN {
		// Use custom LAN bypass IPs if provided, otherwise use IPIsPrivate
		lanBypassIPs := opt.LANBypassIPs
		if lanBypassIPs != "" {
			var lanCIDRs []string
			for _, cidr := range strings.Split(lanBypassIPs, ",") {
				cidr = strings.TrimSpace(cidr)
				if cidr != "" {
					lanCIDRs = append(lanCIDRs, cidr)
				}
			}
			if len(lanCIDRs) > 0 {
				routeRules = append(
					routeRules,
					option.Rule{
						Type: C.RuleTypeDefault,
						DefaultOptions: makeRouteRule(option.RawDefaultRule{
							IPCIDR: lanCIDRs,
						}, OutboundBypassTag),
					},
				)
			}
		} else {
			// Fallback to IPIsPrivate if no custom ranges
			routeRules = append(
				routeRules,
				option.Rule{
					Type: C.RuleTypeDefault,
					DefaultOptions: makeRouteRule(option.RawDefaultRule{
						IPIsPrivate: true,
					}, OutboundBypassTag),
				},
			)
		}
	}

	// User-defined excluded domains - bypass VPN
	if len(opt.ExcludedDomains) > 0 {
		var excludedDomains []string
		var excludedDomainSuffix []string
		for _, domain := range strings.Split(opt.ExcludedDomains, ",") {
			domain = strings.TrimSpace(domain)
			if len(domain) == 0 {
				continue
			}
			if strings.HasPrefix(domain, "*.") {
				// Wildcard domain like *.example.com -> domain suffix
				excludedDomainSuffix = append(excludedDomainSuffix, strings.TrimPrefix(domain, "*"))
			} else if strings.HasPrefix(domain, ".") {
				// Domain suffix like .example.com
				excludedDomainSuffix = append(excludedDomainSuffix, domain)
			} else {
				// Exact domain
				excludedDomains = append(excludedDomains, strings.ToLower(domain))
			}
		}
		if len(excludedDomains) > 0 || len(excludedDomainSuffix) > 0 {
			routeRules = append(routeRules, option.Rule{
				Type: C.RuleTypeDefault,
				DefaultOptions: makeRouteRule(option.RawDefaultRule{
					Domain:       excludedDomains,
					DomainSuffix: excludedDomainSuffix,
				}, OutboundBypassTag),
			})
			// Also add DNS rule to use direct DNS for excluded domains
			dnsRules = append(dnsRules, makeDNSRuleWithServer(
				option.RawDefaultDNSRule{
					Domain:       excludedDomains,
					DomainSuffix: excludedDomainSuffix,
				},
				DNSDirectTag, false, nil,
			))
		}
	}

	// User-defined excluded IPs - bypass VPN
	if len(opt.ExcludedIPs) > 0 {
		var excludedIPCIDR []string
		for _, ip := range strings.Split(opt.ExcludedIPs, ",") {
			ip = strings.TrimSpace(ip)
			if len(ip) == 0 {
				continue
			}
			// Support both single IPs (10.0.0.1) and CIDR notation (10.0.0.0/8)
			if !strings.Contains(ip, "/") {
				ip = ip + "/32" // Single IP -> /32 CIDR
			}
			excludedIPCIDR = append(excludedIPCIDR, ip)
		}
		if len(excludedIPCIDR) > 0 {
			routeRules = append(routeRules, option.Rule{
				Type: C.RuleTypeDefault,
				DefaultOptions: makeRouteRule(option.RawDefaultRule{
					IPCIDR: excludedIPCIDR,
				}, OutboundBypassTag),
			})
		}
	}

	// User-defined excluded processes - bypass VPN
	if len(opt.ExcludedProcesses) > 0 {
		var excludedProcessNames []string
		for _, proc := range strings.Split(opt.ExcludedProcesses, ",") {
			proc = strings.TrimSpace(proc)
			if len(proc) == 0 {
				continue
			}
			excludedProcessNames = append(excludedProcessNames, proc)
		}
		if len(excludedProcessNames) > 0 {
			routeRules = append(routeRules, option.Rule{
				Type: C.RuleTypeDefault,
				DefaultOptions: makeRouteRule(option.RawDefaultRule{
					ProcessName: excludedProcessNames,
				}, OutboundBypassTag),
			})
		}
	}

	for _, rule := range opt.Rules {
		rawRouteRule := rule.MakeRule()
		var outbound string
		switch rule.Outbound {
		case "bypass":
			outbound = OutboundBypassTag
		case "block":
			outbound = OutboundBlockTag
		case "proxy":
			outbound = OutboundMainProxyTag
		}

		routeRule := makeRouteRule(rawRouteRule, outbound)
		if routeRule.IsValid() {
			routeRules = append(
				routeRules,
				option.Rule{
					Type:           C.RuleTypeDefault,
					DefaultOptions: routeRule,
				},
			)
		}

		rawDnsRule := rule.MakeDNSRule()
		switch rule.Outbound {
		case "bypass":
			dnsRules = append(dnsRules, makeDNSRuleWithServer(rawDnsRule, DNSDirectTag, false, nil))
		case "block":
			// Use predefined action with NXDOMAIN rcode instead of dns-block server
			dnsRules = append(dnsRules, makeDNSRuleBlock(rawDnsRule))
		case "proxy":
			if opt.EnableFakeDNS {
				// Add FakeDNS rule for proxy traffic
				fakeDnsRaw := rawDnsRule
				fakeDnsRaw.Inbound = []string{InboundTUNTag, InboundMixedTag}
				dnsRules = append(dnsRules, makeDNSRuleWithServer(fakeDnsRaw, DNSFakeTag, false, nil))
			}
			dnsRules = append(dnsRules, makeDNSRuleWithServer(rawDnsRule, DNSRemoteTag, false, nil))
		}
	}

	parsedURL, err := url.Parse(opt.ConnectionTestUrl)
	if err == nil {
		var dnsCPttl uint32 = 3000
		dnsRules = append(dnsRules, makeDNSRuleWithServer(
			option.RawDefaultDNSRule{
				Domain: []string{parsedURL.Host},
			},
			DNSRemoteTag, false, &dnsCPttl,
		))
	}

	if opt.BlockAds {
		// Parse custom URLs or use defaults
		blockAdsUrls := opt.BlockAdsRuleSetUrls
		if blockAdsUrls == "" {
			blockAdsUrls = "https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geosite-category-ads-all.srs," +
				"https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geosite-malware.srs," +
				"https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geosite-phishing.srs," +
				"https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geosite-cryptominers.srs," +
				"https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geoip-malware.srs," +
				"https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geoip-phishing.srs"
		}

		var blockRuleSetTags []string
		urlList := strings.Split(blockAdsUrls, ",")
		for i, urlStr := range urlList {
			urlStr = strings.TrimSpace(urlStr)
			if urlStr == "" {
				continue
			}
			tag := fmt.Sprintf("block-ruleset-%d", i)
			blockRuleSetTags = append(blockRuleSetTags, tag)
			rulesets = append(rulesets, option.RuleSet{
				Type:   C.RuleSetTypeRemote,
				Tag:    tag,
				Format: C.RuleSetFormatBinary,
				RemoteOptions: option.RemoteRuleSet{
					URL:            urlStr,
					DownloadDetour: OutboundSelectTag,
					UpdateInterval: badoption.Duration(opt.RuleSetUpdateInterval.Duration()),
				},
			})
		}

		if len(blockRuleSetTags) > 0 {
			routeRules = append(routeRules, option.Rule{
				Type: C.RuleTypeDefault,
				DefaultOptions: makeRouteRule(option.RawDefaultRule{
					RuleSet: blockRuleSetTags,
				}, OutboundBlockTag),
			})
			// Use predefined action with NXDOMAIN rcode for ad blocking
			dnsRules = append(dnsRules, makeDNSRuleBlock(
				option.RawDefaultDNSRule{
					RuleSet: blockRuleSetTags,
				},
			))
		}
	}

	// Russian bypass options (independent of Region setting)
	if opt.BypassRussianDomains {
		// Add .ru domain suffix bypass
		dnsRules = append(dnsRules, makeDNSRuleWithServer(
			option.RawDefaultDNSRule{
				DomainSuffix: []string{".ru"},
			},
			DNSDirectTag, false, nil,
		))
		routeRules = append(routeRules, option.Rule{
			Type: C.RuleTypeDefault,
			DefaultOptions: makeRouteRule(option.RawDefaultRule{
				DomainSuffix: []string{".ru"},
			}, OutboundDirectTag),
		})
		// Add geosite-ru ruleset with custom URL support
		geositeRuUrl := opt.RussianGeositeUrl
		if geositeRuUrl == "" {
			geositeRuUrl = "https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/country/geosite-ru.srs"
		}
		rulesets = append(rulesets, option.RuleSet{
			Type:   C.RuleSetTypeRemote,
			Tag:    "geosite-ru",
			Format: C.RuleSetFormatBinary,
			RemoteOptions: option.RemoteRuleSet{
				URL:            geositeRuUrl,
				DownloadDetour: OutboundSelectTag,
				UpdateInterval: badoption.Duration(opt.RuleSetUpdateInterval.Duration()),
			},
		})
		dnsRules = append(dnsRules, makeDNSRuleWithServer(
			option.RawDefaultDNSRule{
				RuleSet: []string{"geosite-ru"},
			},
			DNSDirectTag, false, nil,
		))
		routeRules = append(routeRules, option.Rule{
			Type: C.RuleTypeDefault,
			DefaultOptions: makeRouteRule(option.RawDefaultRule{
				RuleSet: []string{"geosite-ru"},
			}, OutboundDirectTag),
		})
	}

	if opt.BypassRussianIps {
		// Add geoip-ru ruleset with custom URL support
		geoipRuUrl := opt.RussianGeoipUrl
		if geoipRuUrl == "" {
			geoipRuUrl = "https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/country/geoip-ru.srs"
		}
		rulesets = append(rulesets, option.RuleSet{
			Type:   C.RuleSetTypeRemote,
			Tag:    "geoip-ru",
			Format: C.RuleSetFormatBinary,
			RemoteOptions: option.RemoteRuleSet{
				URL:            geoipRuUrl,
				DownloadDetour: OutboundSelectTag,
				UpdateInterval: badoption.Duration(opt.RuleSetUpdateInterval.Duration()),
			},
		})
		dnsRules = append(dnsRules, makeDNSRuleWithServer(
			option.RawDefaultDNSRule{
				RuleSet: []string{"geoip-ru"},
			},
			DNSDirectTag, false, nil,
		))
		routeRules = append(routeRules, option.Rule{
			Type: C.RuleTypeDefault,
			DefaultOptions: makeRouteRule(option.RawDefaultRule{
				RuleSet: []string{"geoip-ru"},
			}, OutboundDirectTag),
		})
	}

	// Legacy region-based bypass (kept for backwards compatibility)
	if opt.Region != "other" && opt.Region != "ru" {
		dnsRules = append(dnsRules, makeDNSRuleWithServer(
			option.RawDefaultDNSRule{
				DomainSuffix: []string{"." + opt.Region},
			},
			DNSDirectTag, false, nil,
		))
		routeRules = append(routeRules, option.Rule{
			Type: C.RuleTypeDefault,
			DefaultOptions: makeRouteRule(option.RawDefaultRule{
				DomainSuffix: []string{"." + opt.Region},
			}, OutboundDirectTag),
		})
		dnsRules = append(dnsRules, makeDNSRuleWithServer(
			option.RawDefaultDNSRule{
				RuleSet: []string{
					"geoip-" + opt.Region,
					"geosite-" + opt.Region,
				},
			},
			DNSDirectTag, false, nil,
		))

		rulesets = append(rulesets, option.RuleSet{
			Type:   C.RuleSetTypeRemote,
			Tag:    "geoip-" + opt.Region,
			Format: C.RuleSetFormatBinary,
			RemoteOptions: option.RemoteRuleSet{
				URL:            "https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/country/geoip-" + opt.Region + ".srs",
				DownloadDetour: OutboundSelectTag,
				UpdateInterval: badoption.Duration(opt.RuleSetUpdateInterval.Duration()),
			},
		})
		rulesets = append(rulesets, option.RuleSet{
			Type:   C.RuleSetTypeRemote,
			Tag:    "geosite-" + opt.Region,
			Format: C.RuleSetFormatBinary,
			RemoteOptions: option.RemoteRuleSet{
				URL:            "https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/country/geosite-" + opt.Region + ".srs",
				DownloadDetour: OutboundSelectTag,
				UpdateInterval: badoption.Duration(opt.RuleSetUpdateInterval.Duration()),
			},
		})

		routeRules = append(routeRules, option.Rule{
			Type: C.RuleTypeDefault,
			DefaultOptions: makeRouteRule(option.RawDefaultRule{
				RuleSet: []string{
					"geoip-" + opt.Region,
					"geosite-" + opt.Region,
				},
			}, OutboundDirectTag),
		})

	}
	options.Route = &option.RouteOptions{
		Rules:               routeRules,
		Final:               OutboundMainProxyTag,
		AutoDetectInterface: true,
		RuleSet:             rulesets,
		FindProcess:         true,
	}
	if opt.EnableDNSRouting {
		for _, dnsRule := range dnsRules {
			if dnsRule.IsValid() {
				options.DNS.Rules = append(
					options.DNS.Rules,
					option.DNSRule{
						Type:           C.RuleTypeDefault,
						DefaultOptions: dnsRule,
					},
				)
			}
		}
	}
}

