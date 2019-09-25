#!/bin/bash

# USAGE:
# ./ubuntu-ssh <user>

# install SSH server
sudo apt install -y openssh-server

# generate public and private key
mkdir -p ~/.ssh
cd ~/.ssh
# default storage location, empty passphrase, empty passphrase
ssh-keygen -t rsa -b 4096 -C "apollo-$1" -f ~/.ssh/id_rsa -q -N ""

# add private key to the ssh agent
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa

# append the public key to the authorized_keys file
touch ~/.ssh/authorized_keys
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

chmod 600 ~/.ssh/id_rsa
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

