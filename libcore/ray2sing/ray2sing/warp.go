package ray2sing

import (
	"fmt"

	T "github.com/sagernet/sing-box/option"
)

// WarpSingbox is disabled - WARP is blocked in Russia
// Returns error for any warp:// URLs
func WarpSingbox(url string) (*T.Outbound, error) {
	return nil, fmt.Errorf("WARP protocol is not supported (blocked in Russia)")
}
