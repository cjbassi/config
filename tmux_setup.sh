#!/bin/sh
tmux new -n geth geth \; \
    neww -n glances glances -1 --tree --disable-memswap --disable-alert --process-short-name --byte \; \
    neww -n vim \; \
    neww -n zsh \;
