if [[ -d ~/.basher ]]; then
  export PATH="$PATH:$HOME/.basher/bin"
  eval "$(basher init -)"
fi
