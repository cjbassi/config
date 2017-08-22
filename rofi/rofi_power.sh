#!/bin/bash

LAUNCHER="rofi -dmenu -i -p Reboot?"

PROMPT="Yes\nNo"

SELECTION=`echo -e $PROMPT | $LAUNCHER | tr -d '\r\n'`

if [ $SELECTION == "Yes" ] ; then
    shutdown -r now
fi

# if [ ${#option} -gt 0 ] ; then
#     case $option in
#         Lock)
#             $LOCKER
#             ;;
#         Exit)
#             # pkill lemonbar
#             i3-msg exit
#             ;;
#         Log-off)
#             ;;
#         Reboot)
#             # close_apps
#             # if [[ $(echo -e $PROMPT | $SHUTDOWN | tr -d '\r\n') == 'Yes' ]] ; then
#             shutdown -r now
#             # fi
#             ;;
#         Shutdown)
#             # close_apps
#             # if [[ $(echo -e $PROMPT | $SHUTDOWN | tr -d '\r\n') == 'Yes' ]] ; then
#             shutdown now
#             # fi
#             ;;
#         Suspend)
#             $LOCKER
#             systemctl suspend
#             ;;
#         Hibernate)
#             $LOCKER
#             systemctl hibernate
#             ;;
#         *)
#             ;;
#     esac
# fi

# OPTIONS="Yes\nNo"
# OPTIONS="Lock\nExit i3\nReboot\nShutdown"
# Log-off, Suspend, Hibernate

# LOCKER="/home/cjbassi/config/i3lock/i3lock"

# close_apps(){
#     wmctrl -l | awk '{print $1}' | while read APP; do
#         wmctrl -i -c $APP || echo "$APP not killed"
#     done
# }

# SHUTDOWN='rofi -dmenu -i -p Applications_closed?'

# SELECTION=`echo -e $PROMPT | $LAUNCHER | awk '{print $1}' | tr -d '\r\n'`
