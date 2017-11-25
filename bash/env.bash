#!/usr/bin/env bash

export LANG="en_US.UTF-8"
export LC_ALL="${LANG}"

export TERM=xterm-256color
export EDITOR=nvim
export VISUAL=nvim

export CLICOLOR=1

#export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export WORDCHARS='*?.[]~&;!#$%^(){}<>'

export GREP_COLOR="1;33"

# Pager
export PAGER=less
export LESS='-R -f -X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'
export LESSCHARSET='utf-8'

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;44;37m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export AWS_REGION=us-west-2
export AWS_DEFAULT_REGION=us-west-2

alias ll='ls -lAFh --group-directories-first'
alias tree="tree -a -C -I .git"
alias ssh="TERM=rxvt-256color ssh"
alias grep='grep --color=auto'
alias vim='nvim'
alias fig="docker-compose"
alias tf="terraform"
