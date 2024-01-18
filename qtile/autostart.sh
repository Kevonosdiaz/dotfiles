#!/bin/sh
# feh --bg-scale /usr/share/endeavouros/backgrounds/endeavouros-wallpaper.png
feh --bg-scale /home/kevon/Pictures/mountains.jpg
picom & disown # --experimental-backends --vsync should prevent screen tearing on most setups if needed
nm-applet & disown
cbatticon & disown
xfce4-screensaver & disown

# Low battery notifier
~/.config/qtile/scripts/check_battery.sh & disown

# Start welcome
# eos-welcome & disown

# Rebind caps to ctrl key
# xmodmap ~/.Xmodmap

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown # start polkit agent from GNOME
