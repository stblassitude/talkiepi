talkiepi:
	HOME=$$(pwd) git config --global http.sslVerify false
	wget -N --no-check-certificate https://golang.org/dl/go1.11.13.linux-arm64.tar.gz
	[ -d go ] || tar zxf $$(pwd)/go1.11.13.linux-arm64.tar.gz
	mkdir -p $$(pwd)/gopath
	HOME=$$(pwd) GOPATH=$$(pwd)/gopath GOCACHE=off $$(pwd)/go/bin/go get -insecure github.com/dchote/gopus
	HOME=$$(pwd) GOPATH=$$(pwd)/gopath GOCACHE=off $$(pwd)/go/bin/go get -insecure github.com/dchote/talkiepi
	HOME=$$(pwd) GOPATH=$$(pwd)/gopath GOCACHE=off $$(pwd)/go/bin/go build -o talkiepi cmd/talkiepi/main.go

install: talkiepi
	mkdir -p $$(pwd)/debian/talkiepi/usr/local/bin
	install -m 0755 talkiepi $$(pwd)/debian/talkiepi/usr/local/bin 

