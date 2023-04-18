function fzf_fit_height
    set query $argv[1]
    read -a -z candidates

    set candidates_size (count $candidates)
    set fzf_line_size 2
    set max_line_size 22
    set min_size (if test $candidates_size -lt $max_line_size; echo $candidates_size; else; echo $max_line_size; end)
    set buffer_size (math $min_size + $fzf_line_size)

    begin
        for line in $candidates
            echo $line
        end
    end \
        | fzf --height "$buffer_size" --query "$query"
end
