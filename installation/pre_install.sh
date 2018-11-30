#!/usr/bin/env bash

wifi-menu
mount -o remount,size=2G /run/archiso/cowspace
pacman -Sy glibc git
git clone https://github.com/cjbassi/config
bash config/installation/install1.sh
