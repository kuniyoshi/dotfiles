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

PROMPT='%F{13}%C%f %F{10}`current_branch`%f %F{3}[%D %*]%f
> '
export PROMPT

source "$HOME/.cargo/env"
