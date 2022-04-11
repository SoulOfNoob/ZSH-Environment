RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

INSTALL_ENV='remote'

# requirements
# 	git
# 	zsh
# 	curl
# 	wget
# 	openssh-client
# 	openssh-keygen
# ---

# Init SSH
printf "${YELLOW}Setup SSH folder and config${NC}\n"
mkdir -p $HOME/.ssh
cp ./platform_specific/default/ssh_config $HOME/.ssh/config
cp ./platform_specific/$INSTALL_ENV/ssh_config $HOME/.ssh/config

printf "${YELLOW}Generating EdDSA key${NC}\n"
ssh-keygen -t ed25519 -f $HOME/.ssh/id_eddsa_private
printf "${YELLOW}Generating RSA key${NC}\n"
ssh-keygen -t rsa -b 4096 -f $HOME/.ssh/id_rsa_private

# Copy ZSH config
cp ./platform_specific/$INSTALL_ENV/.zshrc $HOME/

# Install Oh-My-ZSH
printf "${YELLOW}Install oh-my-zsh${NC}\n"
ZSH=$HOME/.oh-my-zsh sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install autocomplete
printf "${YELLOW}Install autocomplete${NC}\n"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install autosuggestions
printf "${YELLOW}Install autosuggestions${NC}\n"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install p10k
printf "${YELLOW}Install p10k${NC}\n"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Download fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ./fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P ./fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P ./fonts

# realpath "$0" | sed 's|\(.*\)/.*|\1|'

# Copy rc files
printf "${YELLOW}Copying default files${NC}\n"
cp ./platform_specific/default/.zshrc $HOME/
cp ./platform_specific/default/.p10k.zsh $HOME/

printf "${YELLOW}Copying override files${NC}\n"
cp ./platform_specific/$INSTALL_ENV/.p10k.zsh $HOME/

# Copy custom scripts
printf "${YELLOW}Copy Custom Scripts${NC}\n"
cp ./custom_scripts/* ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/

# Make ZSH default
printf "${YELLOW}Make ZSH default shell${NC}\n"
chsh -s $(which zsh)

# Restart ZSH
printf "${YELLOW}Restart ZSH${NC}\n"
exec zsh