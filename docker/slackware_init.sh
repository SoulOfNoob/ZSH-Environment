#!/bin/bash

yes | slackpkg update gpg
yes | slackpkg update
yes | slackpkg install zsh nghttp2 brotli cyrus-sasl curl wget git ca-certificates glibc openssh openssl openssh-client openssh-keygen
update-ca-certificates
git config --global http.sslCAinfo /etc/ssl/certs/ca-certificates.crt
export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
export LANG=de_DE.UTF-8
export LC_ALL=de_DE.UTF-8
export LANGUAGE=de_DE.UTF-8
export KEYMAP="de"
