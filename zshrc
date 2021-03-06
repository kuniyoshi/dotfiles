# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

source ~/.zshenv

fpath=(~/.zsh.d $fpath)
set -o emacs
setopt extended_history
setopt hist_ignore_space
setopt auto_cd
setopt prompt_subst
setopt magic_equal_subst
autoload -U compinit && compinit
autoload current_branch \
    mcd \
    ginit \
    epoch_to_datetime \
    datetime_to_epoch \
    difference \
    sjis \
    select-git-branch \
    select-git-refspec \
    select-git-remote-branch-without-remote \
    fzf-fit-height

stty erase \^H

if [ -d ~/.zle.d ]
then
    for x in $(ls -d ~/.zle.d/*.zle)
    do
        source "$x"
    done
fi

if [ -f ~/.zsh_aliases ]
then
    source ~/.zsh_aliases
fi

if [ -f ~/.secretrc ]
then
    source ~/.secretrc
fi

return
