#!/bin/bash

$1 = eDP-1
$2 = HDMI-1

if [[ -n $( xrandr | grep "$2 connected" ) ]] ; then
    xrandr --output $2 --mode 1920x1080 --rate 60 --scale 1x1
    xrandr --output $1 --off
else
    xrandr --output $1 --mode 1920x1080 --rate 60 --scale 1x1
fi

# if [[ ]] ; then
xsetwacom --set "Wacom Intuos S Pen stylus" Area 4100 3500 11100 7438
xsetwacom --set "Wacom Intuos S Pen stylus" PressureCurve 0 100 50 100
xsetwacom --set "Wacom Intuos S Pen stylus" Threshold 100
# fi

xmodmap ~/config/peripherals/xkeys &
xset r rate 400 25 &
