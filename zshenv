LANG=en_US.UTF-8
EDITOR=vim
PAGER=less
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"

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
            kuniyoshi)
                PROMPT="[%F{40}%n%f:%F{40}%c%f]%# "
                RPROMPT='%F{41}#%f %50<..<%F{42}%~%f %F{42}[%D{%a} %*]%f'
            ;;
        esac
    ;;
esac

case $USER in
    kuniyoshi)
        EDITOR="emacs"
    ;;
esac

