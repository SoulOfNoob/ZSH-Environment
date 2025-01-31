#!/bin/bash

os_int=$1
rebuild=$2

if [ -z "$rebuild" ]
then
    rebuild=true
fi

source "etc/shell/vars.sh"

function rebuild_container() {
    docker stop "$1" 2>/dev/null
    docker rm "$1" 2>/dev/null
    if [ "$rebuild" = true ]
    then
        docker build -t "$1":latest -f Dockerfile.slackware .
    fi
    docker run --name "$1" -it "$1"
}

if [ -z "$os_int" ]
then
    echo -e "${HORIZONTAL_LINE}\c"
    echo -e "        Please Select Operating System to test\c"
    echo -e "${HORIZONTAL_LINE}\c"
    echo -e "1) Alpine"
    echo -e "2) Debian"
    echo -e "3) Arch"
    echo -e "4) OpenWRT"
    echo -e "5) Slackware\c"
    echo -e "${HORIZONTAL_LINE}\c"
    read -r os_int
fi

case $os_int in
    1) rebuild_container alpine_testing ;;
    2) rebuild_container debian_testing ;;
    3) rebuild_container arch_testing ;;
    4) rebuild_container openwrt_testing ;;
    5) rebuild_container slackware_testing ;;
    *) rebuild_container alpine_testing ;;
esac
