# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

source ~/.zshenv

fpath=(~/.zsh.d $fpath)
set -o emacs
setopt extended_history
setopt hist_ignore_space
setopt auto_cd
autoload -U compinit && compinit
autoload current_branch mcd ginit

stty erase \^H

if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

if [ -f ~/.secretrc ]; then
    source ~/.secretrc
fi

return
