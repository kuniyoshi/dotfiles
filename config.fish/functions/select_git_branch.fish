function select_git_branch
    git branch \
        | fzf_fit_height "$argv" \
        | perl -lpe 's{^\s*([*]\s+)?}{}; s{\s*}{}'
end
