package libbox

import (
	"encoding/binary"
	"fmt"
	"net"

	"github.com/sagernet/sing-box/protocol/group"
	E "github.com/sagernet/sing/common/exceptions"
	"github.com/sagernet/sing/common/varbin"
)

func (c *CommandClient) SelectOutbound(groupTag string, outboundTag string) error {
	conn, err := c.directConnect()
	if err != nil {
		return err
	}
	defer conn.Close()
	err = binary.Write(conn, binary.BigEndian, uint8(CommandSelectOutbound))
	if err != nil {
		return err
	}
	err = varbin.Write(conn, binary.BigEndian, groupTag)
	if err != nil {
		return err
	}
	err = varbin.Write(conn, binary.BigEndian, outboundTag)
	if err != nil {
		return err
	}
	return readError(conn)
}

func (s *CommandServer) handleSelectOutbound(conn net.Conn) error {
	groupTag, err := varbin.ReadValue[string](conn, binary.BigEndian)
	if err != nil {
		return err
	}
	outboundTag, err := varbin.ReadValue[string](conn, binary.BigEndian)
	if err != nil {
		return err
	}
	fmt.Printf("[SelectOutbound] groupTag=%q outboundTag=%q\n", groupTag, outboundTag)
	svc := s.service
	if svc == nil {
		fmt.Println("[SelectOutbound] ERROR: service not ready")
		return writeError(conn, E.New("service not ready"))
	}
	instance := svc.GetInstance()
	if instance == nil {
		fmt.Println("[SelectOutbound] ERROR: service instance not available")
		return writeError(conn, E.New("service instance not available"))
	}
	outboundGroup, isLoaded := instance.Outbound().Outbound(groupTag)
	if !isLoaded {
		fmt.Printf("[SelectOutbound] ERROR: selector not found: %s\n", groupTag)
		return writeError(conn, E.New("selector not found: ", groupTag))
	}
	selector, isSelector := outboundGroup.(*group.Selector)
	if !isSelector {
		fmt.Printf("[SelectOutbound] ERROR: outbound is not a selector: %s\n", groupTag)
		return writeError(conn, E.New("outbound is not a selector: ", groupTag))
	}
	if !selector.SelectOutbound(outboundTag) {
		fmt.Printf("[SelectOutbound] ERROR: outbound not found in selector: %s\n", outboundTag)
		return writeError(conn, E.New("outbound not found in selector: ", outboundTag))
	}
	fmt.Printf("[SelectOutbound] SUCCESS: selected %s in group %s\n", outboundTag, groupTag)
	return writeError(conn, nil)
}
