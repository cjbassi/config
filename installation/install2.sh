#!/usr/bin/env bash

# Configure the System {{{1

# Change mkinitcpio because of encryption {{{2

SEARCH="^HOOKS=(.*)$"
REPLACE="HOOKS=(base udev autodetect keyboard keymap consolefont modconf block encrypt filesystems fsck)"
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/mkinitcpio.conf

mkinitcpio -p linux


# Time Zone {{{2

ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
hwclock --systohc


# Locale {{{2

SEARCH="#en_US.UTF-8 UTF-8"
REPLACE="en_US.UTF-8 UTF-8"
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf


# Hostname {{{2

echo "arch" > /etc/hostname


# Passwords {{{2

while : ; do
    read -p "Please give password: " password
    read -p "Please repeat password: " password2
    [[ $password != $password2 ]] || break
    echo "Passwords do not match"
done

# Root password
echo "root:$password" | chpasswd


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

# disables computer beep
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf

# Add users {{{2

user=cjbassi

useradd -m -G wheel -s $(which zsh) $user
echo "$user:$password" | chpasswd

usermod -a -G docker $user # can run docker commands


# Enable members of 'wheel' group to use root {{{2

SEARCH="# %wheel ALL=\(ALL\) NOPASSWD: ALL"
REPLACE="%wheel ALL=\(ALL\) NOPASSWD: ALL"
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/sudoers


# Pacman settings {{{2

perl -i -pe "s/#Color/Color/g" /etc/pacman.conf
perl -i -pe "s/#TotalDownload/TotalDownload/g" /etc/pacman.conf
perl -i -pe "s/#VerbosePkgLists/VerbosePkgLists/g" /etc/pacman.conf


# Bluetooth {{{2

echo "
# automatically switch to newly-connected devices
load-module module-switch-on-connect" >> /etc/pulse/default.pa


# Compiling Optimization {{{2

# ccache
SEARCH=" \!ccache "
REPLACE=" ccache "
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/makepkg.conf

# Uses more threads for compilation
SEARCH="#MAKEFLAGS=\"-j.\""
REPLACE="MAKEFLAGS=\"-j$(nproc)\""
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/makepkg.conf

# Disables compression of packages
SEARCH="PKGEXT=\'.pkg.tar.xz\'"
REPLACE="PKGEXT=\'.pkg.tar\'"
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/makepkg.conf

# Uses more threads for compression
SEARCH="COMPRESSXZ=\(xz -c -z -\)"
REPLACE="COMPRESSXZ=(xz -c -z --threads=$(nproc))"
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/makepkg.conf


# Auto login {{{2

mkdir -p /etc/systemd/system/getty@tty1.service.d
echo "\
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin $user --noclear %I \$TERM" \
> /etc/systemd/system/getty@tty1.service.d/override.conf

# }}}


# Change to regular user {{{1

cd /home/$user
touch .zshrc
curl "https://raw.githubusercontent.com/cjbassi/config/master/installation/install3.sh" > install3.sh
su $user ./install3.sh


# Cleanup {{{1

rm -f /install2.sh
