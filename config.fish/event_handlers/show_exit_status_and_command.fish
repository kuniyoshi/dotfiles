function show_exit_status_and_command --on-event fish_postexec
    set -l last_status $status
    if test $last_status -ne 0
        set -l red (set_color red)
        set -l normal (set_color normal)
        echo -e "$red""[$last_status]: $argv""$normal" >&2
    end
end
