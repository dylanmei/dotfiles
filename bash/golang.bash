#!/usr/bin/env bash

if [[ -d /usr/local/go/bin ]]; then
  export PATH=$PATH:/usr/local/go/bin
fi

if [[ -d $HOME/src/go ]]; then
  export GOPATH=$HOME/src/go
  export PATH=$PATH:$GOPATH/bin
fi
