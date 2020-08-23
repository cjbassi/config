#!/usr/bin/env bash

# Configure the System {{{1

# Change mkinitcpio because of encryption {{{2

SEARCH="^HOOKS=(.*)$"
REPLACE="HOOKS=(base udev autodetect keyboard keymap consolefont modconf block encrypt filesystems fsck)"
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/mkinitcpio.conf

mkinitcpio -p linux


# Boot loader {{{2

pacman -S --noconfirm intel-ucode
bootctl --path=/boot install

echo "\
default arch
editor  0" \
> /boot/loader/loader.conf

UUID=$(blkid /dev/sda2 | awk '{print $2}' | sed 's/.*"\(.*\)"/\1/')

echo "\
title   Arch Linux
linux   /vmlinuz-linux
initrd  /intel-ucode.img
initrd  /initramfs-linux.img
options cryptdevice=UUID=${UUID}:cryptroot root=/dev/mapper/cryptroot quiet rw" \
> /boot/loader/entries/arch.conf

# TODO
# options     root=PARTLABEL=ROOT rw" \

# Swap {{{2

fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

echo "\
/swapfile none swap defaults 0 0" \
>> /etc/fstab

# }}}


# Post-installation {{{1

# Auto login {{{2

mkdir -p /etc/systemd/system/getty@tty1.service.d
echo "\
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin $user --noclear %I \$TERM" \
> /etc/systemd/system/getty@tty1.service.d/override.conf
