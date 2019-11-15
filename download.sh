#!/bin/bash

home="/home/pi/git/pi-tool"
tarballs="tarballs"
usb="usb"
filename=$(basename "$1")

cd $home

if [ ! -f "$home/$tarballs/$filename" ]; then
	wget $1
	
	if [ ! -f "$home/$filename" ]; then
		echo "ERR, couldn't find or download $filename"
		exit 1
	fi

	mv $filename $tarballs
fi

sudo mount /dev/sda1 $usb
sudo rm -rf $usb/*.tar.xz*
sudo cp $tarballs/$filename $usb
sudo umount $usb

echo "Successfully copied tarball to USB!"