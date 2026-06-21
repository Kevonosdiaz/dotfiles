if status is-interactive
# Commands to run in interactive sessions can go here
end

fish_add_path -p $HOME/.local/bin $HOME/neovim/bin

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
alias cdn "cd ~/.config/nvim/lua/custom"

alias dlaudio 'yt-dlp -x --audio-quality 0 --no-keep-video --download-archive ~/dotfiles/backup/yt-dlp-archive.txt --embed-thumbnail --embed-metadata -o "%(title)s"'

# Exports
set -x MAKEFLAGS "--jobs $(nproc)"
set -x MANPAGER "nvim +Man!"

# Functions
function getLocalDiff -a commit
    command git diff "$commit"~ "$commit"
end

function getStatus -a commit
    command git show --name-status "$commit"
end

zoxide init fish | source
starship init fish | source
