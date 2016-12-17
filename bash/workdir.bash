#!/usr/bin/env bash

# Keeps track of the last used working directory and
# automatically jumps into it for new shells.

# Flag indicating if we've previously jumped to last directory.
typeset -g SHELL_WORKDIR
cache_file="/tmp/workdir"

function remember_lwd() {
	pwd >| "$cache_file"
}

function jump_to_lwd() {
	[[ ! -r "$cache_file" ]] || cd "`cat "$cache_file"`"
}

# Automatically jump to last working directory unless this
# isn't the first time this plugin has been loaded.
if [[ -z "$SHELL_WORKDIR" ]]; then
  echo "here"
	jump_to_lwd 2>/dev/null && SHELL_WORKDIR=1 || true
fi

PROMPT_COMMAND="remember_lwd; $PROMPT_COMMAND"
