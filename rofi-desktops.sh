#!/bin/sh
 
desktop=""
action=${1-new}

if [[ "$action" == "rename" ]]; then
  desktop=$(echo '' | rofi -dmenu -p "rename desktop:" -lines 1)
  [[ -z $desktop ]] && exit 0

  bspc desktop -n "$desktop"
else
  desktop=$(bspc query -D | rofi -dmenu -p "desktop:")
  [[ -z $desktop ]] && exit 0

  for existing_desktop in $(bspc query -D); do
    if [ "$desktop" == "$existing_desktop" ]; then
      bspc desktop "$desktop" -m $(bspc query -M -m focused)
      bspc desktop -f "$desktop"
      exit 0
    fi
  done

  bspc monitor -a "$desktop"
  bspc desktop -f "$desktop"
fi

