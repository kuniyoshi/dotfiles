# environment variables
set --export EDITOR vim
set --export PAGER less -R
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

# abbreviation
abbr --add -- a bat
abbr --add -- p $PAGER
abbr --add -- e $EDITOR
abbr --add -- g git
abbr --add -- l exa
abbr --add -- c pwd
abbr --add -- ll exa -l
abbr --add -- j jobs
abbr --add -- m make
abbr --add -- f file
abbr --add -- s screen

abbr --add -- pd perldoc -i
abbr --add -- gs git status
abbr --add -- gf git fetch

abbr --add -- calcsum 'awk '\''{sum+=$1}END{print sum}'\'

# key binding
function fish_user_key_bindings
    bind \cgb 'select_git_branch (commandline -t)'
#    bind \cc clear_line
    bind \ew 'my_custom_function (commandline -t)'
end

# shell integration for kitty terminal
if set -q KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION enabled
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end
