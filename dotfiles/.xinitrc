#!/bin/bash

# Applets {{{1

nm-applet &
blueman-applet &
redshift-gtk &
insync start --synchronous-full &


# Visuals {{{1

./.fehbg &
xrandr --output eDP-1 --mode 1920x1080 --rate 60 --scale 1x1 &
unclutter --timeout 1 &


# Volume {{{1

sh -c "pactl set-sink-mute 0 false ; pactl set-sink-volume 0 40%" &
pactl set-source-volume 1 100%


# Keyboard {{{1

xmodmap ~/config/peripherals/xkeys &
sxhkd &
xset r rate 400 25 &


# Nipple and Touchpad {{{1

xinput set-prop "ImPS/2 Generic Wheel Mouse" "libinput Scroll Method Enabled" 0 0 1 &
xinput --disable 'SynPS/2 Synaptics TouchPad' &


# Text-Aid-Too {{{1

text-aid-too --editor 'alacritty -t nvim -e nvim' &


# Dockerd {{{1

sudo dockerd &


# Exec wm {{{1

exec i3
