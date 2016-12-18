#!/usr/bin/env bash

[[ -e /usr/bin/go ]]       && export GOBIN=/usr/bin/go
[[ -e /usr/local/bin/go ]] && export GOBIN=/usr/local/bin/go

if [[ -n "$GOBIN" ]]; then
  export GOPATH=~/src/go
  export PATH=$PATH:$GOPATH/bin
fi
