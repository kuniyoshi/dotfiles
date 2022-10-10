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

home_path=$HOME/bin
bundle_path=$HOME/Bundle/bin
mac_ports_path=/opt/local/sbin:/opt/local/bin
perl_path=/opt/local/libexec/perl5.30/sitebin:/opt/local/libexec/perl5.30
default_path=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
PATH="$home_path:$bundle_path:$mac_ports_path:$perl_path:$default_path"

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
#RPROMPT=$RPROMPT1

export PROMPT
#export RPROMPT

source "$HOME/.cargo/env"
