#!/bin/bash

#- ***********************************
#- *     deploy_dell_osma v1.0       *
#- * Copyright (C) 2014 John Petrini *
#- ***********************************

## *****************************************************************
## * Usage: ./deploy_dell_osma.sh [scripttodeploy.sh] [serverlist] *
## *                                                               *
## *      -h     Show help options.                                *
## *      -v     Print version info.                               *
## *                                                               *
## *       SERVER LIST MUST CONTAIN FQDN's - ONE PER LINE          *
## *****************************************************************
help=$(grep "^## " "${BASH_SOURCE[0]}" | cut -c 4-)
version=$(grep "^#- "  "${BASH_SOURCE[0]}" | cut -c 4-)
 
opt_h() {
  echo "$help"
}
 
opt_v() {
  echo "$version"
}
 
while getopts "hv" opt; do
  eval "opt_$opt"
exit 0
done

FILE=$1
TARGET_PATH="/home/voiceaxis"
MACHINES="$(<$2)"
BASE=$(basename "$FILE")
for current_machine in $MACHINES; do 
   scp -i ~/.ssh/id_dsa_va -o "StrictHostKeyChecking no" "$FILE" voiceaxis@$current_machine:$TARGET_PATH 
   ssh -t -i ~/.ssh/id_dsa_va -o "StrictHostKeyChecking no" voiceaxis@$current_machine "./$BASE && rm ./$BASE && exit"
done