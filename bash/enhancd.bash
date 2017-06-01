#!/usr/bin/env bash

[[ -d /usr/src/enhancd ]]  && export ENHANCD_ROOT=/usr/src/enhancd
[[ -d $HOME/src/enhancd ]] && export ENHANCD_ROOT=$HOME/src/enhancd

if [[ -n "$ENHANCD_ROOT" ]]; then
  export ENHANCD_FILTER="fzf"

  source $ENHANCD_ROOT/init.sh

  alias ~='ENHANCD_DISABLE_HOME=1 cd ~'
  alias ..='ENHANCD_DISABLE_DOT=1 cd ..'
  alias ...='ENHANCD_DISABLE_DOT=1 cd ../..'
  alias -- -='ENHANCD_DISABLE_HYPHEN=1 cd -'
fi
