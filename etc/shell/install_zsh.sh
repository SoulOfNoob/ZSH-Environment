#!/bin/bash

SECTION_PREFIX="${RED} Configure ZSH "

command -v zsh >/dev/null 2>&1 || { echo -e "${LOGPREFIX}${SEP}${SECTION_PREFIX}${SEP}${YELLOW} ZSH not installed ${ERROR}"; exit 1; }

# Check for file existence and prompt for overwrite
download_font() {
  local url=$1
  local target_dir=$2
  local filename
  filename=$(basename "$url")
  local target_file="$target_dir/$filename"

  if [ -f "$target_file" ]; then
	echo -e "File $target_file already exists."
  else
	wget -q "$url" -P "$target_dir"
  fi
}

# Download fonts
echo -e "${LOGPREFIX}${SEP}${SECTION_PREFIX}${SEP}${YELLOW} Download Fonts ${OK}"
download_font "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf" "./etc/fonts"
download_font "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf" "./etc/fonts"
download_font "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf" "./etc/fonts"

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
