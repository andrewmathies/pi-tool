# pi-tool
Put a tarball onto your USB drive. Only download a build from skynet if you've never used it before.

# Instructions
1. Log onto your Pi
1. Run `git clone https://github.com/andrewmathies/pi-tool`
1. Run `pwd`
1. Copy the output of the previous command
1. Edit the script with command `vi download.sh`
1. Replace the path between the quotes for the home variable to what you copied to your clipboard in the previous step
1. Insert your USB drive (make sure it's the only USB drive plugged in)
1. Copy the address of the tarball you want to put on your USB drive (ex. https://skynet-s3.al.ge.com/cooking/wall-oven-lcd-ui/cooking_wall-oven-lcd-ui_on_change_master/Build-00307-d6b4f93fe3ff75a39ea92d9e1cbeabb4676cccc1/bsp2/5cb3144e95125e1affcd0fc7ed1b9335_0_0_3_48_walloven.tar.xz.enc)
1. Run `download.sh [address]` where [address] is the address you copied to your clipboard in the previous step
