alias ~="cd ~"
alias ..="ENHANCD_DISABLE_DOT=1 cd .."
alias -- -="ENHANCD_DISABLE_HYPHEN=1 cd -"
alias ls="ls --color=auto"
alias ll="ls -lAFh --group-directories-first"
alias tree="tree -C"
alias ssh="TERM=rxvt-256color ssh"

alias du='du -h'
alias job='jobs -l'
alias grep='grep --color=auto'
alias vim="nvim"
alias fig="docker-compose"
alias tf="terraform"

alias -g :fzf='$(fzf)'
alias -g :null='> /dev/null'
alias -g :grep='| grep'
alias -g :yank='| yank'

alias nsnitro=$GOPATH/src/github.com/dylanmei/go-nsnitro/bin/nsnitro
alias redis-cli='docker run -i --rm --net=host redis:alpine redis-cli'
alias rvc='docker run --rm -it -v $HOME/.rvc:/root/.rvc -e "RBVMOMI_USER=$VSPHERE_USER" -e "RBVMOMI_PASSWORD=$VSPHERE_PASSWORD" lamw/rvc rvc $VSPHERE_SERVER'
