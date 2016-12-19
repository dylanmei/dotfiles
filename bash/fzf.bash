#!/bin/bash

[[ -d /usr/share/fzf ]]           && scripts=/usr/share/fzf
[[ -d /usr/local/opt/fzf/shell ]] && scripts=/usr/local/opt/fzf/shell

if [[ -n "$scripts" ]]; then
  source $scripts/completion.bash
  source $scripts/key-bindings.bash
fi
