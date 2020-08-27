#!/usr/bin/env bash

# Post-installation {{{1

# Auto login {{{2

mkdir -p /etc/systemd/system/getty@tty1.service.d
echo "\
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin $user --noclear %I \$TERM" \
> /etc/systemd/system/getty@tty1.service.d/override.conf
