#!/usr/bin/env zsh

source ~/.zplug/zplug

zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-completions"
zplug "mafredri/zsh-async"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "horosgrisa/zsh-history-substring-search", nice:11

# local plugins
zplug "~/.zsh/zsh-pure", from:local
zplug "~/.segreti", from:local, nice:1, use:"*.sh"

if ! zplug check; then
  zplug install
fi

zplug load

source ~/.zsh/cache.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/history.zsh
source ~/.zsh/fzf.zsh
source ~/.zsh/basher.zsh
source ~/.zsh/golang.zsh
source ~/.zsh/workdir.zsh
