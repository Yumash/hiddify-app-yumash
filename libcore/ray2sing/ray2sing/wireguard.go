package ray2sing

import (
	"fmt"
	"net/netip"
	"strconv"
	"strings"

	T "github.com/sagernet/sing-box/option"
)

func WiregaurdSingbox(url string) (*T.Outbound, error) {
	u, err := ParseUrl(url, 0)
	if err != nil {
		return nil, err
	}

	// Using LegacyWireGuardOutboundOptions for sing-box 1.12+ compatibility
	wgOpts := &T.LegacyWireGuardOutboundOptions{
		ServerOptions: u.GetServerOption(),
	}

	if pk, err := getOneOf(u.Params, "privatekey", "pk"); err == nil {
		wgOpts.PrivateKey = pk
	}

	if pub, err := getOneOf(u.Params, "peerpublickey", "publickey", "pub", "peerpub"); err == nil {
		wgOpts.PeerPublicKey = pub
	}

	if psk, err := getOneOf(u.Params, "presharedkey", "psk"); err == nil {
		wgOpts.PreSharedKey = psk
	}

	// Parse Workers
	if workerStr, ok := u.Params["workers"]; ok {
		if workers, err := strconv.Atoi(workerStr); err == nil {
			wgOpts.Workers = workers
		}
	}

	if mtuStr, ok := u.Params["mtu"]; ok {
		if mtu, err := strconv.ParseUint(mtuStr, 10, 32); err == nil {
			wgOpts.MTU = uint32(mtu)
		}
	}
	if reservedStr, ok := u.Params["reserved"]; ok {
		reservedParts := strings.Split(reservedStr, ",")

		for _, part := range reservedParts {
			num, err := strconv.ParseUint(part, 10, 8)
			if err != nil {
				return nil, err
			}
			wgOpts.Reserved = append(wgOpts.Reserved, uint8(num))
		}
	}

	if localAddress, err := getOneOf(u.Params, "localaddress", "ip", "address"); err == nil {
		localAddressParts := strings.Split(localAddress, ",")
		for _, part := range localAddressParts {
			if !strings.Contains(part, "/") {
				part += "/24"
			}
			prefix, err := netip.ParsePrefix(part)
			if err != nil {
				return nil, err
			}
			wgOpts.LocalAddress = append(wgOpts.LocalAddress, prefix)
		}
	}

	// WARP support removed (blocked in Russia)
	// If no private key provided, WireGuard link is invalid
	if wgOpts.PrivateKey == "" {
		return nil, fmt.Errorf("wireguard: private key required")
	}

	return &T.Outbound{
		Type:    "wireguard",
		Tag:     u.Name,
		Options: wgOpts,
	}, nil
}
