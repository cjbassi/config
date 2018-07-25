#!/usr/bin/env bash

xcape &
greenclip daemon &
xsetroot -cursor_name left_ptr &

# Applets {{{2

insync start --synchronous-full &
nm-applet &
blueman-applet &
redshift-gtk &


# Visuals {{{2

./.fehbg &
unclutter --timeout 1 &


# Volume {{{2

volume-control --set-volume 40 &
pactl set-source-volume 1 100% &


# Laptop {{{2

# xinput set-prop "ImPS/2 Generic Wheel Mouse" "libinput Scroll Method Enabled" 0 0 1 &
xinput --disable 'Synaptics TM3289-002' &

monitor-script &

exec i3
