#!/bin/bash
# shellcheck disable=SC2034 

SECTION_PREFIX="${RED} Wizard "

OS=""
ENV=""
SSH=""
PERSONAL="true"

if [ "${UNAME}" == "Darwins" ]
then
    OS="macos"

    echo -e "${HORIZONTAL_LINE}\c"
    echo -e "             Install additional software?\c"
    echo -e "${HORIZONTAL_LINE}\c"
    echo -e "y) Yes$"
    echo -e "n) No"
    echo -e "${HORIZONTAL_LINE}"
    read -r optional_sw

    OPTIONAL="yes"
    [ "$optional_sw" == "n" ] && OPTIONAL="no"

else
    if [[ "$OS_RELEASE" == *"debian"* ]]
    then
        OS="linux"
        DISTRO="debian"
    elif [[ "$OS_RELEASE" == *"alpine"* ]]
    then
        OS="linux"
        DISTRO="alpine"
    elif [[ "$OS_RELEASE" == *"arch"* ]]
    then
        OS="linux"
        DISTRO="arch"
    elif [[ "$OS_RELEASE" == *"OpenWrt"* ]]
    then
        OS="linux"
        DISTRO="openwrt"
    elif [[ "$OS_RELEASE" == *"slackware"* ]]
    then
        OS="linux"
        DISTRO="slackware"
        ENV="remote"
        SSH="no"
        PERSONAL="true"
        HOME="/root"
    fi
fi


if [ -z "$OS" ]
then
    echo -e "${LOGPREFIX}|${SECTION_PREFIX}| ${INFO} ${YELLOW}Autodetect OS failed for '${OS_RELEASE}' ${NC}"

    echo -e "${HORIZONTAL_LINE}\c"
    echo -e "             Please Select Operating System\c"
    echo -e "${HORIZONTAL_LINE}\c"
    echo -e "0) MacOS"
    echo -e "1) Alpine"
    echo -e "2) Debian"
    echo -e "3) Arch"
    echo -e "4) OpenWRT\c"
    echo -e "5) Slackware (UnRAID)\c"
    echo -e "${HORIZONTAL_LINE}"
    read -r os_int

    case $os_int in
        "0") OS="macos" ;;
        "1") OS="linux"; DISTRO="alpine" ;;
        "2") OS="linux"; DISTRO="debian" ;;
        "3") OS="linux"; DISTRO="arch" ;;
        "4") OS="linux"; DISTRO="openwrt" ;;
        "5") OS="linux"; DISTRO="slackware" ;;
        *) echo -e "${LOGPREFIX}|${SECTION_PREFIX}| ${ERROR} ${YELLOW}Not a valid OS "; exit ;;
    esac
fi

if [ -z "$ENV" ]
then
    echo -e "${HORIZONTAL_LINE}\c"
    echo -e "                Remote or local machine?\c"
    echo -e "${HORIZONTAL_LINE}\c"
    echo -e "1) Remote/Headless (Personal)"
    echo -e "2) Local (Personal)"
    echo -e "3) Work (Personal)"
    echo -e "4) Remote/Headless (Shared)\c"
    echo -e "${HORIZONTAL_LINE}"
    read -r env_int

    case $env_int in
        "1") ENV="remote" ;;
        "2") ENV="local" ;;
        "3") ENV="work" ;;
        "4") ENV="remote"; PERSONAL="false" ;;
        *) ENV="remote" ;;
    esac
fi

if [ -z "$SSH" ]
then
    echo -e "${HORIZONTAL_LINE}\c"
    echo -e "                         Setup SSH?\c"
    echo -e "${HORIZONTAL_LINE}\c"
    echo -e "y) Yes"
    echo -e "n) No\c"
    echo -e "${HORIZONTAL_LINE}"
    read -r ssh_int

    case $ssh_int in
        "y") SSH="yes" ;;
        "n" | *) SSH="no" ;;
    esac
fi
