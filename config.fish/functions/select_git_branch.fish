function select_git_branch
    set current_token $argv[1]
    set branch_list (git branch)
    set num_branches (count $branch_list)
    set selected_branch (echo "$branch_list" | fzf --height="$num_branches" --query="$current_token" | perl -lpe 's{\A \s*[*]?\s*}{}msx')
    echo $selected_branch
end
