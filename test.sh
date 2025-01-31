#!/bin/bash

os_int=$1
rebuild=$2
LOGPREFIX="${CYAN}Testing "

if [ -z "$rebuild" ]
then
    rebuild=true
fi

# shellcheck source=./etc/shell/common.sh
source "etc/shell/common.sh"

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
    1) run_test_container alpine "$rebuild" ;;
    2) run_test_container debian "$rebuild" ;;
    3) run_test_container arch "$rebuild" ;;
    4) run_test_container openwrt "$rebuild" ;;
    5) run_test_container slackware "$rebuild" ;;
    *) run_test_container alpine "$rebuild" ;;
esac
