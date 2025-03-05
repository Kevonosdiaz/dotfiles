#!/bin/bash
sudo pacman -S --noconfirm --needed sway brightnessctl libpulse mako polkit swaybg sway-contrib swayidle swaylock waybar wmenu xorg-xwayland xdg-desktop-portal-gtk xdg-desktop-portal-wlr fuzzel kitty dolphin

# Copy dots
cp -r waybar sway ~/.config/
./reload-dots.sh
