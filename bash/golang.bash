#!/usr/bin/env bash

if [[ -d $HOME/src/go ]]; then
  export GOPATH=$HOME/src/go
  export PATH=$PATH:$GOPATH/bin
fi
