package main

import (
	"fmt"
	pdk "github.com/Kong/go-pdk"
	"github.com/Kong/go-pdk/server"
)

type Plugin struct {
	SeminariesAddress string
}

const (
	headerName = "X-Seminaries-Address"
	version    = "1.0.0"
	priority   = 100
)

func (plugin Plugin) Access(kong *pdk.PDK) {
	err := kong.Log.Info("Adding X-Seminaries-Address header")
	if err != nil {
		return
	}

	err = kong.ServiceRequest.SetHeader(headerName, plugin.SeminariesAddress)

	if err != nil {
		err := kong.Log.Err(err)
		if err != nil {
			return
		}
	}
}

func New() interface{} {
	return &Plugin{}
}

func main() {
	err := server.StartServer(New, version, priority)
	if err != nil {
		panic(fmt.Errorf("could not start server: %w", err))
	}
}
