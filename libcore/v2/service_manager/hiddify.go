package service_manager

import (
	"github.com/sagernet/sing-box/adapter"
)

var (
	services    = []adapter.Service{}
	preservices = []adapter.Service{}
)

func RegisterPreservice(service adapter.Service) {
	preservices = append(services, service)
}

func Register(service adapter.Service) {
	services = append(services, service)
}

// startService starts a service through all lifecycle stages
func startService(service adapter.Service) error {
	for _, stage := range adapter.ListStartStages {
		if err := service.Start(stage); err != nil {
			return err
		}
	}
	return nil
}

func StartServices() error {
	CloseServices()
	for _, service := range preservices {
		if err := startService(service); err != nil {
			return err
		}
	}
	for _, service := range services {
		if err := startService(service); err != nil {
			return err
		}
	}
	return nil
}

func CloseServices() error {
	for _, service := range services {
		if err := service.Close(); err != nil {
			return err
		}
	}
	for _, service := range preservices {
		if err := service.Close(); err != nil {
			return err
		}
	}
	return nil
}
