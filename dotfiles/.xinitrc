#!/bin/bash

# Applets {{{1

nm-applet &
blueman-applet &
redshift-gtk &
insync start --synchronous-full &


# Visuals {{{1

./.fehbg &
xrandr --output eDP-1 --mode 1920x1080 --rate 60 --scale 1x1 &
# compton -b &
unclutter --timeout 1 &

# sets brightness to 50%
# echo $(($(cat /sys/class/backlight/intel_backlight/max_brightness) / 2)) | sudo tee /sys/class/backlight/intel_backlight/brightness &


# Volume {{{1

sh -c "pactl set-sink-mute 0 false ; pactl set-sink-volume 0 40%" &
pactl set-source-volume 1 100%


# Keyboard {{{1

xmodmap ~/config/peripherals/xkeys &
xbindkeys -p &
xset r rate 400 25 &


# Nipple and Touchpad {{{1

xinput set-prop "ImPS/2 Generic Wheel Mouse" "libinput Scroll Method Enabled" 0 0 1 &
xinput --disable 'SynPS/2 Synaptics TouchPad' &

# Text-Aid-Too {{{1

text-aid-too --editor 'alacritty -t nvim -e nvim' &


# Exec i3 {{{1

exec i3
