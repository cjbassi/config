if [[ $(pactl list sinks | grep "Mute" | awk '{print $2}' | head -n 1) == 'yes' ]] ; then
    echo Muted
else
    echo -n 'Vol: '
    pactl list sinks | grep "Volume" | awk '{print $5}' | head -n 1
fi

# if amixer get PCM | grep -q off; then
#     echo Muted
# else
#     echo -n 'Vol: '
#     vol=$( amixer get PCM | sed -n '7p' | awk '{print $5}' | egrep -o '[0-9]+' )
#     vol=$(($vol - 1))
#     echo $vol%
# fi
