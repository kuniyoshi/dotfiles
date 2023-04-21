function commandline_replace_git_refspec
    set branch (select_git_branch (commandline -t))

    if test -n "$branch"
        commandline -rt "origin/$branch:$branch"
        commandline -f repaint
    end
end
