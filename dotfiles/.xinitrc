#!/usr/bin/env bash

xcape &
xsetroot -cursor_name left_ptr &  # sets pointer icon
insync start --synchronous-full &
nm-applet &
blueman-applet &
unclutter --timeout 1 &
variety &
pasystray &
copyq &
dunst &
sudo dockerd &
cerebro &

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
