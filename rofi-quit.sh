#!/bin/sh

res=$(echo -e "quit\nreboot\nshutdown\nsuspend\nhibernate" | rofi -dmenu -p "   " -l 5)
if [ $? -eq 0 ]; then
  case "$res" in
    quit)
      systemctl --user exit ;;
    shutdown)
      systemctl "poweroff" ;;
    *)
      systemctl "$res" ;;
  esac
fi
