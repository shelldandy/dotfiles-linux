#!/bin/sh
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
xrandr --output DP-2 --mode 3840x2160 --left-of DP-0 --output HDMI-0 --mode 3840x2160 --right-of DP-0 --output DP-0 --mode 3840x2160 --primary
# Wallpapers
nitrogen --restore
# Screensaver
xscreensaver -no-splash &
# Compositor (window animations)
picom --experimental-backends
# Compose key for ñ or accents á
setxkbmap -option compose:ralt
# Set Display Power Management Signaling aka
# monitors to switch off after a while
xset +dpms
# numlock auto on
numlockx on
