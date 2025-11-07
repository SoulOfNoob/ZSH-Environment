#!/bin/bash

# Install brew .etc

SECTION_PREFIX="${RED} Mac install"

# install git
printf "${LOGPREFIX}|${SECTION_PREFIX}| ${INFO} ${YELLOW}Install GIT '${OS_RELEASE}' ${NC}${NL}"
xcode-select --install

# Install Brew
printf "${LOGPREFIX}|${SECTION_PREFIX}| ${INFO} ${YELLOW}Install Brew '${OS_RELEASE}' ${NC}${NL}"
#export HOMEBREW_BREW_GIT_REMOTE="..."  # put your Git mirror of Homebrew/brew here
#export HOMEBREW_CORE_GIT_REMOTE="..."  # put your Git mirror of Homebrew/homebrew-core here
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install zsh and other dependencies
printf "${LOGPREFIX}|${SECTION_PREFIX}| ${INFO} ${YELLOW}Install Brew basic packages '${OS_RELEASE}' ${NC}${NL}"
brew install wget zsh nano git bat fzf tmux tree openssl pyenv nvm yarn ffmpeg

# Install important software
printf "${LOGPREFIX}|${SECTION_PREFIX}| ${INFO} ${YELLOW}Install important 3rd party software '${OS_RELEASE}' ${NC}${NL}"
brew install --cask iterm2 sublime-text firefox vlc tunnelblick visual-studio-code 1password postman inkscape openscad signal wailbrew

if [ "${OPTIONAL}" == "yes" ]
then
    # Install optional software
    printf "${LOGPREFIX}|${SECTION_PREFIX}| ${INFO} ${YELLOW}Install optional 3rd party software '${OS_RELEASE}' ${NC}${NL}"
    brew install --cask  rambox steam daisydisk
fi

printf "${LOGPREFIX}|${SECTION_PREFIX}| ${INFO} ${YELLOW}Config stuff '${OS_RELEASE}' ${NC}${NL}"

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

# Set default merge behaviour
git config pull.rebase false

if [ "${ENV}" == "work" ]
then
    git config --global user.email "jry@facelift-bbt.com"
    git config --global user.name "Jan Ryklikas"
    # Install work related software
    printf "${LOGPREFIX}|${SECTION_PREFIX}| ${INFO} ${YELLOW}Install work related software '${OS_RELEASE}' ${NC}${NL}"
    brew install dnsmasq azure-cli kubernetes-cli 
    brew install --cask microsoft-teams lens
else
    git config --global user.email "jan_ryklikas@ymail.com"
    git config --global user.name "Jan Ryklikas"
fi

printf "${LOGPREFIX}|${SECTION_PREFIX}| ${INFO} ${YELLOW}Install python and nvm '${OS_RELEASE}' ${NC}${NL}"

mkdir $HOME/.nvm

git clone https://github.com/momo-lab/pyenv-install-latest.git "$(pyenv root)"/plugins/pyenv-install-latest
# pyenv install-latest
pyenv install 3.10.6
pyenv global 3.10.6

nvm install --lts

printf "${LOGPREFIX}|${SECTION_PREFIX}| ${INFO} ${YELLOW}Install Betaflight configurator '${OS_RELEASE}' ${NC}${NL}"
# Install Betaflight configurator
brew install --cask betaflight-configurator
sudo xattr -rd com.apple.quarantine /Applications/Betaflight\ Configurator.app
