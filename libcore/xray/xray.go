// Package xray provides a wrapper for running Xray-core as a subprocess
// This enables support for XHTTP transport and other Xray-specific features
package xray

import (
	"encoding/json"
	"fmt"
	"io"
	"os"
	"os/exec"
	"path/filepath"
	"sync"
	"syscall"
	"time"
)

// XrayService manages an Xray-core subprocess
type XrayService struct {
	cmd        *exec.Cmd
	configPath string
	listenPort uint16
	running    bool
	mu         sync.RWMutex
	stdout     io.ReadCloser
	stderr     io.ReadCloser
	exePath    string
}

// Config represents Xray-core configuration
type Config struct {
	Log       *LogConfig       `json:"log,omitempty"`
	Inbounds  []Inbound        `json:"inbounds"`
	Outbounds []Outbound       `json:"outbounds"`
	Routing   *RoutingConfig   `json:"routing,omitempty"`
}

type LogConfig struct {
	Loglevel string `json:"loglevel,omitempty"`
	Access   string `json:"access,omitempty"`
	Error    string `json:"error,omitempty"`
}

type Inbound struct {
	Tag      string          `json:"tag,omitempty"`
	Port     uint16          `json:"port"`
	Listen   string          `json:"listen,omitempty"`
	Protocol string          `json:"protocol"`
	Settings json.RawMessage `json:"settings,omitempty"`
	Sniffing *Sniffing       `json:"sniffing,omitempty"`
}

type Sniffing struct {
	Enabled      bool     `json:"enabled"`
	DestOverride []string `json:"destOverride,omitempty"`
}

type Outbound struct {
	Tag            string          `json:"tag,omitempty"`
	Protocol       string          `json:"protocol"`
	Settings       json.RawMessage `json:"settings,omitempty"`
	StreamSettings *StreamSettings `json:"streamSettings,omitempty"`
	Mux            *MuxConfig      `json:"mux,omitempty"`
}

type StreamSettings struct {
	Network     string         `json:"network,omitempty"`
	Security    string         `json:"security,omitempty"`
	TLSSettings *TLSSettings   `json:"tlsSettings,omitempty"`
	XHTTPSettings *XHTTPSettings `json:"xhttpSettings,omitempty"`
	WSSettings  *WSSettings    `json:"wsSettings,omitempty"`
	GRPCSettings *GRPCSettings `json:"grpcSettings,omitempty"`
}

type TLSSettings struct {
	ServerName         string   `json:"serverName,omitempty"`
	AllowInsecure      bool     `json:"allowInsecure,omitempty"`
	ALPN               []string `json:"alpn,omitempty"`
	Fingerprint        string   `json:"fingerprint,omitempty"`
}

type XHTTPSettings struct {
	Path   string            `json:"path,omitempty"`
	Host   string            `json:"host,omitempty"`
	Mode   string            `json:"mode,omitempty"` // "auto", "packet-up", "stream-up", "stream-one"
	Extra  map[string]string `json:"extra,omitempty"`
}

type WSSettings struct {
	Path    string            `json:"path,omitempty"`
	Headers map[string]string `json:"headers,omitempty"`
}

type GRPCSettings struct {
	ServiceName string `json:"serviceName,omitempty"`
	MultiMode   bool   `json:"multiMode,omitempty"`
}

type MuxConfig struct {
	Enabled     bool   `json:"enabled"`
	Concurrency int    `json:"concurrency,omitempty"`
}

type RoutingConfig struct {
	DomainStrategy string        `json:"domainStrategy,omitempty"`
	Rules          []RoutingRule `json:"rules,omitempty"`
}

type RoutingRule struct {
	Type        string   `json:"type"`
	OutboundTag string   `json:"outboundTag,omitempty"`
	InboundTag  []string `json:"inboundTag,omitempty"`
	Domain      []string `json:"domain,omitempty"`
	IP          []string `json:"ip,omitempty"`
	Port        string   `json:"port,omitempty"`
	Network     string   `json:"network,omitempty"`
}

