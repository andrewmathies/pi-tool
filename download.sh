#!/bin/bash

home="/home/pi/pi-tool"
tarballs="tarballs"
usb="usb"
filename=$(basename "$1")

cd $home

if [ ! -f "$home/$tarballs/$filename" ]; then
	echo "Downloading tarball"
	wget $1
	
	if [ ! -f "$home/$filename" ]; then
		echo "ERROR, couldn't find or download $filename"
		exit 1
	fi

	mv $filename $tarballs
fi

if [ -n "`mount | grep /dev/sda1`" ]; then
	echo "WARNING, device already mounted"
	exit 0
fi

sudo mount /dev/sda1 $usb

if [ $? -ne 0 ]; then
	echo "ERROR, mount failed. Is the USB plugged in?"
	exit 1
fi

sudo rm -rf $usb/*.tar.xz*
echo "Copying tarball to USB"
sudo cp $tarballs/$filename $usb
sudo umount $usb

echo "Successfully copied tarball to USB!"
