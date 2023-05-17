function expand_command_to_path
    set -l command (commandline -t)
    set -l path (type -p $command 2>/dev/null)

    if test -n "$path"
        commandline -t ""
        commandline -i "$path"
    else
        echo "\nCommand not found: $command"
    end
end
