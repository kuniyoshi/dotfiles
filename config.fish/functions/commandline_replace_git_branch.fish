function commandline_replace_git_branch
    set selected_branch (select_git_branch)
    if test -n "$selected_branch"
        commandline -rt "$selected_branch"
        commandline -f repaint
    end
end
