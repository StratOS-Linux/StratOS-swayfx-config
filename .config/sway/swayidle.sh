#!/bin/env bash
swayidle timeout 300 'bash -c $HOME/.config/swaylock/launch.sh 50' \
          timeout 600 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
          before-sleep 'bash -c $HOME/.config/swaylock/launch.sh 50' &
