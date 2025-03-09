#!/bin/bash
# Make sure to enable other pacman repo before this
sudo pacman -S --noconfirm --needed lib32-mesa vulkan-radeon lib32-vulkan-radeon libva-mesa-driver libva-utils steam
yay -S --noconfirm --needed protonup-qt protontricks
