#!/usr/bin/sh

# applets
nm-applet &
dropbox &
blueman-applet &
redshift-gtk &

# visuals
feh --bg-scale ~/Downloads/wallpaper* &
xrandr --output eDP-1 --mode 1920x1080 --scale 1x1 &
compton -b &
unclutter --timeout 1 &

# sets volume to 40% and mutes on startup
sh -c "pactl set-sink-mute 0 false ; pactl set-sink-volume 0 40%" &
pactl set-source-volume 1 100%

# sets brightness to 50%
echo $(($(cat /sys/class/backlight/intel_backlight/max_brightness) / 2)) | sudo tee /sys/class/backlight/intel_backlight/brightness &

# keyboard
xmodmap ~/config/peripherals/xkeys &
xcape -t 300 &
xbindkeys -p &
xset r rate 400 25 &

# nipple and keypad
xinput set-prop "ImPS/2 Generic Wheel Mouse" "libinput Scroll Method Enabled" 0 0 1 &
xinput --disable 'SynPS/2 Synaptics TouchPad' &

text-aid-too --editor 'alacritty -t nvim -e nvim' &

exec i3


# TODO
# xcape -e '#66=Escape' &
# pkill xcape &

# synclient TouchpadOff=1 &

# devilspie -a &
