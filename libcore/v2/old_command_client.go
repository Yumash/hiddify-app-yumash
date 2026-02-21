package v2

import (
	"encoding/json"
	"fmt"

	"github.com/hiddify/hiddify-core/bridge"
	"github.com/sagernet/sing-box/experimental/libbox"
	"github.com/sagernet/sing-box/log"
)

var (
	_ libbox.CommandClientHandler = (*OldCommandClientHandler)(nil)
)

type OldCommandClientHandler struct {
	port   int64
	logger log.Logger
}

func (cch *OldCommandClientHandler) Connected() {
	fmt.Printf("[CommandClient] CONNECTED to port %d\n", cch.port)
	cch.logger.Debug("CONNECTED")
}

func (cch *OldCommandClientHandler) Disconnected(message string) {
	cch.logger.Debug("DISCONNECTED: ", message)
}

// ClearLogs implements CommandClientHandler interface (sing-box 1.12+)
func (cch *OldCommandClientHandler) ClearLogs() {
	cch.logger.Debug("clear logs")
}

// WriteLogs implements CommandClientHandler interface (sing-box 1.12+)
func (cch *OldCommandClientHandler) WriteLogs(messageList libbox.StringIterator) {
	if messageList == nil {
		return
	}
	for messageList.HasNext() {
		cch.logger.Debug("log: ", messageList.Next())
	}
}

func (cch *OldCommandClientHandler) WriteStatus(message *libbox.StatusMessage) {
	msg, err := json.Marshal(
		map[string]int64{
			"connections-in":  int64(message.ConnectionsIn),
			"connections-out": int64(message.ConnectionsOut),
			"uplink":          message.Uplink,
			"downlink":        message.Downlink,
			"uplink-total":    message.UplinkTotal,
			"downlink-total":  message.DownlinkTotal,
		},
	)
	cch.logger.Debug("Memory: ", libbox.FormatBytes(message.Memory), ", Goroutines: ", message.Goroutines)
	if err != nil {
		bridge.SendStringToPort(cch.port, fmt.Sprintf("error: %e", err))
	} else {
		bridge.SendStringToPort(cch.port, string(msg))
	}
}

func (cch *OldCommandClientHandler) WriteGroups(message libbox.OutboundGroupIterator) {
	fmt.Println("[WriteGroups] called, message nil:", message == nil)
	if message == nil {
		return
	}
	groups := []*OutboundGroup{}
	for message.HasNext() {
		group := message.Next()
		fmt.Printf("[WriteGroups] group: tag=%s type=%s selected=%s\n", group.Tag, group.Type, group.Selected)
		items := group.GetItems()
		groupItems := []*OutboundGroupItem{}
		for items.HasNext() {
			item := items.Next()
			groupItems = append(groupItems,
				&OutboundGroupItem{
					Tag:          item.Tag,
					Type:         item.Type,
					URLTestTime:  item.URLTestTime,
					URLTestDelay: item.URLTestDelay,
				},
			)
		}
		groups = append(groups, &OutboundGroup{Tag: group.Tag, Type: group.Type, Selected: group.Selected, Items: groupItems})
	}
	fmt.Printf("[WriteGroups] total groups: %d, sending to port %d\n", len(groups), cch.port)
	response, err := json.Marshal(groups)
	if err != nil {
		bridge.SendStringToPort(cch.port, fmt.Sprintf("error: %e", err))
	} else {
		bridge.SendStringToPort(cch.port, string(response))
	}
}

func (cch *OldCommandClientHandler) InitializeClashMode(modeList libbox.StringIterator, currentMode string) {
	cch.logger.Debug("initial clash mode: ", currentMode)
}

func (cch *OldCommandClientHandler) UpdateClashMode(newMode string) {
	cch.logger.Debug("update clash mode: ", newMode)
}

// WriteConnections implements CommandClientHandler interface (sing-box 1.12+)
func (cch *OldCommandClientHandler) WriteConnections(message *libbox.Connections) {
	if message == nil {
		return
	}
	// Count connections using iterator
	count := 0
	iter := message.Iterator()
	for iter.HasNext() {
		iter.Next()
		count++
	}
	cch.logger.Debug("connections count: ", count)
}

type OutboundGroup struct {
	Tag      string               `json:"tag"`
	Type     string               `json:"type"`
	Selected string               `json:"selected"`
	Items    []*OutboundGroupItem `json:"items"`
}

type OutboundGroupItem struct {
	Tag          string `json:"tag"`
	Type         string `json:"type"`
	URLTestTime  int64  `json:"url-test-time"`
	URLTestDelay int32  `json:"url-test-delay"`
}
