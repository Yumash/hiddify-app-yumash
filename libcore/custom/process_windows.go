//go:build windows

package main

import (
	"strings"
	"syscall"
	"unsafe"

	"golang.org/x/sys/windows"
)

// RunningProcess represents a running process
type RunningProcess struct {
	Name string `json:"name"`
	PID  uint32 `json:"pid"`
}

// systemProcesses contains process names that should be filtered out
var systemProcesses = map[string]bool{
	"system":                    true,
	"system idle process":      true,
	"registry":                 true,
	"smss.exe":                 true,
	"csrss.exe":                true,
	"wininit.exe":              true,
	"services.exe":             true,
	"lsass.exe":                true,
	"svchost.exe":              true,
	"dwm.exe":                  true,
	"fontdrvhost.exe":          true,
	"wmiprvse.exe":             true,
	"searchindexer.exe":        true,
	"conhost.exe":              true,
	"runtimebroker.exe":        true,
	"spoolsv.exe":              true,
	"lsaiso.exe":               true,
	"securityhealthservice.exe": true,
	"sgrmbroker.exe":           true,
	"dashost.exe":              true,
	"sihost.exe":               true,
	"taskhostw.exe":            true,
	"ctfmon.exe":               true,
	"audiodg.exe":              true,
	"searchhost.exe":           true,
	"startmenuexperiencehost.exe": true,
	"textinputhost.exe":        true,
	"dllhost.exe":              true,
	"winlogon.exe":             true,
	"memory compression":       true,
	"secure system":            true,
	"idle":                     true,
}

// ListRunningProcesses returns a list of running non-system processes
func ListRunningProcesses() ([]RunningProcess, error) {
	snapshot, err := windows.CreateToolhelp32Snapshot(windows.TH32CS_SNAPPROCESS, 0)
	if err != nil {
		return nil, err
	}
	defer windows.CloseHandle(snapshot)

	var entry windows.ProcessEntry32
	entry.Size = uint32(unsafe.Sizeof(entry))

	err = windows.Process32First(snapshot, &entry)
	if err != nil {
		return nil, err
	}

	seen := make(map[string]bool)
	var processes []RunningProcess

	for {
		name := syscall.UTF16ToString(entry.ExeFile[:])
		nameLower := strings.ToLower(name)

		// Skip system processes and duplicates
		if !systemProcesses[nameLower] && !seen[nameLower] {
			seen[nameLower] = true
			processes = append(processes, RunningProcess{
				Name: name,
				PID:  entry.ProcessID,
			})
		}

		err = windows.Process32Next(snapshot, &entry)
		if err != nil {
			break
		}
	}

	return processes, nil
}
