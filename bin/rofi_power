#!/usr/bin/env python

import subprocess


def main():

    options = "Suspend\nRestart\nShutdown"

    selection = subprocess.check_output(['rofi', '-dmenu', '-i', '-p', 'Rofi_Power:'],
                                        input=options,
                                        encoding='ascii')

    selection = selection.strip()

    print(selection)

    if selection == "Suspend":
        subprocess.run(['systemctl', 'suspend'])
    elif selection == "Restart":
        subprocess.run(['shutdown', '-r', 'now'])
    elif selection == "Shutdown":
        subprocess.run(['shutdown', 'now'])


if __name__ == '__main__':
    main()
