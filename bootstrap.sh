#!/bin/sh
mount /media/cdrom
if [ $retval -ne 0 ]; then
    echo "Insert guest additions cd first"
    exit 1
fi
apt-get update && apt-get upgrade
apt-get install build-essential module-assistant
m-a prepare
sh /media/cdrom/VBoxLinuxAdditions.run
