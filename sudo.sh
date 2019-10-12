#!/bin/bash
set -x
# bootstrap with: wget -qO- <github_raw_url> | bash
mount -o user /media/cdrom
if [ $? -ne 0 ]; then
    echo "Insert guest additions cd first"
    exit 1
fi
apt update -y && apt upgrade
apt install -y dkms linux-headers-$(uname -r) build-essential
mount /media/cdrom
sleep 5
(cd /media/cdrom; sudo sh ./VBoxLinuxAdditions.run)
apt install -y git emacs

#Python dependencies
apt install -y --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
