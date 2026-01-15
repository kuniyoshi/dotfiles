function icat_tile --description 'Tile images with kitty kitten icat using $COLUMNS/$LINES'
    # Usage:
    #   icat_tile <nperline> <img1> [img2 ...]
    #
    # Example:
    #   icat_tile 4 *.png

    if test (count $argv) -lt 2
        echo "Usage: icat_tile <nperline> <img1> [img2 ...]" >&2
        return 2
    end

    set -l nperline $argv[1]
    if not string match -qr '^[0-9]+$' -- $nperline
        echo "icat_tile: nperline must be a positive integer" >&2
        return 2
    end
    if test $nperline -le 0
        echo "icat_tile: nperline must be >= 1" >&2
        return 2
    end

    set -l images $argv[2..-1]
    if test (count $images) -eq 0
        echo "icat_tile: no images given" >&2
        return 2
    end

    # Terminal size (cells)
    set -l cols $COLUMNS
    set -l lines $LINES
    if test -z "$cols" -o -z "$lines"
        # Fallback if env vars are not set for some reason.
        set cols (tput cols 2>/dev/null)
        set lines (tput lines 2>/dev/null)
    end
    if test -z "$cols" -o -z "$lines"
        echo "icat_tile: cannot determine terminal size (COLUMNS/LINES)" >&2
        return 1
    end

    # One tile size in cells.
    # Width: split by nperline.
    set -l tile_w (math -s0 "$cols / $nperline")
    if test $tile_w -lt 1
        set tile_w 1
    end

    # Rows needed to show all images (ceil).
    set -l count_imgs (count $images)
    set -l rows (math -s0 "($count_imgs + $nperline - 1) / $nperline")
    if test $rows -lt 1
        set rows 1
    end

    # Height per tile based on screen lines and rows.
    set -l tile_h (math -s0 "$lines / $rows")
    if test $tile_h -lt 1
        set tile_h 1
    end

    # Clear screen to reduce leftovers; then place images.
    # (You can remove these two lines if you don't want it.)
    printf "\e[2J\e[H"

    set -l idx 0
    for img in $images
        set idx (math $idx + 1)

        set -l i0 (math $idx - 1)

        set -l row (math -s0 "($i0 - ($i0 % $nperline)) / $nperline")
        set -l col (math -s0 "$i0 % $nperline")

        set -l x (math -s0 "$col * $tile_w")
        set -l y (math -s0 "$row * $tile_h")

        # If placement goes beyond terminal bottom, stop.
        if test $y -ge $lines
            break
        end

        # Skip non-existent files early.
        if not test -e "$img"
            continue
        end

        # Place image: <WxH@XxY>, using cell units.
        # --scale-up makes small images fill their tile if possible.
        kitten icat \
            --place "$tile_w"x"$tile_h"@"$x"x"$y" \
            --scale-up \
            --align left \
            --stdin no \
            "$img"
    end
end