#!/usr/bin/env bash

[[ -d /usr/src/enhancd ]] && export ENHANCD_ROOT=/usr/src/enhancd
[[ -d ~/src/enhancd ]]    && export ENHANCD_ROOT=~/src/enhancd

if [[ -n "$ENHANCD_ROOT" ]]; then
  export ENHANCD_FILTER="fzf"
  export ENHANCD_DOT_ARG=_dot
  export ENHANCD_HYPHEN_ARG=_hyphen

  source $ENHANCD_ROOT/init.sh

  alias ~='cd ~'
  alias ..='cd _dot'
  alias -- -='cd _hyphen'
fi
