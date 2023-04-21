function commandline_replace_fd
    set file (select_file (commandline -t))
    if test -n "$file"
        commandline -rt "$file"
        commandline -f repaint
    end
end
