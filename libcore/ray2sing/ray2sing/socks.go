package ray2sing

import (
	C "github.com/sagernet/sing-box/constant"
	T "github.com/sagernet/sing-box/option"
)

func SocksSingbox(url string) (*T.Outbound, error) {
	u, err := ParseUrl(url, 0)
	if err != nil {
		return nil, err
	}

	socksOpts := &T.SOCKSOutboundOptions{
		ServerOptions: u.GetServerOption(),
		Username:      u.Username,
		Password:      u.Password,
	}
	if version, err := getOneOf(u.Params, "v", "ver", "version"); err == nil {
		socksOpts.Version = version
	}

	return &T.Outbound{
		Type:    C.TypeSOCKS,
		Tag:     u.Name,
		Options: socksOpts,
	}, nil
}
