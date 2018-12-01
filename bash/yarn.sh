#!/usr/bin/env bash

if [[ -d $HOME/.yarn ]]; then
  export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"
fi
