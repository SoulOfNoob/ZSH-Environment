#!/bin/sh

# add all opkg repos before update
sed -i".bak" -e "s/#//g" /etc/opkg/distfeeds.conf

opkg update && \
opkg install \
git \
git-http \
ca-bundle \
wget \
curl \
zsh \
tmux \
tree \
nano \
shadow \
sudo \
openssh-client \
openssh-keygen \
openssh-server