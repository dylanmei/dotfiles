#!/bin/sh

res=$(echo -e "exit bspwm\nreboot\nshut down\nsuspend\nhibernate" | rofi -dmenu -p "quit:" -l 5)
if [ $? -eq 0 ]; then
  case "$res" in
    "exit bspwm")
      pkill -x panel
      bspc quit
      ;;
    "shut down")
      systemctl "poweroff" ;;
    *)
      systemctl "$res" ;;
  esac
fi
