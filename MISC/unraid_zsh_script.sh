#!/bin/bash

# this should live in /boot/config/plugins/user.scripts/scripts/zsh/script

function unraid_info () {
    /usr/local/emhttp/webGui/scripts/notify -s "$@" -e "ZSH Auto Setup" -i "normal" 2>/dev/null
    echo "Info: $*"
}

function unraid_warning () {
    /usr/local/emhttp/webGui/scripts/notify -s "$@" -e "ZSH Auto Setup" -i "warning" 2>/dev/null
    echo "Warning: $*"
}

function unraid_error () {
    /usr/local/emhttp/webGui/scripts/notify -s "$@" -e "ZSH Auto Setup" -i "alert" 2>/dev/null
    echo "Error: $*"
}

unraid_info Checking if Repo exists
if [ ! -f "/boot/config/extra/ZSH-Environment" ]
then
    unraid_info Cloning Repo
    mkdir -p /boot/config/extra && git clone https://github.com/SoulOfNoob/ZSH-Environment.git /boot/config/extra/ZSH-Environment || unraid_error "Failed to clone repository" && exit 1
fi

cd /boot/config/extra/ZSH-Environment || unraid_error "Failed to change directory" && exit 1

unraid_info Starting Setup
make install || unraid_error "Failed to install ZSH Environment" && exit 1
unraid_info Finished Setup
