#!/usr/bin/env bash

light -S 50

ln -s ~/config ~/Drive/linux/config

cp -f ~/Drive/linux/history $XDG_DATA_HOME/fish/fish_history

ln -sf ~/Drive/linux/.ssh/config ~/.ssh/
