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
    fzf-fit-height \
    select-file \
    optional-source \
    precmd

stty erase \^H

if [ -d ~/.zle.d ]
then
    for x in $(ls -d ~/.zle.d/*.zle)
    do
        source "$x"
    done
fi

optional-source ~/.zsh_aliases

optional-source ~/.secretrc

optional-source ~/Bundle/zsh-autoenv/autoenv.zsh

#test -e /Users/kuniyoshi/.iterm2_shell_integration.zsh && source /Users/kuniyoshi/.iterm2_shell_integration.zsh || true
