SECTION_PREFIX="${RED} Wizard "

if [ "${UNAME}" == "Darwins" ]
then

    OS="macos"
    ENV="local"

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
    else 
        printf "${LOGPREFIX}|${SECTION_PREFIX}| ${INFO} ${YELLOW}Autodetect OS failed for '${OS_RELEASE}' ${NC}${NL}"

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
                    OS="macos"
                    ;;
                "2")
                    OS="linux"
                    DISTRO="debian"
                    ;;
                "3")
                    OS="linux"
                    DISTRO="alpine"
                    ;;
                "4")
                    OS="linux"
                    DISTRO="arch"
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
    printf "2) Local${NL}"
    printf "3) Work"
    printf "${HORIZONTAL_LINE}"
    read -r env_int

    case $env_int in
            "1")
                ENV="remote"
                ;;
            "2")
                ENV="local"
                ;;
            "3")
                ENV="work"
                ;;
            *)
                ENV="remote"
                ;;
    esac
fi

printf "${HORIZONTAL_LINE}"
printf "                         Setup SSH?"
printf "${HORIZONTAL_LINE}"
printf "y) Yes${NL}"
printf "n) No"
printf "${HORIZONTAL_LINE}"
read -r ssh_int

case $ssh_int in
        "n")
            SSH="no"
            ;;
        "y")
            SSH="yes"
            ;;
        *)
            SSH="yes"
            ;;
esac