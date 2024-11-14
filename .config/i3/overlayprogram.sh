#!/bin/bash

search=$1
command=$2


running=`pgrep $1`

echo $2
echo "pgrep "$1""
echo $running

if ! [[ $running ]]; then
    $2
fi
