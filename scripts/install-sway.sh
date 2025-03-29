#!/bin/bash
sudo pacman -S --noconfirm --needed sway brightnessctl libpulse mako polkit swaybg sway-contrib swayidle swaylock waybar wmenu xorg-xwayland xdg-desktop-portal-gtk xdg-desktop-portal-wlr fuzzel kitty dolphin gnome-keyring qt6ct inetutils autotiling

# Copy dots
cd ..; cp -r waybar sway fuzzel qt6ct/colors rofi ~/.config/
# ./reload-dots.sh
