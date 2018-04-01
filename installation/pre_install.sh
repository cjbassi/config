#!/usr/bin/env bash

wifi-menu
mount -L ROOT /mnt
mount -L BOOT /mnt/boot
rm -rf /mnt
curl -L https://goo.gl/BnzNsk > install1.sh
cat install1.sh
bash install1.sh
