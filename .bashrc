#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
alias config='/usr/bin/git --git-dir=/home/kevon/dotfiles --work-tree=/home/kevon'
export PATH="$HOME/.config/emacs/bin:$PATH"
# alias emacs="emacsclient -c -a 'emacs'"
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="/usr/bin/java:$PATH"
export PATH="/usr/bin/javac:$PATH"

export EDITOR='nvim'

alias ta="tmux attach"
alias c="clear"
alias gs="git status"
alias ga="git add --all"
alias gc="git commit -m"
alias pull="git pull"
alias push="git push"
alias b="git branch"

alias wshow="waydroid show-full-ui"
alias wstart="waydroid session start"
alias wstop="waydroid session stop"

# Nice to haves
alias makej="make -j"
alias mj="make -j"
alias c="clear"
alias g="git"
alias ga="git add --all"
alias gc="git commit -m"
alias gd="git diff"
alias gs="git status"
alias push="git push"
alias pull="git pull"

alias refreshBelow="rm -rf build; mkdir build; cd build"
alias refreshHere="cd ..; rm -rf build; mkdir build; cd build"

alias python="python3"
alias p3="python3"
alias r=". ranger"
alias q="exit"
alias cx="cd .."

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

