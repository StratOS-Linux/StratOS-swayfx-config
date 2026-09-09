#!/bin/bash

BOOT_DONE="~/.config/sway/scripts/first_boot_done"

if [ ! -f "$BOOT_DONE" ]; then
	gsettings set org.gnome.shell.extensions.user-theme name "Tokyonight-Dark-Storm"
	gsettings set org.gnome.desktop.interface gtk-theme "Tokyonight-Dark-Storm"
	gsettings set org.gnome.desktop.interface icon-theme "Tokyonight-Moon" 
	# ln -sf $HOME/.themes/Tokyonight-Dark-B/gtk-4.0/  ~/.config/
	sudo ln -sf /etc/skel/.config/gtk-4.0/ ~/.config/
	touch "$FLAG"
