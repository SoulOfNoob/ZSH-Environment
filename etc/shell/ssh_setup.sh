SECTION_PREFIX="${RED} SSH Config "

# Init SSH
printf "${LOGPREFIX}|${SECTION_PREFIX}|${YELLOW} Setup SSH folder and config ${OK}\n"
mkdir -p $HOME/.ssh
cp ./config/all/.ssh/* $HOME/.ssh/
cp ./config/$ENV/.ssh/* $HOME/.ssh/

printf "${LOGPREFIX}|${SECTION_PREFIX}|${YELLOW} Generating EdDSA key ${OK}\n"
ssh-keygen -t ed25519 -f $HOME/.ssh/id_eddsa_private
printf "${LOGPREFIX}|${SECTION_PREFIX}|${YELLOW} Generating RSA key ${OK}\n"
ssh-keygen -t rsa -b 4096 -f $HOME/.ssh/id_rsa_private
