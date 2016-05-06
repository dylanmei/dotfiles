#!/usr/bin/env zsh

export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin
export EDITOR=nvim
export VISUAL=nvim
bindkey -e

export PURE_PROMPT_SYMBOL='%%'

source ~/.zplug/zplug

zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "zsh-users/zsh-completions"
zplug "horosgrisa/zsh-history-substring-search"
#zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", nice:19

zplug "mafredri/zsh-async"
zplug "~/.zsh/zsh-pure", from:local

if ! zplug check; then
  zplug install
fi

zplug load

source ~/.zsh/aliases.zsh
source ~/.zsh/history.zsh
source ~/.zsh/fzf.zsh
source ~/.zsh/basher.zsh
source ~/.zsh/golang.zsh
