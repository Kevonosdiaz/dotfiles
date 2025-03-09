#!/bin/bash
# Expect partioning, mounting to be done manually

# Disable laptop speaker
sudo rmmod pcspkr
sudo rmmod snd_pcsp

# pacstrap and other packages
pacstrap -K /mnt base base-devel linux linux-headers linux-firmware amd-ucode vim neovim man-db sudo networkmanager network-manager-applet wireless_tools wpa_supplicant dialog

# For systemd boot config later
# echo "options root=PARTUUID=$(blkid -s PARTUUID -o value /dev/[partition]) rw" >> /boot/loader/entries/arch.conf
