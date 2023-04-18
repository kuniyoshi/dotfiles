function newline_to_null
    while read -l line
        echo -n -e "$line\0"
    end
end
