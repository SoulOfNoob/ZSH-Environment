#!/bin/bash

# shellcheck disable=SC2034 

# requirements
# 	git
# 	zsh
# 	curl
# 	wget
# 	openssh-client
# 	openssh-keygen
# ---

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
OS='linux'      # linux/mac
DISTRO='debian' # debian/arch/alpine
ARCH='arm'      # arm64/arm32/amd64/aarch64
ENV='remote'    # remote/local
OPTIONAL='no'   # optional software

source "etc/shell/vars.sh"

echo -e "${ASCII_WELCOME}"

source "etc/shell/wizard.sh"

echo
echo "Answers:"
echo "OS: $OS"
echo "DISTRO: $DISTRO"
echo "ENV: $ENV"
echo "SSH: $SSH"

SECTION_PREFIX="${RED} Dependency Setup"
echo -e "${LOGPREFIX}${SEP}${SECTION_PREFIX}${SEP}${YELLOW} Installing Dependencies ${OK}"

if [ "${OS}" == "linux" ]
then
    # shellcheck source=./etc/dependencies/alpine.sh
    source "etc/dependencies/${DISTRO}.sh"
else
    # shellcheck source=./etc/dependencies/macos.sh
    source "etc/dependencies/${OS}.sh"
fi

SECTION_PREFIX="${RED} SSH Setup "
echo -e "${LOGPREFIX}${SEP}${SECTION_PREFIX}${SEP}${YELLOW} SSH Banner Setup ${OK}"

if [ "${ENV}" == "remote" ]
then
    mv "$HOME/ssh_banner" "$HOME/ssh_banner.bak" 2>/dev/null || echo -e "${LOGPREFIX}${SEP}${SECTION_PREFIX}${SEP}${YELLOW} No existing banner file found ${OK}"
    cp "$SCRIPT_DIR/config/remote/ssh_banner" "$HOME/ssh_banner"
    sed -i 's/#Banner none/Banner \/etc\/ssh_banner/' /etc/ssh/sshd_config || sudo !!
    
    if [ "${DISTRO}" == "debian" ]
    then
        sudo systemctl restart sshd
    fi
fi

if [ "${SSH}" == "yes" ]
then
    # shellcheck source=./etc/shell/ssh_setup.sh
    source "$SCRIPT_DIR/etc/shell/ssh_setup.sh"
else
    mkdir -p ~/.ssh
fi

# shellcheck source=./etc/shell/install_zsh.sh
source "$SCRIPT_DIR/etc/shell/install_zsh.sh"

# realpath "$0" | sed 's|\(.*\)/.*|\1|'

SECTION_PREFIX="${RED} Copy Files "

# ToDo: check for file existence and overwrite target

# Create GitHub dir
# echo -e "${LOGPREFIX}${SEP}${SECTION_PREFIX}${SEP}${YELLOW} create GitHub dir ${OK}"
# cp $SCRIPT_DIR/config/all/GitHub $HOME/
# cp $SCRIPT_DIR/config/$ENV/GitHub $HOME/

# Copy ZSH config
echo -e "${LOGPREFIX}${SEP}${SECTION_PREFIX}${SEP}${YELLOW} ZSH config ${OK}"
cp "$SCRIPT_DIR/config/all/.zshrc" "$HOME/"
cp "$SCRIPT_DIR/config/$ENV/.zshrc" "$HOME/" 2>/dev/null

# Copy rc files
echo -e "${LOGPREFIX}${SEP}${SECTION_PREFIX}${SEP}${YELLOW} p10k config ${OK}"
cp "$SCRIPT_DIR/config/all/.p10k.zsh" "$HOME/"
cp "$SCRIPT_DIR/config/$ENV/.p10k.zsh" "$HOME/"

# Copy custom scripts
echo -e "${LOGPREFIX}${SEP}${SECTION_PREFIX}${SEP}${YELLOW} Custom Scripts ${OK}"
cp "$SCRIPT_DIR"/config/all/.oh-my-zsh/custom_scripts/* "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/"
cp "$SCRIPT_DIR"/config/$ENV/.oh-my-zsh/custom_scripts/* "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/" 2>/dev/null

SECTION_PREFIX="${RED} Finishing "

# Make ZSH default
echo -e "${LOGPREFIX}${SEP}${SECTION_PREFIX}${SEP}${YELLOW} Make ZSH default shell ${OK}"
chsh -s "$(which zsh)"

# Restart ZSH
echo -e "${LOGPREFIX}${SEP}${SECTION_PREFIX}${SEP}${YELLOW} Restart ZSH ${OK}"
exec zsh