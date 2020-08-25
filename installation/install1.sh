#!/usr/bin/env bash

# Pre-installation {{{1

# Partition
# gdisk /dev/sda
# create new partition table
# boot: 512 MiB EFI (EF00)
# root: rest is Linux filesystem (8300)

# Encrypted root partition
# cryptsetup -y -v luksFormat --type luks2 /dev/sda2
cryptsetup open /dev/sda2 cryptroot
# mkfs.ext4 /dev/mapper/cryptroot
mount /dev/mapper/cryptroot /mnt

# Boot partition
# mkfs.fat -F32 /dev/sda1
# mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

rm -rf /mnt

# Packages {{{1

pacstrap /mnt \
	base \
	base-devel \
\
	python-jedi \
	python-pylint \
	python-pytest \
	python-rope \
	python-poetry \
	twine \
	python-wheel \
	autopep8 \
	flake8 \
\
	rustup \
	rust-racer \
\
	tidy \
\
	gnome-keyring \
