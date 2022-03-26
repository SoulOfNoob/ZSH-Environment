RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

INSTALL_ENV='linux'

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
mkdir -p ~/.ssh
cp ./ssh/config ~/.ssh/

printf "${YELLOW}Generating EdDSA key${NC}\n"
ssh-keygen -t ed25519 -f ~/.ssh/id_eddsa_private
printf "${YELLOW}Generating RSA key${NC}\n"
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_private

# Install Oh-My-ZSH
printf "${YELLOW}Install oh-my-zsh${NC}\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install autocomplete
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install p10k
printf "${YELLOW}Install p10k${NC}\n"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Download fonts
# wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
# wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
# wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
# wget https://github.com/rossh-keygenmkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

# realpath "$0" | sed 's|\(.*\)/.*|\1|'

# Copy rc files
printf "${YELLOW}Copying rc files${NC}\n"
cp ./rc_files/$INSTALL_ENV/.zshrc ~/
cp ./rc_files/$INSTALL_ENV/.p10k.zsh ~/
# cp ./rc_files/$INSTALL_ENV/.nanorc ~/

# Copy custom scripts
printf "${YELLOW}Copy Custom Scripts${NC}\n"
cp ./custom/* ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/

# Make ZSH default
printf "${YELLOW}Make ZSH default shell${NC}\n"
chsh -s $(which zsh)

# Restart ZSH
printf "${YELLOW}Restart ZSH${NC}\n"
exec zsh