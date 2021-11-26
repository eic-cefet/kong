package main

import (
	"github.com/Kong/go-pdk"
	"github.com/Kong/go-pdk/server"
	"github.com/rs/zerolog/log"
)

type Plugin struct {
	PoweredBy string
}

const (
	headerName = "X-Powered-By"
	version    = "1.0.0"
	priority   = 100
)

func (plugin Plugin) Response(kong *pdk.PDK) {
	err := kong.Response.ClearHeader(headerName)
	if err != nil {
		log.Error().Err(err).Msg("failed to clear header")
		return
	}

	if plugin.PoweredBy != "" {
		err = kong.Response.SetHeader(headerName, plugin.PoweredBy)
		if err != nil {
			log.Error().Err(err).Msgf("failed to set header %s on Response", headerName)
		}
	}
}

func New() interface{} {
	return &Plugin{}
}

func main() {
	err := server.StartServer(New, version, priority)
	if err != nil {
		log.Fatal().Err(err).Msg("failed to start server for go-powered-by plugin")
	}
}
