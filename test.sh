#!/bin/sh

OS='linux'      # linux/mac
DISTRO='debian' # debian/arch/alpine
ARCH='arm'      # arm64/arm32/amd64/aarch64
ENV='remote'    # remote/local

source "etc/shell/vars.sh"



printf "${ASCII_WELCOME}"

SECTION_PREFIX="${RED} Wizard "

if [ "${UNAME}" == "Darwins" ]
then

    OS="MacOS"
    ENV="Local"

else

    if [[ "$OS_RELEASE" == *"debian"* ]]
    then
        OS="Debian"
    elif [[ "$OS_RELEASE" == *"alpine"* ]]
    then
        OS="Alpine"
    elif [[ "$OS_RELEASE" == *"arch"* ]]
    then
        OS="Arch"
    else 
        printf "${LOGPREFIX}|${SECTION_PREFIX}| ${INFO} ${YELLOW}Autodetect OS failed ${NL}"

        printf "${HORIZONTAL_LINE}"
        printf "             Please Select Operating System"
        printf "${HORIZONTAL_LINE}"
        printf "1) MacOS${NL}"
        printf "2) Debian${NL}"
        printf "3) Alpine${NL}"
        printf "4) Arch"
        printf "${HORIZONTAL_LINE}"
        read -r os_int

        case $os_int in
                "1")
                    OS="MacOS"
                    ;;
                "2")
                    OS="Debian"
                    ;;
                "3")
                    OS="Alpine"
                    ;;
                "4")
                    OS="Arch"
                    ;;
                *)
                    printf "${LOGPREFIX}|${SECTION_PREFIX}| ${ERROR} ${YELLOW}Not a valid OS ${NL}"
                    exit
                    ;;
        esac
    fi

    printf "${HORIZONTAL_LINE}"
    printf "                Remote or local machine?"
    printf "${HORIZONTAL_LINE}"
    printf "1) Remote${NL}"
    printf "2) Local"
    printf "${HORIZONTAL_LINE}"
    read -r env_int

    case $env_int in
            "1")
                ENV="Remote"
                ;;
            "2")
                ENV="Local"
                ;;
            *)
                ENV="Remote"
                ;;
    esac
fi

printf "${HORIZONTAL_LINE}"
printf "                    Create SSH Keys?"
printf "${HORIZONTAL_LINE}"
printf "y) Yes${NL}"
printf "n) No"
printf "${HORIZONTAL_LINE}"
read -r ssh_int

case $ssh_int in
        "n")
            SSH="No"
            ;;
        "y")
            SSH="Yes"
            ;;
        *)
            SSH="Yes"
            ;;
esac

echo
echo "Answers:"
echo "OS: $OS"
echo "ENV: $ENV"
echo "SSH: $SSH"





printf "${LOGPREFIX} ${RED} Testing |${NC} Lorem Ipsum: ${UNAME}:${UNAME_ARCH} ${OK}"
