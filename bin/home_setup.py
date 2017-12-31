#!/usr/bin/env python

"""
"""

import os
import subprocess

MAIN_MONITOR     = 'eDP-1'
EXTERNAL_MONITOR = 'HDMI-1'


def print_function_name(function):
    def wrapper():
        print(f"before {function.__name__}")
        function()
        print(f"after  {function.__name__}")
        print()
    return wrapper


@print_function_name
def keyboard_scripts():
    subprocess.run(['xmodmap', os.path.expanduser('~/config/peripherals/xkeys')])
    subprocess.run(['xcape'])
    subprocess.run(['xset', 'r', 'rate', '400', '25'])


@print_function_name
def wacom_scripts():
    if subprocess.check_output(['xsetwacom', '--list']):
        subprocess.run(['xsetwacom',
                        '--set', 'Wacom Intuos S Pen stylus',
                        'Area', '4100' '3500' '11100' '7438'])
        subprocess.run(['xsetwacom',
                        '--set', 'Wacom Intuos S Pen stylus',
                        'PressureCurve', '0' '100' '50' '100'])
        subprocess.run(['xsetwacom',
                        '--set', 'Wacom Intuos S Pen stylus',
                        'Threshold', '100'])


@print_function_name
def monitor_scripts():
    if f"{EXTERNAL_MONITOR} connected" in subprocess.check_output(['xrandr']).decode('utf-8'):
        subprocess.run(['xrandr',
                        '--output', EXTERNAL_MONITOR,
                        '--mode', '1920x1080',
                        '--rate', '60',
                        '--scale', '1x1'])
        subprocess.run(['xrandr',
                        '--output', MAIN_MONITOR, '--off'])
    else:
        subprocess.run(['xrandr',
                        '--output', MAIN_MONITOR,
                        '--mode', '1920x1080',
                        '--rate', '60',
                        '--scale', '1x1'])


@print_function_name
def main():
    keyboard_scripts()
    wacom_scripts()
    monitor_scripts()


if __name__ == '__main__':
    main()
