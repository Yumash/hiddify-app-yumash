package libbox

import (
	"encoding/binary"
	"net"

	"github.com/sagernet/sing-box/experimental/deprecated"
	"github.com/sagernet/sing/common"
	E "github.com/sagernet/sing/common/exceptions"
	"github.com/sagernet/sing/common/varbin"
	"github.com/sagernet/sing/service"
)

func (c *CommandClient) GetDeprecatedNotes() (DeprecatedNoteIterator, error) {
	conn, err := c.directConnect()
	if err != nil {
		return nil, err
	}
	defer conn.Close()
	err = binary.Write(conn, binary.BigEndian, uint8(CommandGetDeprecatedNotes))
	if err != nil {
		return nil, err
	}
	err = readError(conn)
	if err != nil {
		return nil, err
	}
	var features []deprecated.Note
	err = varbin.Read(conn, binary.BigEndian, &features)
	if err != nil {
		return nil, err
	}
	return newIterator(common.Map(features, func(it deprecated.Note) *DeprecatedNote { return (*DeprecatedNote)(&it) })), nil
}

func (s *CommandServer) handleGetDeprecatedNotes(conn net.Conn) error {
	boxService := s.service
	if boxService == nil {
		return writeError(conn, E.New("service not ready"))
	}
	ctx := boxService.GetContext()
	if ctx == nil {
		return writeError(conn, E.New("service context not available"))
	}
	err := writeError(conn, nil)
	if err != nil {
		return err
	}
	depManager := service.FromContext[deprecated.Manager](ctx)
	if depManager == nil {
		return varbin.Write(conn, binary.BigEndian, []deprecated.Note{})
	}
	if dm, ok := depManager.(*deprecatedManager); ok {
		return varbin.Write(conn, binary.BigEndian, dm.Get())
	}
	return varbin.Write(conn, binary.BigEndian, []deprecated.Note{})
}
