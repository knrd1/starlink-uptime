#!/bin/bash
# Requires starlink-grpc-tools installed: https://github.com/sparky8512/starlink-grpc-tools

# Path to your starlink grpc tool here:

gr=/home/konrad/starlink-grpc-tools/dish_grpc_text.py

function displaytime {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  (( $D > 0 )) && printf '%d days ' $D
  (( $H > 0 )) && printf '%d hours ' $H
  (( $M > 0 )) && printf '%d minutes ' $M
  (( $D > 0 || $H > 0 || $M > 0 )) && printf 'and '
  printf '%d seconds\n' $S
}

secs=$(python $gr status -v|grep uptime|awk '{print $2}')
displaytime $secs
