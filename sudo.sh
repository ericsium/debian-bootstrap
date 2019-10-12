#!/bin/sh
set -x
# bootstrap with: 
# wget -qO boostrap.sh <github_raw_url>
# sudo sh bootstrap.sh
DEBIAN_FRONTEND=noninteractive
mount -o user /media/cdrom
if [ $? -ne 0 ]; then
    echo "Insert guest additions cd first"
    exit 1
fi
apt update && apt upgrade
apt install dkms linux-headers-$(uname -r) build-essential
sh ./VBoxLinuxAdditions.run
apt install git emacs

#Python dependencies
apt install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
