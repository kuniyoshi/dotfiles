function select_file
    set token $argv[1]
    set count (count (fd "$token" .) + 2)
    fd "$token" . | fzf --height="$count" --query="$toekn"
    echo $selected
end
