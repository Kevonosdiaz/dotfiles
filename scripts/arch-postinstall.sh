#!/bin/bash

# Expected to be run after running arch-chroot /mnt

# Install stuff and services
pacman -S --noconfirm --needed bluez bluez-utils pipewire easyeffects vlc lsp-plugins amd-ucode noto-fonts noto-fonts-cjk noto-fonts-emoji timeshift fastfetch flameshot sddm pacman-contrib zoxide ranger fzf ripgrep python3 alacritty kitty btop bat ncdu vim neovim starship tmux unzip pavucontrol-qt feh brightnessctl playerctl zathura gnome-keyring libsecret firefox networkmanager network-manager-applet tree ntfs-3g os-prober linux-headers linux-lts linux-lts-headers efibootmgr wpa_supplicant wget unzip tealdeer wikiman arch-wiki-docs xorg-xhost archlinux-xdg-menu

systemctl enable --now bluetooth.service
systemctl enable sddm.service
systemctl enable NetworkManager.service
systemctl enable paccache.timer
systemctl enable fstrim.timer

ln -sf /usr/share/zoneinfo/Canada/Mountain /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo "Manually add hostname to /etc/hostname"
echo "Manually add hosts file at /etc/hosts" # TODO add example config

# Setup root and user
echo "Root passwd:"
passwd
useradd -m kevon
echo "Passwd for user kevon:"
passwd kevon
usermod -aG wheel,audio,video,optical,storage,power,input kevon
visudo

# Setup systemd-boot
bootctl install

echo "Manually update /boot/loader/loader.conf and /boot/loader/entries/ as needed"
# TODO Add example config
echo "Append last line of entry using following command to use PARTUUID more easily:"
echo "\techo\t\"options root=PARTUUID=$(blkid -s PARTUUID -o value /dev/[partition here]) rw\" >> /boot/loader/entries/(your entry here).conf"
