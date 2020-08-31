#!/usr/bin/env bash

# link config folder to Drive
ln -s ~/config ~/Drive/linux/config

# link .authinfo from Drive
ln -s ~/Drive/linux/.authinfo ~/.authinfo

# link cargo-credentials from Drive
ln -s ~/Drive/linux/cargo-credentials ~/.local/share/cargo/credentials

# link .config/hub from Drive
ln -s ~/Drive/linux/hub ~/.config/hub

# link history file from Drive
mkdir -p $(dirname "$HISTFILE")
ln -sf ~/Drive/linux/history $HISTFILE

# setup .ssh folder
mkdir ~/.ssh
ln -sf ~/Drive/linux/.ssh/* ~/.ssh
chmod 700 ~/.ssh
chmod 644 ~/.ssh/id_ed25519.pub
chmod 600 ~/.ssh/id_ed25519
