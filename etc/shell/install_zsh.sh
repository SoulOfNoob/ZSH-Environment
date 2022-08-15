SECTION_PREFIX="${RED} Configure ZSH "

# Download fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ./etc/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P ./etc/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P ./etc/fonts

# Install Oh-My-ZSH
printf "${LOGPREFIX}|${SECTION_PREFIX}|${YELLOW} Install oh-my-zsh ${OK}\n"
ZSH=$HOME/.oh-my-zsh sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install autocomplete
printf "${LOGPREFIX}|${SECTION_PREFIX}|${YELLOW} Install autocomplete ${OK}\n"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install autosuggestions
printf "${LOGPREFIX}|${SECTION_PREFIX}|${YELLOW} Install autosuggestions ${OK}\n"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install p10k
printf "${LOGPREFIX}|${SECTION_PREFIX}|${YELLOW} Install p10k ${OK}\n"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
