if status is-interactive
# Commands to run in interactive sessions can go here
end

fish_add_path -p $HOME/.local/bin $HOME/neovim/bin $HOME/go/bin $HOME/.cargo/bin

# Aliases
alias cd z
alias p3 python3
alias lg lazygit
alias c clear
alias n nvim
alias cx "cd .."
alias cxx "cd ../.."
alias se "sudoedit"

alias ga "git add --all"
alias gc "git commit -m"
alias gd "git diff"
alias gs "git status"
alias pull "git pull"
alias push "git push"
alias b "git branch"

alias ta "tmux attach"
alias fd "rg --files | rg"
alias fc "fzf --preview='cat {}'"
alias cdn "cd ~/.config/nvim"

alias wshow "waydroid show-full-ui"
alias wstop "waydroid session stop"
alias wreload "sudo systemctl restart waydroid-container.service"
alias wwidth "waydroid prop set persist.waydroid.width"
alias wheight "waydroid prop set persist.waydroid.height"
alias wrestore-bar "wwidth 2040 && wheight 1100"
alias wrestore-full "wwidth 2048 && wheight 1152"

alias dlaudio "yt-dlp -x --audio-quality 0 --no-keep-video --download-archive ~/backup/yt-dlp-archive.txt --embed-thumbnail --embed-metadata -o '%(title)s'"
alias cliplist "cliphist list | fzf --no-sort | cliphist decode | wl-copy"

# Exports
set -x MAKEFLAGS "--jobs $(nproc)"
set -x MANPAGER "nvim +Man!"
set -x XDG_MENU_PREFIX "arch-"
set -x GTK_THEME "catppuccin-macchiato-lavender-standard+default"

# Functions
function getLocalDiff -a commit
    command git diff "$commit"~ "$commit"
end

function getStatus -a commit
    command git show --name-status "$commit"
end

zoxide init fish | source
starship init fish | source
