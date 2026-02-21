package v2

import (
	"fmt"

	"github.com/sagernet/sing-box/experimental/libbox"
)

var (
	oldStatusClient        *libbox.CommandClient
	oldGroupClient         *libbox.CommandClient
	oldGroupInfoOnlyClient *libbox.CommandClient
)

func StartCommand(command int32, port int64) error {
	fmt.Printf("[StartCommand] command=%d port=%d (CommandStatus=%d, CommandGroup=%d)\n", command, port, libbox.CommandStatus, libbox.CommandGroup)

	// Ensure coreLogFactory is initialized
	if coreLogFactory == nil {
		return fmt.Errorf("coreLogFactory is nil - Setup() must be called first")
	}

	switch command {
	case libbox.CommandStatus:
		oldStatusClient = libbox.NewCommandClient(
			&OldCommandClientHandler{
				port:   port,
				logger: coreLogFactory.NewLogger("[Status Command Client]"),
			},
			&libbox.CommandClientOptions{
				Command:        libbox.CommandStatus,
				StatusInterval: 1000000000, //1000ms debounce
			},
		)
		return oldStatusClient.Connect()
	case libbox.CommandGroup:
		oldGroupClient = libbox.NewCommandClient(
			&OldCommandClientHandler{
				port:   port,
				logger: coreLogFactory.NewLogger("[Group Command Client]"),
			},
			&libbox.CommandClientOptions{
				Command:        libbox.CommandGroup,
				StatusInterval: 300000000, //300ms debounce
			},
		)
		return oldGroupClient.Connect()
	// In sing-box 1.12+, CommandGroupInfoOnly was removed
	// Using CommandGroup as fallback with same variable name for compatibility
	case 3: // Previous value of CommandGroupInfoOnly
		oldGroupInfoOnlyClient = libbox.NewCommandClient(
			&OldCommandClientHandler{
				port:   port,
				logger: coreLogFactory.NewLogger("[GroupInfoOnly Command Client]"),
			},
			&libbox.CommandClientOptions{
				Command:        libbox.CommandGroup, // Use CommandGroup instead
				StatusInterval: 300000000, //300ms debounce
			},
		)
		return oldGroupInfoOnlyClient.Connect()
	}
	return nil
}

func StopCommand(command int32) error {
	switch command {
	case libbox.CommandStatus:
		if oldStatusClient != nil {
			err := oldStatusClient.Disconnect()
			oldStatusClient = nil
			return err
		}
	case libbox.CommandGroup:
		if oldGroupClient != nil {
			err := oldGroupClient.Disconnect()
			oldGroupClient = nil
			return err
		}
	case 3: // Previous value of CommandGroupInfoOnly (removed in sing-box 1.12)
		if oldGroupInfoOnlyClient != nil {
			err := oldGroupInfoOnlyClient.Disconnect()
			oldGroupInfoOnlyClient = nil
			return err
		}
	}
	return nil
}
