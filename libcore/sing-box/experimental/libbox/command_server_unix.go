//go:build !windows

package libbox

import (
	"net"
	"os"
	"path/filepath"

	E "github.com/sagernet/sing/common/exceptions"
)

func (s *CommandServer) Start() error {
	if !sTVOS {
		return s.listenUNIX()
	} else {
		return s.listenTCP()
	}
}

func (s *CommandServer) listenUNIX() error {
	sockPath := filepath.Join(sBasePath, "command.sock")
	os.Remove(sockPath)
	listener, err := net.ListenUnix("unix", &net.UnixAddr{
		Name: sockPath,
		Net:  "unix",
	})
	if err != nil {
		return E.Cause(err, "listen ", sockPath)
	}
	err = os.Chown(sockPath, sUserID, sGroupID)
	if err != nil {
		listener.Close()
		os.Remove(sockPath)
		return E.Cause(err, "chown")
	}
	s.listener = listener
	go s.loopConnection(listener)
	return nil
}

func (s *CommandServer) listenTCP() error {
	// Yumash Edition: using port 18964 to avoid conflict with original Hiddify
	listener, err := net.Listen("tcp", "127.0.0.1:18964")
	if err != nil {
		return E.Cause(err, "listen")
	}
	s.listener = listener
	go s.loopConnection(listener)
	return nil
}
