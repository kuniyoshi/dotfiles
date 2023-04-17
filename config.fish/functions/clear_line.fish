function clear_line
    set -l saved_command (commandline)
    commandline -r ""
    set -g FISH_CLEAR_LINE_SAVED_COMMAND $saved_command
end
