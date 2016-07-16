export LANG=en_US.UTF-8
export EDITOR=vim
export PAGER=less
export PERLDOC_PAGER=less\ -R
export LESS="-e -F -X -j 5"
export HISTFILE=$HOME/.zsh-history
export HISTSIZE=100000
export SAVEHIST=100000
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"
export PYTHONPATH=~/python27/lib/python2.7/site-packages

case $OSTYPE in
    darwin*)
        home_path=$HOME/bin
        perl_path=/opt/local/libexec/perl5.24/sitebin
        default_path=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
        python_path=$HOME/python27/bin
        PATH="$home_path:$perl_path:$default_path"
    ;;
    linux*)
        SBIN_PATH=/sbin:/usr/sbin:/usr/local/sbin
        PERL_PATH=/usr/local/perl-5.14/bin:/usr/local/perl-5.12/bin
        ERLANG_PATH=/usr/local/erlang/bin
        RUBY_PATH=/usr/local/ruby/bin
        PATH=/usr/local/bin:/bin:$RUBY_PATH:/usr/bin:$ERLANG_PATH:$PERL_PATH:$SBIN_PATH
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
PROMPT1='[%F{27}%n%f:%F{27}%c%f%F{27}`current_branch`%f]%# '
RPROMPT1='%F{26}#%f %50<..<%F{12}%~%f %F{21}[%D{%a} %*]%f'

PROMPT2=$'[%{\e[38;5;163m%}%n%{\e[m%}:%{\e[38;5;163m%}%c%{\e[m%}]%# '

PROMPT3="[%F{39}%n%f:%F{39}%c%f]%# "
RPROMPT3='%F{38}#%f %50<..<%F{38}%~%f %F{38}[%D{%a} %*]%f'

PROMPT4='[%F{40}%n%f:%F{40}%c%f%F{40}`current_branch`%f]%# '
RPROMPT4='%F{41}#%f %50<..<%F{42}%~%f %F{42}[%D{%a} %*]%f'

PROMPT=$PROMPT1
RPROMPT=$RPROMPT1

export PROMPT
export RPROMPT

