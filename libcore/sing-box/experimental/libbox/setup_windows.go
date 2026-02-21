//go:build windows

package libbox

import (
	"os"
	"runtime/debug"
	"time"

	C "github.com/sagernet/sing-box/constant"
	"github.com/sagernet/sing-box/experimental/locale"
	"github.com/sagernet/sing-box/log"
	"github.com/sagernet/sing/common/byteformats"
)

var (
	sBasePath        string
	sWorkingPath     string
	sTempPath        string
	sUserID          int
	sGroupID         int
	sTVOS            bool
	sFixAndroidStack bool
)

func init() {
	debug.SetPanicOnFault(true)
}

type SetupOptions struct {
	BasePath        string
	WorkingPath     string
	TempPath        string
	Username        string
	IsTVOS          bool
	FixAndroidStack bool
}

func Setup(options *SetupOptions) error {
	sBasePath = options.BasePath
	sWorkingPath = options.WorkingPath
	sTempPath = options.TempPath
	// On Windows, Getuid/Getgid return -1 and Chown is not supported
	sUserID = -1
	sGroupID = -1
	sTVOS = options.IsTVOS
	sFixAndroidStack = options.FixAndroidStack

	os.MkdirAll(sWorkingPath, 0o777)
	os.MkdirAll(sTempPath, 0o777)
	// Skip Chown on Windows - not supported
	return nil
}

func SetLocale(localeId string) {
	locale.Set(localeId)
}

func Version() string {
	return C.Version
}

func FormatBytes(length int64) string {
	return byteformats.FormatBytes(uint64(length))
}

func FormatMemoryBytes(length int64) string {
	return byteformats.FormatMemoryBytes(uint64(length))
}

func FormatDuration(duration int64) string {
	return log.FormatDuration(time.Duration(duration) * time.Millisecond)
}

func ProxyDisplayType(proxyType string) string {
	return C.ProxyDisplayName(proxyType)
}
