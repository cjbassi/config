if [[ $(pactl list sinks | grep "Mute" | awk '{print $2}' | head -n 1) == 'yes' ]] ; then
    echo Muted
else
    echo -n 'Vol: '
    pactl list sinks | grep "Volume" | awk '{print $5}' | head -n 1
fi
