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

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

