#!/usr/bin/env bash

# Cleanup {{{1

rm -f /install2.sh


# Configure the System {{{1

# Time Zone {{{2

ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
hwclock --systohc


# Locale {{{2

SEARCH="#en_US.UTF-8 UTF-8"
REPLACE="en_US.UTF-8 UTF-8"
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf


# Hostname {{{2

echo arch > /etc/hostname


# Passwords {{{2

read -p "Please give password: " password
read -p "Please repeat password: " password2

while [[ $password != $password2 ]] ; do
    echo "Passwords do not match"
    read -p "Please give password: " password
    read -p "Please repeat password: " password2
done

# Root password
echo "root:$password" | chpasswd


# Boot loader {{{2

pacman -S --noconfirm intel-ucode
bootctl --path=/boot install

echo "\
default arch
#timeout 4
editor  0" \
> /boot/loader/loader.conf

echo "\
title       Arch Linux
linux       /vmlinuz-linux
initrd      /intel-ucode.img
initrd      /initramfs-linux.img
options     root=PARTLABEL=ROOT rw" \
> /boot/loader/entries/arch.conf


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

mkdir /mnt/{usb,sshfs}

# sets brightness to 50%
echo $(($(cat /sys/class/backlight/intel_backlight/max_brightness) / 2)) | sudo tee /sys/class/backlight/intel_backlight/brightness

# disables computer beep
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf

# Add users {{{2

useradd -m -G wheel -s $(which zsh) cjbassi
echo "cjbassi:$password" | chpasswd

useradd -m -G wheel -s $(which zsh) develop
echo "develop:$password" | chpasswd

usermod -a -G docker cjbassi
usermod -a -G docker develop


# Enable members of 'wheel' group to use root {{{2

SEARCH="# %wheel ALL=\(ALL\) NOPASSWD: ALL"
REPLACE="%wheel ALL=\(ALL\) NOPASSWD: ALL"
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/sudoers


# Edit pacman.conf {{{2

perl -i -pe "s/#Color/Color/g" /etc/pacman.conf
perl -i -pe "s/#TotalDownload/TotalDownload/g" /etc/pacman.conf
perl -i -pe "s/#VerbosePkgLists/VerbosePkgLists/g" /etc/pacman.conf


# Bluetooth {{{2

echo '
# automatically switch to newly-connected devices
load-module module-switch-on-connect' | sudo tee -a /etc/pulse/default.pa


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

# }}}

# Change to regular user {{{1

cd /home/cjbassi
touch .zshrc
curl https://raw.githubusercontent.com/cjbassi/config/master/installation/install3.sh > install3.sh
su cjbassi ./install3.sh
