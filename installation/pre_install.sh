#!/usr/bin/env bash

wifi-menu
mount -o remount,size=2G /run/archiso/cowspace
pacman -Sy --noconfirm --force glibc git openssl libcurl-compat libidn2
git clone https://github.com/cjbassi/config
./config/installation/install1.sh
