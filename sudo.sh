#!/bin/sh
# bootstrap with: 
# wget -O sudo.sh https://git.io/Jel5d
# sudo sh sudo.sh

set -x

#######################
# Virtualbox Guest Additions
#######################
mount /media/cdrom
if [ $? -ne 0 ]; then
    echo "Insert guest additions cd first"
    exit 1
fi
apt update -y && apt upgrade
apt install -y dkms linux-headers-$(uname -r) build-essential
sh /media/cdrom/VBoxLinuxAdditions.run

#######################
# Misc packages
#######################
apt install -y git emacs

#######################
# Python Dependencies
#######################
apt install -y --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

#######################
# Docker CE Edition
#######################
apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

apt update
apt install -y docker-ce docker-ce-cli containerd.io
