#!/bin/bash

# yes | slackpkg update gpg
# yes | slackpkg update
# yes | slackpkg install zsh nghttp2 brotli cyrus-sasl curl wget git ca-certificates glibc openssh openssl openssh-client openssh-keygen
# update-ca-certificates
git config --global http.sslCAinfo /etc/ssl/certs/ca-certificates.crt
export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
export LANG=en_US.utf8
export LC_ALL=en_US.utf8
export LANGUAGE=en_US.utf8
export KEYMAP="de"
# echo 'export LANG=de_DE.UTF-8' >>! ~/.zshenv

for cmd in zsh curl wget git openssl; do
    which $cmd >/dev/null 2>&1 || { echo -e "${LOGPREFIX}${SEP}${SECTION_PREFIX}${SEP}${YELLOW} $cmd not installed ${ERROR}"; exit 1; }
done
