#!/usr/bin/env bash

# Partitioning
parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart primary 512MiB
parted /dev/sda -- mkpart ESP fat32 1MiB 512MiB
parted /dev/sda -- set 2 boot on

# TODO
# parted /dev/sda -- name 1 nixos
# parted /dev/sda -- name 2 boot

# Encryption
cryptsetup luksFormat /dev/disk/by-label/nixos
cryptsetup luksOpen /dev/disk/by-label/nixos crypted

# Formatting
mkfs.ext4 /dev/mapper/crypted
mkfs.fat -F 32 -n boot /dev/sda2

# Mounting
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot

# Installing
ln -s /tmp/config/configuration.nix /mnt/etc/nixos/configuration.nix
nixos-generate-config --root /mnt
nixos-install
