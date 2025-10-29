#!/bin/bash
# shellcheck disable=SC2034 

PROJECT_NAME='ZSH auto setup'

UNAME="$(eval uname)"
UNAME_ARCH="$(eval uname -m)"
OS_RELEASE="$(eval cat /etc/*-release 2>/dev/null)" || OS_RELEASE="unknown"

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

NC='\033[0m'
NL='\n'
UNDERLINE='\033[4m\033[1m'

OK=$GREEN"[OK]"$NC
ERROR=$RED"[ERROR]"$NC
INFO=$GREEN"[INFO]"$NC
WARNING=$ORANGE"[WARNING]"$NC

LOGPREFIX="${CYAN}${PROJECT_NAME} "

HORIZONTAL_LINE='
=======================================================
'
SEP="$NC|"

ASCII_WELCOME="$MAGENTA"'
 _       __     __                                     
| |     / /__  / /________  ____ ___  ___              
| | /| / / _ \/ / ___/ __ \/ __ `__ \/ _ \             
| |/ |/ /  __/ / /__/ /_/ / / / / / /  __/             
|__/|__/\___/_/\___/\____/_/ /_/_/_/\___/          __  
  / ___/____  __  __/ / __ \/ __/ | / /___  ____  / /_ 
  \__ \/ __ \/ / / / / / / / /_/  |/ / __ \/ __ \/ __ \
 ___/ / /_/ / /_/ / / /_/ / __/ /|  / /_/ / /_/ / /_/ /
/____/\____/\__,_/_/\____/_/ /_/ |_/\____/\____/_.___/ 
                                                       
'"$NC"

function color_echo() {
  echo -e "${LOGPREFIX}${SEP}${SECTION_PREFIX}${SEP}${YELLOW} $* ${OK}"
}

function evaluate {
  OUTPUT=$("$@" 2>&1)
  if [ $? -eq 0 ]; then
    echo -e "$NC|$GREEN OK"
    echo -e "$OUTPUT"
  else
    echo -e "$NC|$RED ERROR"
    echo -e "$RED""$OUTPUT""$NC"
  fi
}

function run_test_container() {
  name=$1
  rebuild=$2
  SECTION_PREFIX="$RED $name-testing "
  color_echo "Stopping container"
  docker stop "$name-testing" >/dev/null 2>&1
  docker rm "$name-testing" >/dev/null 2>&1
  color_echo "Starting container"
  if [ "$rebuild" = true ]
  then
    color_echo "Building container"
      docker build -t "$name-testing":latest -f "Dockerfile.$name" .
  fi
  docker run \
    --volume ./etc:/root/etc:ro  \
    --volume ./config:/root/config:ro  \
    --volume ./install.sh:/root/install.sh:ro  \
    --name "$name-testing"  \
    -it "$name-testing"
  color_echo "Removing container"
  docker stop "$name-testing" >/dev/null 2>&1
  docker rm "$name-testing" >/dev/null 2>&1
  color_echo "Removed container"
}

