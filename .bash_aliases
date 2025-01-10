# General bash aliases (and also small functions)

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lah="ls -lah"

# Nice to haves
alias makej="make -j"
alias mj="make -j"
alias c="clear"
alias fd="rg --files | rg"

# Git stuff
alias g="git"
alias ga="git add --all"
alias gc="git commit -m"
alias gd="git diff"
alias gs="git status"
alias log="git log"
alias push="git push"
alias pull="git pull"
alias branch="git branch"
alias b="git branch"
alias checkout="git checkout"
alias co="git checkout"
alias gwl="git worktree list"
alias gr="git remote"
alias remote="git remote -v"

# yadm stuff
alias y="yadm"
alias ya="yadm add"
alias yaa="yadm add -u" # update existing files
alias yc="yadm commit -m"
alias yd="yadm diff"
alias ys="yadm status"
alias ylog="yadm log"
alias ypush="yadm push"
alias ypull="yadm pull"

# Docker
alias dps="docker ps"
alias di="docker images"

alias ta="tmux attach"

alias refreshBelow="rm -rf build; mkdir build; cd build"
alias refreshHere="cd ..; rm -rf build; mkdir build; cd build"
alias refresh="refreshHere"
alias srefreshBelow="sudo rm -rf build; mkdir build; cd build"
alias srefreshHere="cd ..; srefreshBelow"
alias srefresh="srefreshHere"

alias python="python3"
alias p3="python3"
alias r=". ranger"
alias n="nvim"

alias e="export"
alias ea="nvim ~/.bash_aliases"
alias ewa="nvim ~/.bash_work_aliases"
alias eb="nvim ~/.bashrc"
alias et="nvim ~/.tmux.conf"
alias en="nvim ~/.config/nvim/init.lua"
alias enp="nvim ~/.config/nvim/lua/custom/plugins.lua"
alias cdn="cd ~/.config/nvim/lua/custom/"
alias resource="source ~/.bashrc"
alias s="source ~/.bashrc"
alias updateDotfiles="cp ~/.bashrc ~/.bash_aliases .tmux.conf ~/dotfiles; cd ~/dotfiles; git status"
alias fetchDotfiles="cp ~/dotfiles/.bashrc ~/dotfiles/.bash_aliases ~/dotfiles/.tmux.conf ~/;"
alias cx="cd .."
alias cxx="cd ../.."
alias cxxx="cd ../../.."

alias q="exit"

# Arch Linux specific
alias yay="yay --aur"
alias yay-clear="yay -Sc"
alias wshow="waydroid show-full-ui"
alias wstop="waydroid session stop"

# Recursively replace string $1 with string $2 (may not work with whitespace?)
findAndReplace() {
    git grep -rl "$1" . | xargs sed -i "s/"$1"/"$2"/g"
}

mcd() {
    mkdir "$1"; cd "$1"
}

mcdb() {
    mkdir build; cd build
}

# See changes made from a commit compared to its predecessor
getLocalDiff() {
    git diff "$1"~ "$1" 
}

# See status of a commit (comment & files changed)
getStatus() {
    git show --name-status "$1"
}

