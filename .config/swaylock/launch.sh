source "$HOME"/.cache/wal/colors.sh

swaylock \
	--daemonize \
	--ignore-empty-password \
	--disable-caps-lock-text \
	--image ~/.current_wallpaper \
	--effect-blur 7x5 \
	--effect-vignette 0.5:0.5 \
	--indicator \
	--indicator-radius 120 \
	--indicator-thickness 20 \
	--clock \
	--timestr '%I:%M %p' \
	--datestr '%A, %d %B' \
	--ring-color "$color2" \
	--key-hl-color "$color6" \
	--line-color 2E3440 \
	--separator-color 3B4252 \
	--inside-color 3B4252 \
	--bs-hl-color A3BE8C \
	--layout-bg-color "$background" \
	--layout-border-color 4C566A \
	--layout-text-color D8DEE9 \
	--text-color "$color6" \
