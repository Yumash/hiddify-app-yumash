package ray2sing

import (
	C "github.com/sagernet/sing-box/constant"
	T "github.com/sagernet/sing-box/option"
)

func HttpSingbox(url string) (*T.Outbound, error) {
	u, err := ParseUrl(url, 0)
	if err != nil {
		return nil, err
	}

	httpOpts := &T.HTTPOutboundOptions{
		ServerOptions: u.GetServerOption(),
		Username:      u.Username,
		Password:      u.Password,
	}
	if _, err := getOneOf(u.Params, "tls", "sni", "insecure"); err == nil {
		httpOpts.OutboundTLSOptionsContainer.TLS = &T.OutboundTLSOptions{
			Enabled: true,
		}
	}
	if sni, err := getOneOf(u.Params, "sni"); err == nil && httpOpts.TLS != nil {
		httpOpts.TLS.ServerName = sni
	}
	if insecure, err := getOneOf(u.Params, "insecure"); err == nil && httpOpts.TLS != nil {
		httpOpts.TLS.Insecure = insecure != "0"
	}
	if path, err := getOneOf(u.Params, "path"); err == nil {
		httpOpts.Path = path
	}

	return &T.Outbound{
		Type:    C.TypeHTTP,
		Tag:     u.Name,
		Options: httpOpts,
	}, nil
}

func HttpsSingbox(url string) (*T.Outbound, error) {
	u, err := ParseUrl(url, 0)
	if err != nil {
		return nil, err
	}

	httpOpts := &T.HTTPOutboundOptions{
		ServerOptions: u.GetServerOption(),
		Username:      u.Username,
		Password:      u.Password,
	}
	httpOpts.OutboundTLSOptionsContainer.TLS = &T.OutboundTLSOptions{
		Enabled: true,
	}
	if sni, err := getOneOf(u.Params, "sni"); err == nil {
		httpOpts.TLS.ServerName = sni
	}
	if insecure, err := getOneOf(u.Params, "insecure"); err == nil {
		httpOpts.TLS.Insecure = insecure != "0"
	}
	if path, err := getOneOf(u.Params, "path"); err == nil {
		httpOpts.Path = path
	}

	return &T.Outbound{
		Type:    C.TypeHTTP,
		Tag:     u.Name,
		Options: httpOpts,
	}, nil
}
