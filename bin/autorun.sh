#!/bin/bash
##############################################
#  ___,
# /   |
#|    |           _   ,   __   _  _  _    _
#|    |  |  |  |_|/  / \_/  \_/ |/ |/ |  |/
# \__/\_/ \/ \/  |__/ \/ \__/   |  |  |_/|__/
#
# Autostart stuff for AwesomeWM
# by @shelldandy
##############################################

# Set our displays
xrandr --output DP-2 --mode 3840x2160 --left-of DP-0 --output HDMI-0 --mode 3840x2160 --right-of DP-0
# Wallpapers
nitrogen --restore
# Compositor (window animations)
picom --experimental-backends
# Compose key for ñ or accents á
setxkbmap -option compose:ralt
