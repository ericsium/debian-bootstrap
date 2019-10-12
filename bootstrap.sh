#!/bin/sh
mount /media/cdrom
if [ $? -ne 0 ]; then
    echo "Insert guest additions cd first"
    exit 1
fi
apt update -y && apt upgrade
apt install -y dkms linux-headers-$(uname -r) build-essential
sh /media/cdrom/VBoxLinuxAdditions.run
apt install -y git emacs
