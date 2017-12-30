#!/bin/bash

main='eDP-1'
external='HDMI-1'

if [[ -n $( xrandr | grep "$external connected" ) ]] ; then
    xrandr --output $external --mode 1920x1080 --rate 60 --scale 1x1
    xrandr --output $main --off
else
    xrandr --output $main --mode 1920x1080 --rate 60 --scale 1x1
fi

# if [[ ]] ; then
xsetwacom --set "Wacom Intuos S Pen stylus" Area 4100 3500 11100 7438
xsetwacom --set "Wacom Intuos S Pen stylus" PressureCurve 0 100 50 100
xsetwacom --set "Wacom Intuos S Pen stylus" Threshold 100
# fi

xmodmap ~/config/peripherals/xkeys &
xset r rate 400 25 &
