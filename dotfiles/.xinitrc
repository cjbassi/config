#!/usr/bin/env bash

# https://daniel.perez.sh/blog/2018/user-systemd/
systemctl --user import-environment DISPLAY XAUTHORITY
systemctl --user start user-applications.target

pamixer --set-volume 40 &
pamixer --default-source --set-volume 100 &

xsetroot -cursor_name left_ptr &  # sets pointer icon

xinput --disable 'Synaptics TM3289-002' &

bash -c "$SOURCE_ALIASES; select-display" &

# google-chrome-stable &
# spotify &
# discord &
# alacritty -e pymath &

exec i3
