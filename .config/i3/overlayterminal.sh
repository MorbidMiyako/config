#!/bin/bash

name=$1
command=$2


running=`pgrep -fa i3-scratchpad-$1`

echo $1
echo $2
echo $3
echo "pgrep -fa "$1""
echo $running

if ! [[ $running ]]; then
    #xterm -title "i3-scratchpad-$1" -fa Dejavu -fs $3 -fc Monospace -e $2
    kitty --title "i3-scratchpad-$1" 
fi
