#!/bin/bash

# First argument: Primary monitor
# Second argument: Secondary monitor

if [[ -n $( xrandr | grep "$2 connected" ) ]] ; then
    xrandr --output $2 --mode 1920x1080 --rate 60 --scale 1x1
    xrandr --output $1 --off
else
    xrandr --output $1 --mode 1920x1080 --rate 60 --scale 1x1
fi

# xsetwacom --set "Wacom Intuos S Pen stylus" Area 4100 3500 11100 7438
xmodmap ~/config/peripherals/xkeys &
xset r rate 400 25 &

