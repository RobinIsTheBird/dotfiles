#!/usr/bin/env bash

# bootstrap gvm with basic go
curl -LSs \
'https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz' \
-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
-H 'Referer: https://golang.org/doc/install?download=go1.6.2.linux-amd64.tar.gz' \
-H 'Upgrade-Insecure-Requests: 1'  --compressed | \
sudo tar -C /usr/local xzf -

export GOPATH=$HOME/Dev/go_workspace
export GOBIN=$GOPATH/bin
gohellosrc=$GOPATH/src/github.com/RobinIsTheBird/hello
mkdir -p $gohellosrc
mkdir -p $GOBIN
cat > $gohellosrc/hello.go <<_END_
package main

import "fmt"

func main() {
    fmt.Printf("hello, world\n")
}
_END_
go install $gohellosrc/hello.go
[ ! -x $GOBIN/hello -o -z "$($GOBIN/hello)" ] && \
  { echo 'go installation failed' ; exit 1 }

# go version manager
(cd $HOME; bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer))
. $HOME/.gvm/scripts/gvm
gvm install go1.6.2
gvm use go1.6.2 --default
