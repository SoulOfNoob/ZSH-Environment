#!/bin/bash

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

printf "${ASCII_WELCOME}"

source "etc/shell/wizard.sh"

echo
echo "Answers:"
echo "OS: $OS"
echo "DISTRO: $DISTRO"
echo "ENV: $ENV"
echo "SSH: $SSH"

if [ "${OS}" == "linux" ]
then
    source "etc/dependencies/${DISTRO}.sh"
else
    source "etc/dependencies/${OS}.sh"
fi

if [ "${ENV}" == "remote" ]
then
    sudo mv /etc/ssh_banner /etc/ssh_banner.bak
    sudo cp $SCRIPT_DIR/config/remote/ssh_banner /etc/ssh_banner
    sudo sed -i 's/#Banner none/Banner \/etc\/ssh_banner/' /etc/ssh/sshd_config
fi

if [ "${SSH}" == "yes" ]
then
    source $SCRIPT_DIR/etc/shell/ssh_setup.sh
fi

source $SCRIPT_DIR/etc/shell/install_zsh.sh

# realpath "$0" | sed 's|\(.*\)/.*|\1|'

SECTION_PREFIX="${RED} Copy Files"

# ToDo: check for file existence and overwrite target

# Create GitHub dir
printf "${LOGPREFIX}|${SECTION_PREFIX}|${YELLOW} create GitHub dir ${OK}${NL}"
cp $SCRIPT_DIR/config/all/GitHub $HOME/
cp $SCRIPT_DIR/config/$ENV/GitHub $HOME/

# Copy ZSH config
printf "${LOGPREFIX}|${SECTION_PREFIX}|${YELLOW} ZSH config ${OK}${NL}"
cp $SCRIPT_DIR/config/all/.zshrc $HOME/
cp $SCRIPT_DIR/config/$ENV/.zshrc $HOME/

# Copy rc files
printf "${LOGPREFIX}|${SECTION_PREFIX}|${YELLOW} p10k config ${OK}${NL}"
cp $SCRIPT_DIR/config/all/.p10k.zsh $HOME/
cp $SCRIPT_DIR/config/$ENV/.p10k.zsh $HOME/

# Copy custom scripts
printf "${LOGPREFIX}|${SECTION_PREFIX}|${YELLOW} Custom Scripts ${OK}${NL}"
cp $SCRIPT_DIR/config/all/.oh-my-zsh/custom_scripts/* ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/
cp $SCRIPT_DIR/config/$ENV/.oh-my-zsh/custom_scripts/* ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/

SECTION_PREFIX="${RED} Finishing "

# Make ZSH default
printf "${LOGPREFIX}|${SECTION_PREFIX}|${YELLOW} Make ZSH default shell ${OK}${NL}"
chsh -s $(which zsh)

# Restart ZSH
printf "${LOGPREFIX}|${SECTION_PREFIX}|${YELLOW} Restart ZSH ${OK}${NL}"
exec zsh