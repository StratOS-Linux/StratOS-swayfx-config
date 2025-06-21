install_packages() {
	yay -S swayfx swaync swaylock-effects-git
}

perform_symlinks() {
	ln -s "$HOME"/swaydots/sway "$HOME"/.config/sway
}
