export LANG=en_US.UTF-8
export EDITOR=vim
export PAGER=less
export LESS="-e"
export HISTFILE=$HOME/.zsh-history
export HISTSIZE=100000
export SAVEHIST=100000
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"

case $OSTYPE in
    darwin*)
        PATH=/Developer/usr/local/bin:/Developer/usr/bin:/usr/local/bin:/opt/local/bin:/bin:/opt/local/sbin:/usr/bin:/Developer/usr/sbin:/usr/sbin:/sbin:/usr/X11/bin
    ;;
    linux*)
        SBIN_PATH=/sbin:/usr/sbin:/usr/local/sbin
        PATH=/usr/local/bin:/usr/local/perl-5.14/bin:/usr/local/perl-5.12/bin:/bin:/usr/bin/:$SBIN_PATH
    ;;
esac

if [ -d ~/bin ]; then
    export PATH=~/bin:$PATH
fi

export PATH

# mba: blue
# vps: purple
# mbp: blue
# sh: green

case $OSTYPE in
    darwin*)
        PROMPT="[%F{27}%n%f:%F{27}%c%f]%# "
        RPROMPT='%F{26}#%f %50<..<%F{12}%~%f %F{21}[%D{%a} %*]%f'
    ;;
    linux*)
        case $USER in
            gwendolyn)
                PROMPT=$'[%{\e[38;5;163m%}%n%{\e[m%}:%{\e[38;5;163m%}%c%{\e[m%}]%# '
            ;;
            rigel)
                PROMPT="[%F{39}%n%f:%F{39}%c%f]%# "
                RPROMPT='%F{38}#%f %50<..<%F{38}%~%f %F{38}[%D{%a} %*]%f'
            ;;
            kuniyoshi)
                PROMPT="[%F{40}%n%f:%F{40}%c%f]%# "
                RPROMPT='%F{41}#%f %50<..<%F{42}%~%f %F{42}[%D{%a} %*]%f'
            ;;
        esac
    ;;
esac

export PROMPT
export RPROMPT

case $USER in
    kuniyoshi)
        export EDITOR="emacs"
    ;;
esac

