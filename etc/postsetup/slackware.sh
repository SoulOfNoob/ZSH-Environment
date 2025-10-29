#!/bin/bash

# UnRAID Specific scripts

color_echo "Setting up UnRAID Stuff"

sed -i "s/# typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='⭐'/typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='UnRAID'/" /root/.p10k.zsh

# check if ` /root/GitHub/ZSH-Environment/MISC/unraid_zsh_script.sh` exists
if [ -f "./MISC/unraid_zsh_script.sh" ]
then
    # shellcheck disable=2216
    yes | cp -rf ./MISC/unraid_zsh_script.sh /boot/config/plugins/user.scripts/scripts/zsh/script
fi

# Make sure the necessary directories are existing
mkdir -p /root/.cache/zsh/
mkdir -p /boot/config/extra/

# Make sure history file exists
touch /boot/config/extra/.zsh_history

# Symlink .zshrc and history files
cp -sf /boot/config/extra/.zsh_history /root/.zsh_history

/usr/local/emhttp/webGui/scripts/notify -s "Finished Setup" -e "ZSH Auto Setup" -i "normal"
echo "Info: Finished Setup"
