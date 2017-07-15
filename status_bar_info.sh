# date
date '+%a %B %d %H:%M'

# battery percentage or get it from udev
cat /sys/class/power_supply/BAT0/capacity

# battery status
[[ $(cat /sys/class/power_supply/BAT0/status) = 'Charging' ]]
