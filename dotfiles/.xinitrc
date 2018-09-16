#!/usr/bin/env bash

xcape &
greenclip daemon &
xsetroot -cursor_name left_ptr &
insync start --synchronous-full &
nm-applet &
blueman-applet &
# redshift-gtk &
unclutter --timeout 1 &
# ./.fehbg &
variety &
pasystray &
copyq &
dunst &
sudo dockerd &

/usr/lib/geoclue-2.0/demos/agent &
redshift-gtk &

google-chrome-stable &
spotify &
discord &

volume-control --set-volume 40 &
pactl set-source-volume 1 100% &

xinput --disable 'Synaptics TM3289-002' &

detect-monitor &

exec i3
