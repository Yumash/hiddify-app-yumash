package libbox

import (
	"context"
	"encoding/binary"
	"fmt"
	"net"
	"net/http"
	"time"

	"github.com/hiddify/hiddify-core/xray"
	"github.com/sagernet/sing-box/adapter"
	"github.com/sagernet/sing-box/common/urltest"
	"github.com/sagernet/sing-box/protocol/group"
	"github.com/sagernet/sing/common"
	"github.com/sagernet/sing/common/batch"
	E "github.com/sagernet/sing/common/exceptions"
	"github.com/sagernet/sing/common/varbin"
	"github.com/sagernet/sing/service"
	"golang.org/x/net/proxy"
)

func (c *CommandClient) URLTest(groupTag string) error {
	conn, err := c.directConnect()
	if err != nil {
		return err
	}
	defer conn.Close()
	err = binary.Write(conn, binary.BigEndian, uint8(CommandURLTest))
	if err != nil {
		return err
	}
	err = varbin.Write(conn, binary.BigEndian, groupTag)
	if err != nil {
		return err
	}
	return readError(conn)
}

// urlTestViaXray tests connectivity through Xray SOCKS proxy
// Returns delay in milliseconds or error
func urlTestViaXray(testURL string, port uint16) (uint16, error) {
	if testURL == "" {
		testURL = "https://www.gstatic.com/generate_204"
	}

	dialer, err := proxy.SOCKS5("tcp", fmt.Sprintf("127.0.0.1:%d", port), nil, proxy.Direct)
	if err != nil {
		return 0, fmt.Errorf("failed to create SOCKS5 dialer: %w", err)
	}

	transport := &http.Transport{
		DialContext: func(ctx context.Context, network, addr string) (net.Conn, error) {
			return dialer.Dial(network, addr)
		},
	}

	client := &http.Client{
		Transport: transport,
		Timeout:   10 * time.Second,
	}

	start := time.Now()
	resp, err := client.Head(testURL)
	if err != nil {
		return 0, err
	}
	resp.Body.Close()

	return uint16(time.Since(start).Milliseconds()), nil
}

func (s *CommandServer) handleURLTest(conn net.Conn) error {
	groupTag, err := varbin.ReadValue[string](conn, binary.BigEndian)
	if err != nil {
		return err
	}
	serviceNow := s.service
	if serviceNow == nil {
		return nil
	}
	instance := serviceNow.GetInstance()
	ctx := serviceNow.GetContext()
	if instance == nil || ctx == nil {
		return writeError(conn, E.New("service not ready"))
	}
	abstractOutboundGroup, isLoaded := instance.Outbound().Outbound(groupTag)
	if !isLoaded {
		return writeError(conn, E.New("outbound group not found: ", groupTag))
	}
	outboundGroup, isOutboundGroup := abstractOutboundGroup.(adapter.OutboundGroup)
	if !isOutboundGroup {
		return writeError(conn, E.New("outbound is not a group: ", groupTag))
	}
	urlTestGroup, isURLTest := abstractOutboundGroup.(*group.URLTest)
	if isURLTest {
		go urlTestGroup.CheckOutbounds()
	} else {
		historyStorage := service.PtrFromContext[urltest.HistoryStorage](ctx)
		outbounds := common.Filter(common.Map(outboundGroup.All(), func(it string) adapter.Outbound {
			itOutbound, _ := instance.Outbound().Outbound(it)
			return itOutbound
		}), func(it adapter.Outbound) bool {
			if it == nil {
				return false
			}
			_, isGroup := it.(adapter.OutboundGroup)
			return !isGroup
		})
		b, _ := batch.New(ctx, batch.WithConcurrencyNum[any](10))
		for _, detour := range outbounds {
			outboundToTest := detour
			outboundTag := outboundToTest.Tag()
			b.Go(outboundTag, func() (any, error) {
				var t uint16
				var testErr error

				// Check if this is an xray outbound - test via Xray SOCKS port
				if xray.IsXrayOutboundTag(outboundTag) {
					selector := xray.GetSelector()
					if selector.IsXrayRunning() {
						// Test through running Xray instance
						t, testErr = urlTestViaXray("", selector.GetXrayPort())
					} else {
						// Xray not running - mark as unavailable
						testErr = fmt.Errorf("xray not running for outbound %s", outboundTag)
					}
				} else {
					// Regular sing-box outbound - use standard test
					t, testErr = urltest.URLTest(ctx, "", outboundToTest)
				}

				if testErr != nil {
					historyStorage.DeleteURLTestHistory(outboundTag)
				} else {
					historyStorage.StoreURLTestHistory(outboundTag, &adapter.URLTestHistory{
						Time:  time.Now(),
						Delay: t,
					})
				}
				return nil, nil
			})
		}
	}
	return writeError(conn, nil)
}
