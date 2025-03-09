#!/bin/bash
sudo pacman -S --needed --noconfirm plasma konsole
git clone --depth=1 https://github.com/catppuccin/kde catppuccin-kde && cd catppuccin-kde
./install.sh
