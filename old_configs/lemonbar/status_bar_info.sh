date() {
    date '+%a %B %d %H:%M'
}

battery() {
    cat /sys/class/power_supply/BAT0/capacity
    [[ $(cat /sys/class/power_supply/BAT0/status) = 'Charging' ]] && echo -n '+' || echo -n '-'
}

volume() {
    if [[ $(pactl list sinks | grep "Mute" | awk '{print $2}' | head -n 1) == 'yes' ]] ; then
        echo Muted
    else
        echo -n 'Vol: '
        pactl list sinks | grep "Volume" | awk '{print $5}' | head -n 1
    fi
}
ram() {
    free | sed -n 2p | awk '{printf("%2d%", (1-$7/$2)*100)}'
}

while :; do
    buf=""
    buf="$buf $(battery) $(volume)"

    echo $buf
    sleep 1
done
