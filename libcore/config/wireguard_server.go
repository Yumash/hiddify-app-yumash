package config

import (
	"fmt"
	"net"
	"net/netip"
	"strings"

	"github.com/sagernet/sing-box/option"
	"github.com/sagernet/sing/common/json/badoption"
	"golang.zx2c4.com/wireguard/wgctrl/wgtypes"
)

const (
	WGLanServerTag = "wg-lan-server"
)

// GenerateWireGuardKeys generates a new WireGuard key pair
func GenerateWireGuardKeys() (privateKey, publicKey string, err error) {
	privKey, err := wgtypes.GeneratePrivateKey()
	if err != nil {
		return "", "", fmt.Errorf("failed to generate WireGuard private key: %w", err)
	}
	return privKey.String(), privKey.PublicKey().String(), nil
}

// EnsureWireGuardKeys ensures that WG keys exist, generating them if needed
func (opt *HiddifyOptions) EnsureWireGuardKeys() error {
	// Generate server keys if not present
	if opt.WGServerPrivateKey == "" {
		privKey, pubKey, err := GenerateWireGuardKeys()
		if err != nil {
			return fmt.Errorf("failed to generate server keys: %w", err)
		}
		opt.WGServerPrivateKey = privKey
		opt.WGServerPublicKey = pubKey
	} else if opt.WGServerPublicKey == "" {
		// Derive public key from private key
		privKey, err := wgtypes.ParseKey(opt.WGServerPrivateKey)
		if err != nil {
			return fmt.Errorf("invalid server private key: %w", err)
		}
		opt.WGServerPublicKey = privKey.PublicKey().String()
	}

	// Generate client keys if not present
	if opt.WGClientPrivateKey == "" {
		privKey, pubKey, err := GenerateWireGuardKeys()
		if err != nil {
			return fmt.Errorf("failed to generate client keys: %w", err)
		}
		opt.WGClientPrivateKey = privKey
		opt.WGClientPublicKey = pubKey
	} else if opt.WGClientPublicKey == "" {
		// Derive public key from private key
		privKey, err := wgtypes.ParseKey(opt.WGClientPrivateKey)
		if err != nil {
			return fmt.Errorf("invalid client private key: %w", err)
		}
		opt.WGClientPublicKey = privKey.PublicKey().String()
	}

	return nil
}

// GetWireGuardServerIP returns the server IP from subnet (first usable IP)
func (opt *HiddifyOptions) GetWireGuardServerIP() (string, error) {
	prefix, err := netip.ParsePrefix(opt.WGServerSubnet)
	if err != nil {
		return "", fmt.Errorf("invalid WG server subnet: %w", err)
	}
	// Server gets .1 address
	serverIP := prefix.Addr().Next() // .0 -> .1
	return serverIP.String(), nil
}

// GetWireGuardClientIP returns the client IP from subnet (second usable IP)
func (opt *HiddifyOptions) GetWireGuardClientIP() (string, error) {
	prefix, err := netip.ParsePrefix(opt.WGServerSubnet)
	if err != nil {
		return "", fmt.Errorf("invalid WG server subnet: %w", err)
	}
	// Client gets .2 address
	clientIP := prefix.Addr().Next().Next() // .0 -> .1 -> .2
	return clientIP.String(), nil
}

// GetLocalLANIP returns the local IP address in LAN network
func GetLocalLANIP() (string, error) {
	addrs, err := net.InterfaceAddrs()
	if err != nil {
		return "", err
	}

	for _, addr := range addrs {
		if ipnet, ok := addr.(*net.IPNet); ok && !ipnet.IP.IsLoopback() {
			if ipnet.IP.To4() != nil {
				ip := ipnet.IP.String()
				// Prefer private network addresses
				if strings.HasPrefix(ip, "192.168.") ||
					strings.HasPrefix(ip, "10.") ||
					strings.HasPrefix(ip, "172.") {
					return ip, nil
				}
			}
		}
	}

	return "", fmt.Errorf("no LAN IP address found")
}

