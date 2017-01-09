#!/bin/bash

if [[ -d ~/.bash ]]; then
  for f in ~/.bash/*.bash; do source $f; done
fi

[[ -f ~/proxy.env ]] && source ~/proxy.env

if [[ -e /usr/local/bin/gls ]]; then
  alias ls='/usr/local/bin/gls -F --color'
else
  alias ls='ls -F'
fi

alias ll='ls -lAFh --group-directories-first'
alias tree="tree -C"
alias ssh="TERM=rxvt-256color ssh"
alias grep='grep --color=auto'
alias vim='nvim'
alias fig="docker-compose"
alias tf="terraform"
