#!/usr/bin/env bash

case "$TERM" in
xterm*|rxvt*)
  update_title()
  {
      case "$BASH_COMMAND" in
          *\033]0*)
              ;;
          *)
              echo -ne "\033]0;${BASH_COMMAND}\007"
              ;;
      esac
  }
  trap update_title DEBUG
  ;;
*)
  ;;
esac