// findXrayExe locates xray-core.exe in common paths
func findXrayExe() (string, error) {
	// Check same directory as libcore.dll
	exePath, err := os.Executable()
	if err == nil {
		dir := filepath.Dir(exePath)
		xrayPath := filepath.Join(dir, "xray-core.exe")
		if _, err := os.Stat(xrayPath); err == nil {
			return xrayPath, nil
		}
	}

	// Check current working directory
	cwd, err := os.Getwd()
	if err == nil {
		xrayPath := filepath.Join(cwd, "xray-core.exe")
		if _, err := os.Stat(xrayPath); err == nil {
			return xrayPath, nil
		}
	}

	// Check PATH
	xrayPath, err := exec.LookPath("xray-core.exe")
	if err == nil {
		return xrayPath, nil
	}

	return "", fmt.Errorf("xray-core.exe not found")
}

// NewService creates a new XrayService
func NewService(config *Config, listenPort uint16) (*XrayService, error) {
	exePath, err := findXrayExe()
	if err != nil {
		return nil, err
	}

	// Create temp config file
	tempDir := os.TempDir()
	configPath := filepath.Join(tempDir, fmt.Sprintf("xray_config_%d.json", time.Now().UnixNano()))

	configData, err := json.MarshalIndent(config, "", "  ")
	if err != nil {
		return nil, fmt.Errorf("failed to marshal config: %w", err)
	}

	if err := os.WriteFile(configPath, configData, 0644); err != nil {
		return nil, fmt.Errorf("failed to write config: %w", err)
	}

	return &XrayService{
		configPath: configPath,
		listenPort: listenPort,
		exePath:    exePath,
	}, nil
}

// Start starts the Xray-core subprocess
func (s *XrayService) Start() error {
	s.mu.Lock()
	defer s.mu.Unlock()

	if s.running {
		return fmt.Errorf("xray already running")
	}

	s.cmd = exec.Command(s.exePath, "run", "-c", s.configPath)

	// Hide the console window on Windows (CREATE_NO_WINDOW)
	s.cmd.SysProcAttr = &syscall.SysProcAttr{
		CreationFlags: 0x08000000,
	}

	// Capture output for debugging
	stdout, err := s.cmd.StdoutPipe()
	if err != nil {
		return fmt.Errorf("failed to get stdout: %w", err)
	}
	s.stdout = stdout

	stderr, err := s.cmd.StderrPipe()
	if err != nil {
		return fmt.Errorf("failed to get stderr: %w", err)
	}
	s.stderr = stderr

	if err := s.cmd.Start(); err != nil {
		return fmt.Errorf("failed to start xray: %w", err)
	}

	s.running = true

	// Wait for xray to be ready (give it a moment to bind ports)
	time.Sleep(200 * time.Millisecond)

	return nil
}

// Stop stops the Xray-core subprocess
func (s *XrayService) Stop() error {
	s.mu.Lock()
	defer s.mu.Unlock()

	if !s.running {
		return nil
	}

	if s.cmd != nil && s.cmd.Process != nil {
		// Try graceful shutdown first
		if err := s.cmd.Process.Signal(os.Interrupt); err != nil {
			// If interrupt fails, force kill
			s.cmd.Process.Kill()
		}
		s.cmd.Wait()
	}

	// Clean up config file
	if s.configPath != "" {
		os.Remove(s.configPath)
	}

	s.running = false
	return nil
}

// IsRunning returns whether the service is running
func (s *XrayService) IsRunning() bool {
	s.mu.RLock()
	defer s.mu.RUnlock()
	return s.running
}

// ListenPort returns the port this service is listening on
func (s *XrayService) ListenPort() uint16 {
	return s.listenPort
}

// Close stops the service and cleans up resources
func (s *XrayService) Close() error {
	return s.Stop()
}

// ReadStdout reads output from Xray's stdout
func (s *XrayService) ReadStdout() ([]byte, error) {
	if s.stdout == nil {
		return nil, fmt.Errorf("stdout not available")
	}
	return io.ReadAll(s.stdout)
}

// ReadStderr reads output from Xray's stderr
func (s *XrayService) ReadStderr() ([]byte, error) {
	if s.stderr == nil {
		return nil, fmt.Errorf("stderr not available")
	}
	return io.ReadAll(s.stderr)
}
