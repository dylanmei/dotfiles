#!/usr/bin/env bash

# If you would like to customize your colors, use
# # Attribution: http://linuxtidbits.wordpress.com/2008/08/11/output-color-on-bash-scripts/
# for i in $(seq 0 $(tput colors)); do
#   echo " $(tput setaf $i)Text$(tput sgr0) $(tput bold)$(tput setaf $i)Text$(tput sgr0) $(tput sgr 0 1)$(tput setaf $i)Text$(tput sgr0)  \$(tput setaf $i)"
# done

# Save common color actions
prompt_bold="$(tput bold)"
prompt_reset="$(tput sgr0)"

if [[ "$(tput colors)" -ge 256 ]] &> /dev/null; then
  # If the terminal supports at least 256 colors, write out our 256 color based set
  prompt_symbol_color="$prompt_bold$(tput setaf 7)" # BOLD WHITE
else
  # Otherwise, use colors from our set of 8
  prompt_symbol_color="$prompt_bold$(tput setaf 7)" # BOLD WHITE
fi

if [[ "$UID" == 0 ]]; then
  prompt_symbol="#"
else
  prompt_symbol="%"
fi

# Apply any color overrides that have been set in the environment
if [[ -n "$PROMPT_DIR_COLOR" ]];    then prompt_dir_color="$PROMPT_DIR_COLOR"; fi
if [[ -n "$PROMPT_SYMBOL" ]];       then prompt_symbol="$PROMPT_SYMBOL"; fi
if [[ -n "$PROMPT_SYMBOL_COLOR" ]]; then prompt_symbol_color="$PROMPT_SYMBOL_COLOR"; fi

prompt_working_dir () {
  echo -ne '\e]0;'${PWD##*/}'\a'
}

PS1="$( prompt_working_dir )\n\[$prompt_symbol_color\]$prompt_symbol \[$prompt_reset\]"
