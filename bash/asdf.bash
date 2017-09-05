#!/usr/bin/env bash

#if [ "${BASH_SOURCE[0]}" != "" ]; then
#  current_script_path="${BASH_SOURCE[0]}"
#else
#  current_script_path="$0"
#fi
#
#export ASDF_DIR
#ASDF_DIR="$(cd "$(dirname "$current_script_path")" &> /dev/null || exit 1; pwd)"
export ASDF_DIR=$HOME/.asdf
export PATH="${ASDF_DIR}/bin:${ASDF_DIR}/shims:$PATH"

if [ -n "$ZSH_VERSION" ]; then
  autoload -U bashcompinit
  bashcompinit
fi

_asdf () {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local cmd=${COMP_WORDS[1]}
  local prev=${COMP_WORDS[COMP_CWORD-1]}
  local plugins=$(asdf plugin-list | tr '\n' ' ')

  COMPREPLY=()

  case "$cmd" in
    plugin-update)
      COMPREPLY=($(compgen -W "$plugins --all" -- $cur))
      ;;
    plugin-remove|current|list|list-all)
      COMPREPLY=($(compgen -W "$plugins" -- $cur))
      ;;
    install)
      if [[ "$plugins" == *"$prev"* ]] ; then
        local versions=$(asdf list-all $prev)
        COMPREPLY=($(compgen -W "$versions" -- $cur))
      else
        COMPREPLY=($(compgen -W "$plugins" -- $cur))
      fi
      ;;
    uninstall|where|reshim)
      if [[ "$plugins" == *"$prev"* ]] ; then
        local versions=$(asdf list $prev)
        COMPREPLY=($(compgen -W "$versions" -- $cur))
      else
        COMPREPLY=($(compgen -W "$plugins" -- $cur))
      fi
      ;;
    *)
      local cmds='plugin-add plugin-list plugin-remove plugin-update install uninstall update current where list list-all reshim'
      COMPREPLY=($(compgen -W "$cmds" -- $cur))
      ;;
  esac

  return 0
}

complete -F _asdf asdf
