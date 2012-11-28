#alias ls='ls -X --group-directories-first --color=auto'
#alias ll='ls -Xl --group-directories-first --color=auto'
#alias la='ls -XA --group-directories-first --color=auto'
#alias lla='ls -XlA --group-directories-first --color=auto'
alias ls='ls -G'
alias ll='ls -G -l'
alias la='ls -G -a'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias myshut='sudo shutdown -h now'
alias myrestart='sudo shutdown -r now'
alias cd..='cd ..'
alias perldoc='perldoc -i'
alias prove='prove -I lib'
alias l='echo  l: command not found'
alias :q=exit
export PERL5LIB=/home/prigel/development/perl/dbic
alias GET="lwp-request5.12 -m GET"
export PAGER=less
