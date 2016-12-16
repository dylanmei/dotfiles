#!/bin/bash

shopt -s histappend
export HISTCONTROL=ignorespace:erasedups
export HISTSIZE=1000000

# enter a few characters and press UpArrow/DownArrow
# to search backwards/forwards through the history
if [[ -t 1 ]]; then
  bind '"[A":history-substring-search-backward'
  bind '"[B":history-substring-search-forward'
fi
