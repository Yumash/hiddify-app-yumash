package config

import (
	"context"
	"fmt"
	"os"
	"path/filepath"
	"runtime/debug"

	"github.com/sagernet/sing-box/option"
	"github.com/sagernet/sing/common/json"
)

func SaveCurrentConfig(path string, options option.Options) (err error) {
	// Recover from panic - sing-box 1.12 options may not serialize properly
	defer func() {
		if r := recover(); r != nil {
			err = fmt.Errorf("SaveCurrentConfig panic: %v", r)
			fmt.Printf("WARNING: Config serialization failed (this is debug only): %v\n", r)
		}
	}()

	jsonStr, err := ToJson(options)
	if err != nil {
		fmt.Printf("WARNING: Config serialization error (this is debug only): %v\n", err)
		return err
	}
	p, err := filepath.Abs(path)
	fmt.Printf("Saving config to %v %+v\n", p, err)
	if err != nil {
		return err
	}
	return os.WriteFile(p, []byte(jsonStr), 0644)
}

func ToJson(options option.Options) (string, error) {
	// Use context-aware JSON marshalling for sing-box options
	// This is required for proper serialization of DNS servers and other context-dependent options
	ctx := context.Background()
	data, err := json.MarshalContext(ctx, options)
	if err != nil {
		fmt.Printf("ERROR in coding:%+v\n", err)
		return "", err
	}
	return string(data), nil
}

func DeferPanicToError(name string, err func(error)) {
	if r := recover(); r != nil {
		s := fmt.Errorf("%s panic: %s\n%s", name, r, string(debug.Stack()))
		err(s)
	}
}
