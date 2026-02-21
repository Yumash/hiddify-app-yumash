package config

import (
	"fmt"
	"net"

	C "github.com/sagernet/sing-box/constant"
	"github.com/sagernet/sing-box/experimental/libbox"
	"github.com/sagernet/sing-box/option"
	"github.com/sagernet/sing/common/json"
)

type outboundMap map[string]interface{}

func patchOutboundMux(base option.Outbound, configOpt HiddifyOptions, obj outboundMap) outboundMap {
	if configOpt.Mux.Enable {
		multiplex := option.OutboundMultiplexOptions{
			Enabled:    true,
			Padding:    configOpt.Mux.Padding,
			MaxStreams: configOpt.Mux.MaxStreams,
			Protocol:   configOpt.Mux.Protocol,
		}
		obj["multiplex"] = multiplex
		// } else {
		// 	delete(obj, "multiplex")
	}
	return obj
}

// extractTLSAndTransport extracts TLS options and transport from an outbound using type assertions
func extractTLSAndTransport(base option.Outbound) (*option.OutboundTLSOptions, *option.V2RayTransportOptions) {
	if base.Options == nil {
		return nil, nil
	}

	switch base.Type {
	case C.TypeVLESS:
		if opts, ok := base.Options.(*option.VLESSOutboundOptions); ok {
			return opts.TLS, opts.Transport
		}
	case C.TypeTrojan:
		if opts, ok := base.Options.(*option.TrojanOutboundOptions); ok {
			return opts.TLS, opts.Transport
		}
	case C.TypeVMess:
		if opts, ok := base.Options.(*option.VMessOutboundOptions); ok {
			return opts.TLS, opts.Transport
		}
	}
	return nil, nil
}

func patchOutboundTLSTricks(base option.Outbound, configOpt HiddifyOptions, obj outboundMap) outboundMap {
	if base.Type == C.TypeSelector || base.Type == C.TypeURLTest || base.Type == C.TypeBlock || base.Type == C.TypeDNS {
		return obj
	}
	if isOutboundReality(base) {
		return obj
	}

	// In sing-box 1.12+, TLS fragment is configured via route rules, not outbound options
	// TLSTricks (padding, mixed case SNI) were Hiddify-specific and removed in vanilla sing-box
	// We keep only the fragment flag which is now a simple bool on OutboundTLSOptions

	if base.Type == C.TypeDirect {
		// Direct outbound doesn't need TLS tricks
		return obj
	}

	tls, transport := extractTLSAndTransport(base)

	if tls == nil || !tls.Enabled || transport == nil {
		return obj
	}

	if transport.Type != C.V2RayTransportTypeWebsocket && transport.Type != C.V2RayTransportTypeGRPC && transport.Type != C.V2RayTransportTypeHTTPUpgrade {
		return obj
	}

	// Enable TLS tricks if configured
	if outtls, ok := obj["tls"].(map[string]interface{}); ok {
		if configOpt.TLSTricks.EnableFragment {
			outtls["fragment"] = true
		}
		if configOpt.TLSTricks.MixedSNICase {
			outtls["mixed_sni_case"] = true
		}
	}

	return obj
}

// patchOutboundFragment is deprecated in sing-box 1.12+
// TLS fragment is now a simple bool on OutboundTLSOptions.Fragment
// and detailed fragment settings are configured via route rule actions

func isOutboundReality(base option.Outbound) bool {
	// this function checks reality status ONLY FOR VLESS.
	// Some other protocols can also use reality, but it's discouraged as stated in the reality document
	if base.Type != C.TypeVLESS {
		return false
	}
	if base.Options == nil {
		return false
	}
	opts, ok := base.Options.(*option.VLESSOutboundOptions)
	if !ok || opts.TLS == nil {
		return false
	}
	if opts.TLS.Reality == nil {
		return false
	}
	return opts.TLS.Reality.Enabled
}

func patchOutbound(base option.Outbound, configOpt HiddifyOptions) (*option.Outbound, string, error) {
	formatErr := func(err error) error {
		return fmt.Errorf("error patching outbound[%s][%s]: %w", base.Tag, base.Type, err)
	}

	var obj outboundMap
	// In sing-box 1.12+, Outbound has MarshalJSONContext method that properly
	// serializes Options field using badjson.MarshallObjectsContext
	ctx := libbox.BaseContext(nil)
	jsonData, err := base.MarshalJSONContext(ctx)
	if err != nil {
		return nil, "", formatErr(err)
	}

	err = json.Unmarshal(jsonData, &obj)
	if err != nil {
		return nil, "", formatErr(err)
	}
	var serverDomain string
	if detour, ok := obj["detour"].(string); !ok || detour == "" {
		if server, ok := obj["server"].(string); ok {
			if server != "" && net.ParseIP(server) == nil {
				serverDomain = fmt.Sprintf("full:%s", server)
			}
		}
	}

	obj = patchOutboundTLSTricks(base, configOpt, obj)

	switch base.Type {
	case C.TypeVMess, C.TypeVLESS, C.TypeTrojan, C.TypeShadowsocks:
		obj = patchOutboundMux(base, configOpt, obj)
	}

	modifiedJson, err := json.Marshal(obj)
	if err != nil {
		return nil, "", formatErr(err)
	}

	// In sing-box 1.12+, Outbound needs UnmarshalJSONContext with registry
	var outbound option.Outbound
	err = outbound.UnmarshalJSONContext(ctx, modifiedJson)
	if err != nil {
		return nil, "", formatErr(err)
	}

	return &outbound, serverDomain, nil
}

// func (o outboundMap) transportType() string {
// 	if transport, ok := o["transport"].(map[string]interface{}); ok {
// 		if transportType, ok := transport["type"].(string); ok {
// 			return transportType
// 		}
// 	}
// 	return ""
// }
