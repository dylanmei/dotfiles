#!/bin/bash

export ENHANCD_FILTER="/usr/bin/fzf"
export ENHANCD_DOT_ARG=_dot
export ENHANCD_HYPHEN_ARG=_hyphen

if [[ -d /usr/src/enhancd ]]; then
  source /usr/src/enhancd/init.sh
fi

alias ~='cd ~'
alias ..='cd _dot'
alias -- -='cd _hyphen'
