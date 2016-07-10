#!/bin/sh

res=$(echo -e "bspc quit\nreboot\nshutdown\nsuspend\nhibernate" | rofi -dmenu -p "quit: " -l 5)
if [ $? -eq 0 ]; then
  case "$res" in
    "bspc quit")
      #i3-msg exit ;;
      pkill -x panel
      bspc quit
      ;;
    "shutdown")
      systemctl "poweroff" ;;
    *)
      systemctl "$res" ;;
  esac
fi
