#!/bin/bash
#                _ _                              
# __      ____ _| | |_ __   __ _ _ __   ___ _ __  
# \ \ /\ / / _` | | | '_ \ / _` | '_ \ / _ \ '__| 
#  \ V  V / (_| | | | |_) | (_| | |_) |  __/ |    
#   \_/\_/ \__,_|_|_| .__/ \__,_| .__/ \___|_|    
#                   |_|         |_|               
#  
# inspired by Stephan Raabe (2023) 
# ----------------------------------------------------- 

# Cache file for holding the current wallpaper
cache_file="$HOME/.cache/current_wallpaper"
rasi_file="$HOME/.cache/current_wallpaper.rasi"

# Create cache file if not exists
if [ ! -f "$cache_file" ] ;then
    touch "$cache_file"
    echo "$HOME/hyprdots/wallpaper/default.jpg" > "$cache_file"
	ln -s "$HOME/hyprdots/wallpaper/default.jpg" "$HOME/.cache/wallpaper"
fi

current_wallpaper='$HOME/.cache/wallpaper'

case $1 in

    # Load wallpaper from .cache of last session 
    "init")
        sleep 1
        if [ -f "$cache_file" ]; then
            wal -q -i "$current_wallpaper"
        else
            wal -q -i ~/hyprdots/wallpaper/
        fi
    ;;

    # Select wallpaper with wofi
    *)
        sleep 0.2
        selected=$( find "$HOME/hyprdots/wallpaper" -type f \( -iname "*.jpg" -o -iname "*.gif" -o -iname "*.jpeg" -o -iname "*.png" \) -exec basename {} \; | sort -R | while read rfile
        do
            echo -en "$rfile\x00icon\x1f$HOME/wallpaper/${rfile}\n"
        done | wofi -dmenu -i --no-show-icons)
        if [ ! "$selected" ]; then
            echo "No wallpaper selected"
            exit
        fi
        wal -q -i ~/hyprdots/wallpaper/"$selected"
		ln -sf "$HOME/hyprdots/wallpaper/$selected" "$HOME"/.cache/wallpaper
    ;;

    # Randomly select wallpaper 
    "random")
        wal -q -i ~/hyprdots/wallpaper/
    ;;

esac

# ----------------------------------------------------- 
# Load current pywal color scheme
# ----------------------------------------------------- 
source "$HOME/.cache/wal/colors.sh"
echo ":: Wallpaper: $wallpaper"

# ----------------------------------------------------- 
# get wallpaper image name
# ----------------------------------------------------- 
newwall=$(echo "$wallpaper" | sed "s|$HOME/hyprdots/wallpaper/||g")


# ----------------------------------------------------- 
# Set the new wallpaper
# -----------------------------------------------------
transition_type="outer"

    swww img "$wallpaper" \
        --transition-bezier .43,1.19,1,.4 \
        --transition-fps=144 \
        --transition-type="$transition_type" \
        --transition-duration=0.4 

if [ "$1" == "init" ] ;then
    echo ":: Init"
else
    sleep 1
fi

# ----------------------------------------------------- 
# Write selected wallpaper into .cache files
# ----------------------------------------------------- 
echo "$wallpaper" > "$cache_file"
rm "$HOME"/.current_wallpaper
ln -s "$wallpaper" "$HOME"/.current_wallpaper
# echo "* { current-image: url(\"$blurred\", height); }" > "$rasi_file"

# ----------------------------------------------------- 
# Send notification
# ----------------------------------------------------- 
	pkill -USR2 waybar
# --------------------------------------------------------
# Change swaync theme
# --------------------------------------------------------
	swaync-client --reload-css


# --------------------------------------------------------
# Reload sway with new theme
# --------------------------------------------------------
	swaymsg reload

# Notify pywal work is done
if [ "$1" == "init" ] ;then
    echo ":: Init"
else
    notify-send "Pywal procedure complete!"
fi

echo "DONE!"

