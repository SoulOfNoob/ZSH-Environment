#!/bin/sh

apk update && \
apk add --no-cache \
git \
wget \
curl \
zsh \
tmux \
tree \
nano \
nano-syntax \
shadow \
sudo \
openssh-client \
openssh-keygen \
openssh-server

echo 'include "/usr/share/nano/*.nanorc"' >> ~/.nanorc