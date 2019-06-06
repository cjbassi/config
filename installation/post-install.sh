#!/usr/bin/env bash

light -S 50

ln -s ~/config ~/Drive/linux/config

cp -f ~/Drive/linux/history $HISTFILE

ln -sf ~/Drive/linux/.ssh/config ~/.ssh/
