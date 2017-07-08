#!/bin/bash

OPTIONS="Lock i3\nExit i3\nReboot\nShutdown"
# Log-off, Suspend, Hibernate

LAUNCHER="rofi -dmenu -i -p rofi-power:"
LOCKER="/home/cbassi/config/wm/i3lock"

close_apps(){
    wmctrl -l | awk '{print $1}' | while read APP; do
        wmctrl -i -c $APP || echo "$APP not killed"
    done
}

PROMPT="Yes\nNo"
SHUTDOWN='rofi -dmenu -i -p Applications_closed?'

option=`echo -e $OPTIONS | $LAUNCHER | awk '{print $1}' | tr -d '\r\n'`
if [ ${#option} -gt 0 ] ; then
    case $option in
        Lock)
            $LOCKER
            ;;
        Exit)
            i3-msg exit
            ;;
        Log-off)
            ;;
        Reboot)
            # close_apps
            # if [[ $(echo -e $PROMPT | $SHUTDOWN | tr -d '\r\n') == 'Yes' ]] ; then
                shutdown -r now
            # fi
            ;;
        Shutdown)
            # close_apps
            # if [[ $(echo -e $PROMPT | $SHUTDOWN | tr -d '\r\n') == 'Yes' ]] ; then
                shutdown now
            # fi
            ;;
        Suspend)
            $LOCKER
            systemctl suspend
            ;;
        Hibernate)
            $LOCKER
            systemctl hibernate
            ;;
        *)
            ;;
    esac
fi
