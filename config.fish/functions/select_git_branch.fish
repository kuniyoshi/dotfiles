function select_git_branch
    set current_token (commandline -t)
    set branch_list (git branch)
    set num_branches (count $branch_list)
    set selected_branch (echo "$branch_list" | fzf --height="$num_branches" --query="$current_token" | perl -lpe 's{\A \s*[*]?\s*}{}msx')
    if test -n "$selected_branch"
        commandline -rt "$selected_branch"
        commandline -f repaint
    end
end