// GenerateWireGuardClientConfig generates a WireGuard client config for mobile
func (opt *HiddifyOptions) GenerateWireGuardClientConfig() (string, error) {
	if err := opt.EnsureWireGuardKeys(); err != nil {
		return "", err
	}

	clientIP, err := opt.GetWireGuardClientIP()
	if err != nil {
		return "", err
	}

	lanIP, err := GetLocalLANIP()
	if err != nil {
		return "", fmt.Errorf("failed to get LAN IP: %w", err)
	}

	// Use remote DNS from settings
	dns := opt.RemoteDnsAddress
	if dns == "" {
		dns = "8.8.8.8"
	}

	config := fmt.Sprintf(`[Interface]
PrivateKey = %s
Address = %s/32
DNS = %s

[Peer]
PublicKey = %s
AllowedIPs = 0.0.0.0/0
Endpoint = %s:%d
PersistentKeepalive = 25
`,
		opt.WGClientPrivateKey,
		clientIP,
		dns,
		opt.WGServerPublicKey,
		lanIP,
		opt.WGServerPort,
	)

	return config, nil
}

// BuildWireGuardServerEndpoint creates the WireGuard endpoint for sing-box config
func (opt *HiddifyOptions) BuildWireGuardServerEndpoint() (*option.Endpoint, error) {
	if !opt.WGServerEnabled {
		return nil, nil
	}

	if err := opt.EnsureWireGuardKeys(); err != nil {
		return nil, err
	}

	serverIP, err := opt.GetWireGuardServerIP()
	if err != nil {
		return nil, err
	}

	clientIP, err := opt.GetWireGuardClientIP()
	if err != nil {
		return nil, err
	}

	prefix, err := netip.ParsePrefix(opt.WGServerSubnet)
	if err != nil {
		return nil, err
	}

	// Server address with subnet mask
	serverPrefix := netip.MustParsePrefix(fmt.Sprintf("%s/%d", serverIP, prefix.Bits()))
	// Client allowed IP (just that one client)
	clientPrefix := netip.MustParsePrefix(fmt.Sprintf("%s/32", clientIP))

	endpoint := &option.Endpoint{
		Type: "wireguard",
		Tag:  WGLanServerTag,
		Options: &option.WireGuardEndpointOptions{
			MTU:        1408,
			Address:    badoption.Listable[netip.Prefix]{serverPrefix},
			PrivateKey: opt.WGServerPrivateKey,
			ListenPort: opt.WGServerPort,
			Peers: []option.WireGuardPeer{
				{
					PublicKey:  opt.WGClientPublicKey,
					AllowedIPs: badoption.Listable[netip.Prefix]{clientPrefix},
				},
			},
		},
	}

	return endpoint, nil
}

// GetWireGuardServerInfo returns info for display in UI
type WireGuardServerInfo struct {
	Enabled      bool   `json:"enabled"`
	LanIP        string `json:"lan_ip"`
	Port         uint16 `json:"port"`
	ServerIP     string `json:"server_ip"`      // WG internal IP
	ClientIP     string `json:"client_ip"`      // WG internal IP for client
	ClientConfig string `json:"client_config"`  // Full config for QR
	ServerPubKey string `json:"server_pub_key"` // For display
}

func (opt *HiddifyOptions) GetWireGuardServerInfo() (*WireGuardServerInfo, error) {
	if !opt.WGServerEnabled {
		return &WireGuardServerInfo{Enabled: false}, nil
	}

	if err := opt.EnsureWireGuardKeys(); err != nil {
		return nil, err
	}

	lanIP, err := GetLocalLANIP()
	if err != nil {
		lanIP = "?.?.?.?"
	}

	serverIP, err := opt.GetWireGuardServerIP()
	if err != nil {
		return nil, err
	}

	clientIP, err := opt.GetWireGuardClientIP()
	if err != nil {
		return nil, err
	}

	clientConfig, err := opt.GenerateWireGuardClientConfig()
	if err != nil {
		return nil, err
	}

	return &WireGuardServerInfo{
		Enabled:      true,
		LanIP:        lanIP,
		Port:         opt.WGServerPort,
		ServerIP:     serverIP,
		ClientIP:     clientIP,
		ClientConfig: clientConfig,
		ServerPubKey: opt.WGServerPublicKey,
	}, nil
}
