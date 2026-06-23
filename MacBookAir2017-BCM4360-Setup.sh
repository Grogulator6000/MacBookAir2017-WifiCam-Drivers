#!/bin/sh

while true; do
	read -p "This will install the BCM4360 wifi driver. Make sure you are fully updated, and have non-free-firmware sources before running. Continue? 
[y/n]: " yn
	case $yn in
		[Yy]* ) ;; 
		[Nn]* ) exit;;
		* ) echo "Unclear answer. Exiting" && exit;;
	esac
	sudo apt install automake autoconf git curl wget b43-fwcutter broadcom-wl broadcom-sta-common broadcom-sta-dkms laptop-mode-tools
	sudo apt-get install linux-image-$(uname -r|sed 's,[^-]*-[^-]*-,,') linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') broadcom-sta-dkms
	sudo find /lib/modules/$(uname -r)/updates
	sudo modprobe -r b44 b43 b43legacy ssb brcmsmac bcma
	sudo modprobe wl
	echo "Reboot for changes"
	break
done
