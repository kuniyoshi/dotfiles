# environment variables
set --export EDITOR vim
set --export PAGER less
set --global --append fish_user_paths \
    /opt/local/sbin/ \
    /opt/local/bin/ \
    ~/bin \
    ~/.cargo/bin/
set --export PERLDOC_PAGER less\ -R
set --export LESS "-e -F -X -j 5"

# quit if not interactive
if not status is-interactive
    return
end

# keep configuring when interactive

# alias
alias a bat
alias p "$PAGER"
alias e "$EDITOR"
alias g git
alias l exa
alias ll "exa -l"
alias j jobs
alias m make
alias f file
alias s tmux
alias c pwd

alias pd "perldoc -i"
alias gs "git status"
alias gf "git fetch"

# abbreviation
abbr --add -- calcsum 'awk '\''{sum+=$1}END{print sum}'\'

# event handlers
source ~/.config/fish/event_handlers/*.fish

# key binding
function fish_user_key_bindings
    bind \cgb commandline_replace_git_branch
    bind \cgf commandline_replace_git_refspec
    bind \cc clear_line
    bind \cx\cf commandline_replace_fd
end

# shell integration for kitty terminal
if set -q KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION enabled
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end

# shell integration for zellij
#eval (zellij setup --generate-auto-start fish | string collect)
