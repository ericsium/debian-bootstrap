#!/bin/sh
mount /media/cdrom
if [ $retval -ne 0 ]; then
    echo "Insert guest additions cd first"
    exit 1
fi
apt update -y && apt upgrade
apt install dkms linux-headers-$(uname -r) build-essential
sh /media/cdrom/VBoxLinuxAdditions.run
