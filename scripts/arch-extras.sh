#!/bin/bash

# Yay as AUR helper + AUR packages
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S --noconfirm --needed spotify google-chrome spicetify-cli spicetify-marketplace-bin moc-pulse vesktop-bin youtube-music-bin visual-studio-code-bin auto-cpufreq

# Spicetify setup for AUR Spotify install
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
cp -r ~/dotfiles/spicetify ~/.config/

spicetify
spicetify backup apply enable-devtools

systemctl enable --now auto-cpufreq.service

# Install Rust-based mediaplayer detector
cargo install --git https://github.com/stefur/lizzy lizzy

# Add Windows to systemd boot
# Find EFI partition where Windows exists, mount it to /mnt
# sudo cp -ax /mnt/EFI/Microsoft /boot/EFI/

# Note: Adding printer to connect to
# Install CUPS and Avahi, enable their services
# Reference https://wiki.archlinux.org/title/Avahi#Hostname_resolution and
# https://blog.yaymukund.com/posts/wireless-printers-on-swaywm/
