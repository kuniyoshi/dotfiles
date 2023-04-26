function select_git_branch
    set current_token $argv[1]
    set branch_list (git branch)
    set num_branches (count $branch_list + 2)
    for line in $branch_list
        echo "$line"
    end \
        | fzf --height="$num_branches" --query="$current_token" | perl -lpe 's{\A \s*[*]?\s*}{}msx'
end
