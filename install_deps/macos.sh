#!/bin/sh

# Install brew .etc

# install git
xcode-select --install

# Install Brew
export HOMEBREW_BREW_GIT_REMOTE="..."  # put your Git mirror of Homebrew/brew here
export HOMEBREW_CORE_GIT_REMOTE="..."  # put your Git mirror of Homebrew/homebrew-core here
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install zsh
brew install zsh

brew install nano
echo 'include "/usr/local/Cellar/nano/*/share/nano/*.nanorc"' >> ~/.nanorc
