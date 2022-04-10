#!/bin/sh

# Install brew .etc

# install git
xcode-select --install

# Install Brew
#export HOMEBREW_BREW_GIT_REMOTE="..."  # put your Git mirror of Homebrew/brew here
#export HOMEBREW_CORE_GIT_REMOTE="..."  # put your Git mirror of Homebrew/homebrew-core here
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/verdi/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install zsh
brew install wget zsh pyenv nvm nano openssl wget yarn dnsmasq azure-cli kubernetes-cli 
echo 'include "/usr/local/Cellar/nano/*/share/nano/*.nanorc"' >> ~/.nanorc

git clone https://github.com/momo-lab/pyenv-install-latest.git "$(pyenv root)"/plugins/pyenv-install-latest
pyenv install-latest

nvm install --lts

brew install --cask openscad