#!/bin/bash

LAUNCHER="rofi -dmenu -i -p Reboot?"

PROMPT="Yes\nNo"

SELECTION=`echo -e $PROMPT | $LAUNCHER | tr -d '\r\n'`

if [ $SELECTION == "Yes" ] ; then
    shutdown -r now
fi
