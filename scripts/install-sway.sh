#!/bin/bash
sudo pacman -S --noconfirm --needed sway brightnessctl libpulse mako polkit swaybg sway-contrib swayidle swaylock waybar wmenu xorg-xwayland xdg-desktop-portal-gtk xdg-desktop-portal-wlr fuzzel kitty dolphin gnome-keyring

# Copy dots
cp -r waybar sway fuzzel ~/.config/
./reload-dots.sh
