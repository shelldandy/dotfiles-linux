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

fkmd="--mode 3840x2160 --rate 60.00"

# Set our displays
xrandr --output HDMI-0 --primary $fkmd --output DP-0 $fkmd --left-of HDMI-0 --output DP-2 $fkmd --right-of HDMI-0
# Wallpapers
nitrogen --restore
# Screensaver
xscreensaver -no-splash &
# Compositor (window animations)
picom --experimental-backends
# Set Display Power Management Signaling aka
# monitors to switch off after a while
xset +dpms
# numlock auto on
numlockx on
