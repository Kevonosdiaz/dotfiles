# Disable laptop speaker
sudo rmmod pcspkr
sudo rmmod snd_pcsp

# Install stuff and services
sudo pacman -S --noconfirm --needed bluez bluez-utils git pipewire easyeffects vlc lsp-plugins amd-ucode noto-fonts noto-fonts-cjk noto-fonts-emoji timeshift fastfetch flameshot sddm pacman-contrib zoxide ranger fzf ripgrep python3 alacritty kitty btop bat ncdu vim neovim starship tmux unzip
sudo systemctl enable --now bluetooth.service
sudo systemctl enable sddm.service
sudo systemctl enable NetworkManager.service
sudo systemctl enable paccache.timer
sudo systemctl enable fstrim.timer

# Yay as AUR helper + AUR packages
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S --noconfirm --needed spotify google-chrome spicetify-cli spicetify-marketplace-bin moc-pulse vesktop-bin youtube-music-bin visual-studio-code-bin

# Spicetify setup for AUR Spotify install
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
cp -r ~/dotfiles/spicetify ~/.config/

spicetify
spicetify backup apply enable-devtools
