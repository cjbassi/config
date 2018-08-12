#!/usr/bin/env bash

xcape &
greenclip daemon &
xsetroot -cursor_name left_ptr &
insync start --synchronous-full &
nm-applet &
blueman-applet &
redshift-gtk &
unclutter --timeout 1 &
# ./.fehbg &
variety &

discord &
spotify &
google-chrome-stable &

volume-control --set-volume 40 &
pactl set-source-volume 1 100% &

xinput --disable 'Synaptics TM3289-002' &

monitor-script &

exec i3
