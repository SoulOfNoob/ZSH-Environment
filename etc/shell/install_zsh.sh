#!/bin/bash

SECTION_PREFIX="${RED} Configure ZSH "

command -v zsh >/dev/null 2>&1 || { echo -e "${LOGPREFIX}${SEP}${SECTION_PREFIX}${SEP}${YELLOW} ZSH not installed ${ERROR}"; exit 1; }

# Download fonts
echo -e "${LOGPREFIX}${SEP}${SECTION_PREFIX}${SEP}${YELLOW} Download Fonts ${OK}"
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ./etc/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P ./etc/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P ./etc/fonts

# Install Oh-My-ZSH
echo -e "${LOGPREFIX}${SEP}${SECTION_PREFIX}${SEP}${YELLOW} Install oh-my-zsh ${OK}"
ZSH=$HOME/.oh-my-zsh sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install autocomplete
echo -e "${LOGPREFIX}${SEP}${SECTION_PREFIX}${SEP}${YELLOW} Install autocomplete ${OK}"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# Install autosuggestions
echo -e "${LOGPREFIX}${SEP}${SECTION_PREFIX}${SEP}${YELLOW} Install autosuggestions ${OK}"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# Install p10k
echo -e "${LOGPREFIX}${SEP}${SECTION_PREFIX}${SEP}${YELLOW} Install p10k ${OK}"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
