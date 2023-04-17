function mcd
    if not test -d $argv
        mkdir -p $argv
    end

    cd $argv
end
