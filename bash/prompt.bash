#!/usr/bin/env bash

# exit for non-interactive
[[ -z $PS1 ]] && return

MYPROMPT_SYMBOL=%%

__myprompt() {
  local symbol="$1"

  # define variables
  ICONS=( "⚑" "»" "♆" "☀" "❄" "+" "▶" "⇠" "⇡" "⇢" "⇣" )
  GIT_BRANCH_CHANGED_SYMBOL=${ICONS[0]}
  GIT_NEED_PUSH_SYMBOL=${ICONS[8]}
  GIT_NEED_PULL_SYMBOL=${ICONS[10]}
  DIM="\[$(tput dim)\]"
  REVERSE="\[$(tput rev)\]"
  RESET="\[$(tput sgr0)\]"
  BOLD="\[$(tput bold)\]"

  __colors() {
    if (( $(tput colors) < 256 )); then
      # 8 color support
      COLOR_USER="\[$(tput setaf 7)\]\[$(tput setab 0)\]"
      COLOR_K8S="\[$(tput setaf 3)\]\[$(tput setab 0)\]"
      COLOR_AWS="\[$(tput setaf 3)\]\[$(tput setab 0)\]"
      COLOR_DIR="\[$(tput setaf 7)\]\[$(tput setab 0)\]"
      COLOR_GIT="\[$(tput setaf 7)\]\[$(tput setab 4)\]"
      COLOR_RC="\[$(tput setaf 7)\]\[$(tput setab 1)\]"
      COLOR_JOBS="\[$(tput setaf 7)\]\[$(tput setab 5)\]"
    else
      # 256 color support
      COLOR_USER="\[$(tput setaf 15)\]\[$(tput setab 8)\]"
      COLOR_K8S="\[$(tput setaf 7)\]\[$(tput setab 33)\]"
      COLOR_AWS="\[$(tput setaf 7)\]\[$(tput setab 130)\]"
      COLOR_DIR="\[$(tput setaf 7)\]\[$(tput setab 238)\]"
      COLOR_GIT="\[$(tput setaf 15)\]\[$(tput setab 60)\]"
      COLOR_RC="\[$(tput setaf 15)\]\[$(tput setab 1)\]"
      COLOR_JOBS="\[$(tput setaf 15)\]\[$(tput setab 5)\]"
    fi
  }
  __workdir() {
    local current_path="${PWD/$HOME/\~}"
    IFS='/' read -a dir_array <<< "$current_path"
    local path=""
    local dir_len=$((${#dir_array[@]}-1))
    for dir in ${dir_array[@]:0:$dir_len}; do
      [[ $dir == '~' ]] && path="${dir:0:1}" || path="$path/${dir:0:1}"
    done
    printf "$path/${dir_array[$dir_len]}"
  }
  __git_display() {
    local branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || git describe --tags --always 2>/dev/null)"
    [ -n "$branch" ] || return  # git branch not found
    local marks
    # branch is modified?
    [ -n "$(git status --porcelain)" ] && marks+=" $GIT_BRANCH_CHANGED_SYMBOL"
    # how many commits local branch is ahead/behind of remote?
    local stat="$(git rev-list --left-right --boundary @{u}... 2>/dev/null)"
    local aheadN="$(echo $stat | grep -o ">" -c)"
    local behindN="$(echo $stat | grep -o "<" -c)"
    [ "$aheadN" -gt 0 ] && marks+=" $GIT_NEED_PUSH_SYMBOL$aheadN"
    [ "$behindN" -gt 0 ] && marks+=" $GIT_NEED_PULL_SYMBOL$behindN"
    printf "$COLOR_GIT $GIT_BRANCH_SYMBOL$branch$marks $RESET"
  }
  __aws_display() {
    local profile="$AWS_PROFILE"
    [ -n "$profile" ] || return
    printf "$COLOR_AWS $profile $RESET"
  }
  __k8s_display() {
    local context="$(kubectl config current-context 2> /dev/null)"
    [ -n "$context" ] || return
    printf "$COLOR_K8S $context $RESET"
  }
  __path_display() {
    local path="${1-$(__workdir)}"
    printf "$COLOR_DIR$path $RESET"
  }
  __jobs_display() {
    [ $(jobs | wc -l) -ne "0" ] && printf "$COLOR_JOBS \\j $RESET"
  }
  __symbol_display() {
    local symbol_bg=$COLOR_SYMBOL_USER
    [ $EUID -eq 0 ] && symbol_bg=$COLOR_SYMBOL_ROOT
    printf "$symbol_bg${MYPROMPT_SYMBOL}$RESET"
  }
  __rc_display() {
    [ $1 -ne 0 ] && printf "$COLOR_RC $1 $RESET"
  }
  __ps1() {
    # keep this at top!!!
    # capture latest return code
    local return_code=$?
    local job_count="$(jobs | wc -l)"
    local workdir="$(__workdir)"

    # check for supported colors
    __colors
    # set prompt
    PS1="\e]0;$workdir\a\n"
    PS1+="$(__path_display $workdir)"
    PS1+="$(__k8s_display)"
    PS1+="$(__aws_display)"
    PS1+="$(__git_display)"
    PS1+="\n"
    if [[ ${RETURN_CODE} -eq 0 && ${JOB_COUNT} -eq 0 ]]; then
      PS1+="$(__symbol_display) "
    else
      PS1+="$(__rc_display ${RETURN_CODE})"
      PS1+="$(__jobs_display)"
      PS1+=" $(__symbol_display) "
    fi
  }

  PROMPT_COMMAND="__ps1 on"
}

# save system PS1
#[[ -z "$MYPROMPT_SYSTEM_PS1" ]] && MYPROMPT_SYSTEM_PS1=$PS1

__myprompt
unset __myprompt
