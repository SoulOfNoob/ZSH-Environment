#!/bin/sh

# Install brew .etc

# install git
xcode-select --install

# Install Brew
#export HOMEBREW_BREW_GIT_REMOTE="..."  # put your Git mirror of Homebrew/brew here
#export HOMEBREW_CORE_GIT_REMOTE="..."  # put your Git mirror of Homebrew/homebrew-core here
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install zsh
brew install wget zsh pyenv nvm nano openssl wget yarn dnsmasq azure-cli kubernetes-cli 

if [ "${UNAME}" == "Darwin" ]
then
    if [ "${UNAME_ARCH}" == "arm64" ]
    then 
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
        echo 'include "/opt/homebrew/Cellar/nano/*/share/nano/*.nanorc"' >> $HOME/.nanorc
    else
        echo 'eval "$(/usr/local/bin/brew shellenv)"' >> $HOME/.zprofile
        echo 'include "/usr/local/Cellar/nano/*/share/nano/*.nanorc"' >> $HOME/.nanorc
    fi
else
    printf "${LOGPREFIX}|${SECTION_PREFIX}| ${ERROR} ${YELLOW}MacOS Version '${UNAME}' not supported ${NL}"
    exit
fi

mkdir $HOME/.nvm

git clone https://github.com/momo-lab/pyenv-install-latest.git "$(pyenv root)"/plugins/pyenv-install-latest
# pyenv install-latest
pyenv install 3.10.6
pyenv global 3.10.6

nvm install --lts

brew install --cask openscad