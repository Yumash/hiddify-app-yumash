//go:build windows

package libbox

import (
	"net"

	E "github.com/sagernet/sing/common/exceptions"
)

// Windows uses TCP instead of Unix sockets (chown not supported)
func (s *CommandServer) Start() error {
	return s.listenTCP()
}

func (s *CommandServer) listenTCP() error {
	// Yumash Edition: using port 18964 to avoid conflict with original Hiddify (8964)
	listener, err := net.Listen("tcp", "127.0.0.1:18964")
	if err != nil {
		return E.Cause(err, "listen")
	}
	s.listener = listener
	go s.loopConnection(listener)
	return nil
}
