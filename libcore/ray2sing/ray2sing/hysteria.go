package ray2sing

import (
	"strconv"

	T "github.com/sagernet/sing-box/option"
)

func HysteriaSingbox(hysteriaURL string) (*T.Outbound, error) {
	u, err := ParseUrl(hysteriaURL, 443)
	if err != nil {
		return nil, err
	}
	SNI := u.Params["peer"]

	hysteriaOpts := &T.HysteriaOutboundOptions{
		ServerOptions: u.GetServerOption(),
		OutboundTLSOptionsContainer: T.OutboundTLSOptionsContainer{
			TLS: &T.OutboundTLSOptions{
				Enabled:    true,
				DisableSNI: isIPOnly(SNI),
				ServerName: SNI,
				Insecure:   u.Params["insecure"] == "1",
			},
		},
	}

	hysteriaOpts.AuthString = u.Params["auth"]

	upMbps, err := strconv.Atoi(u.Params["upmbps"])
	if err == nil {
		hysteriaOpts.UpMbps = upMbps
	}

	downMbps, err := strconv.Atoi(u.Params["downmbps"])
	if err == nil {
		hysteriaOpts.DownMbps = downMbps
	}

	hysteriaOpts.Obfs = u.Params["obfsParam"]

	return &T.Outbound{
		Type:    u.Scheme,
		Tag:     u.Name,
		Options: hysteriaOpts,
	}, nil
}
