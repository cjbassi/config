nm-applet &
dropbox &
blueman-applet &

sudo dhcpcd -b &

feh --bg-scale ~/Downloads/wallpaper* &

xrandr --output DVI-D-0 --mode 1920x1080 1.25 &

sh -c "pactl set-sink-mute 0 false ; pactl set-sink-volume 0 40%" &

unclutter --timeout 1 &

echo $(($(cat /sys/class/backlight/intel_backlight/max_brightness) / 2)) | sudo tee /sys/class/backlight/intel_backlight/brightness &

redshift-gtk &

xbindkeys -p &
xmodmap ~/config/peripherals/xkeys &
xcape -e '#66=Escape' &
xset r rate 250 25 &
xinput set-prop "ImPS/2 Generic Wheel Mouse" "libinput Scroll Method Enabled" 0 0 1 &
synclient TouchpadOff=1 &

compton -b --config ~/config/compton/compton.conf &
devilspie -a &

exec i3
