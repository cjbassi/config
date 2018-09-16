#!/usr/bin/env bash

file=/sys/class/backlight/intel_backlight/brightness

print_brightness() {
    printf "%.0f%%\n" $(light)
}

monitor() {
    print_brightness
    inotifywait -q -m -e modify $file |
        while read p _ f; do
            print_brightness
        done
}

monitor
