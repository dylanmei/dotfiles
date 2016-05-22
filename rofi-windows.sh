#!/bin/sh

###############################################################
# original script by cornerman (https://github.com/cornerman) #
###############################################################

function gen_entries()
{
    for a in $(seq 0 $(( ${#TITLES[@]} -1 )))
    do
        echo ${TITLES[a]}
    done
}

function get_icon()
{
  local program="$1"
  case $program in
    urxvt)
      echo -n "" ;;
    slack)
      echo -n "" ;;
    firefox)
      echo -n "" ;;
    dropbox)
      echo -n "" ;;
    zoom)
      echo -n "" ;;
    *)
      echo -n "" ;;
  esac
}

declare -i index=0
while read -r window; do
    pid=$(echo "$window" | awk '{print $3}')
    program=$(ps -p "$pid" -o comm=)
    icon=$(get_icon $program)

    IDS[$index]=$(echo "$window" | awk '{print $1}')
    TITLES[$index]="$icon $program: $(echo "$window" | awk '{for (i=5; i<=NF; i++) print $i}')"
    index+=1
done <<< "$(wmctrl -l -p)"

gen_entries
selections=$( gen_entries | rofi -dmenu -p " →  " -format i )
[ "$selections" = "" ] && exit

while read -r selection; do
    if [ "$selection" != -1 ]; then
        window_id=$(printf "%d" "${IDS[selection]}")
        i3-msg "[ id = $window_id ] focus" > /dev/null
    fi
done <<< "$selections"
