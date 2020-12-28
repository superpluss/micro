module github.com/micro/micro/v2

go 1.15

require (
	github.com/aws/aws-sdk-go v1.36.15
	github.com/boltdb/bolt v1.3.1
	github.com/chzyer/readline v0.0.0-20180603132655-2972be24d48e
	github.com/cloudflare/cloudflare-go v0.13.6
	github.com/dustin/go-humanize v1.0.0
	github.com/fsnotify/fsnotify v1.4.9
	github.com/go-acme/lego/v3 v3.9.0
	github.com/golang/protobuf v1.4.3
	github.com/google/uuid v1.1.2
	github.com/gorilla/handlers v1.5.1
	github.com/gorilla/mux v1.8.0
	github.com/micro/cli/v2 v2.1.2
	github.com/micro/go-micro v1.18.0 // indirect
	github.com/micro/go-micro/v2 v2.9.1
	github.com/miekg/dns v1.1.35
	github.com/netdata/go-orchestrator v0.0.0-20200917191103-724cb40df90f
	github.com/olekukonko/tablewriter v0.0.4
	github.com/patrickmn/go-cache v2.1.0+incompatible
	github.com/pkg/errors v0.9.1
	github.com/serenize/snaker v0.0.0-20201027110005-a7ad2135616e
	github.com/spf13/viper v1.7.1
	github.com/stretchr/testify v1.6.1
	github.com/xlab/treeprint v1.0.0
	golang.org/x/crypto v0.0.0-20201221181555-eec23a3978ad
	golang.org/x/net v0.0.0-20201224014010-6772e930b67b
	golang.org/x/tools v0.0.0-20201224043029-2b0845dc783e
	google.golang.org/genproto v0.0.0-20201214200347-8c77b98c765d
	google.golang.org/grpc v1.31.0
)

replace (
	github.com/micro/go-micro/v2 => E:\workspace\go\micro\go-micro
	google.golang.org/grpc => google.golang.org/grpc v1.26.0
)
