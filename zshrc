# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

source ~/.zshenv

set -o emacs
setopt extended_history
setopt hist_ignore_space
setopt auto_cd
autoload -U compinit && compinit

stty erase \^H

if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

if [ -f ~/.secretrc ]; then
    source ~/.secretrc
fi

function mcd () { mkdir -p $1 && cd $1 }

return

