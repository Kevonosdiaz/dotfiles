# Disable laptop speaker
sudo rmmod pcspkr
sudo rmmod snd_pcsp

# Install stuff and services
sudo pacman -S --noconfirm --needed bluez bluez-utils git pipewire easyeffects vlc lsp-plugins amd-ucode noto-fonts noto-fonts-cjk timeshift fastfetch flameshot sddm pacman-contrib
sudo systemctl enable --now bluetooth.service
sudo systemctl enable sddm.service
sudo systemctl enable NetworkManager.service
sudo systemctl enable paccache.timer
sudo systemctl enable fstrim.timer

# Yay as AUR helper
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si


