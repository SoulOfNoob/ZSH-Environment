#!/bin/bash

source "etc/shell/vars.sh"

printf "${HORIZONTAL_LINE}"
printf "        Please Select Operating System to test"
printf "${HORIZONTAL_LINE}"
printf "1) Alpine${NL}"
printf "2) Debian${NL}"
printf "3) Arch${NL}"
printf "4) OpenWRT"
printf "${HORIZONTAL_LINE}"
read -r os_int

case $os_int in
    "1")
        docker rm alpine_testing
        docker build -t alpine_testing:latest -f Dockerfile.alpine .
        docker run --name alpine_testing -it alpine_testing
        ;;
    "2")
        docker rm debian_testing
        docker build -t debian_testing:latest -f Dockerfile.debian .
        docker run --name debian_testing -it debian_testing
        ;;
    "3")
        docker rm arch_testing
        docker build -t arch_testing:latest -f Dockerfile.archlinux .
        docker run --name arch_testing -it arch_testing
        ;;
    "4")
        docker rm openwrt_testing
        docker build -t openwrt_testing:latest -f Dockerfile.openwrt .
        docker run --name openwrt_testing -it openwrt_testing
        ;;
    *)
        docker rm alpine_testing
        docker build -t alpine_testing:latest -f Dockerfile.alpine .
        docker run --name alpine_testing -it alpine_testing
        ;;
esac