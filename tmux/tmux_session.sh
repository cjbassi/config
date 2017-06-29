#!/bin/sh
tmux new -n geth geth \; \
    neww -n glances glances --tree \; \
    neww -n vim \; \
    neww -n zsh \; \
    setw -g automatic-rename off
