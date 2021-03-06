package main

import (
	"github.com/netdata/go-orchestrator/plugin"
	"os"
	"path"

	"github.com/jessevdk/go-flags"
	"github.com/micro/go-micro/v2"
	log "github.com/micro/go-micro/v2/logger"
	mp "github.com/micro/micro/v2/service/debug/collector/micro"
	"github.com/netdata/go-orchestrator/cli"
	"github.com/netdata/go-orchestrator/pkg/multipath"
)

var (
	cd, _         = os.Getwd()
	netdataConfig = multipath.New(
		os.Getenv("NETDATA_USER_CONFIG_DIR"),
		os.Getenv("NETDATA_STOCK_CONFIG_DIR"),
		path.Join(cd, "/../../../../etc/netdata"),
		path.Join(cd, "/../../../../usr/lib/netdata/conf.d"),
	)
)

func main() {
	// New Service
	service := micro.NewService(
		micro.Name("go.micro.debug.collector"),
		micro.Version("latest"),
	)

	if len(os.Args) > 1 {
		os.Args = append(os.Args[:1], os.Args[2:]...)
	}

	// Initialise service
	service.Init()

	go func() {
		log.Fatal(service.Run())
	}()

	// register the new mp
	mp.New(service.Client()).Register()

	opt, err := cli.Parse(os.Args)
	if err != nil {
		if flagsErr, ok := err.(*flags.Error); ok && flagsErr.Type == flags.ErrHelp {
			os.Exit(0)
		}
		os.Exit(1)
	}

	p := plugin.New(plugin.Config{
		Name:              "micro.d",
		ConfDir:           netdataConfig,
		ModulesConfDir:    netdataConfig,
		ModulesSDConfPath: opt.WatchPath,
		RunModule:         opt.Module,
		MinUpdateEvery:    opt.UpdateEvery,
	})

	p.Run()
}
