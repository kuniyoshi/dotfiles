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
    stash_icon \
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

optional-source /opt/local/share/fzf/shell/key-bindings.zsh
optional-source /opt/local/share/fzf/shell/completion.zsh

if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi

source /Users/kuniyoshi/.config/broot/launcher/bash/br
