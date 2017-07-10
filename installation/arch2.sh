rm /arch2.sh

# Time Zone
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
hwclock --systohc

# Locale
FIND="en_US.UTF-8 UTF-8" ; sed -i "s/#$FIND/$FIND/g" /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf

# Hostname
echo arch > /etc/hostname

# Network configuration
#systemctl enable dhcpcd@eno1.service

# Root password
passwd

# Boot loader
pacman -S intel-ucode
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
#options     root=... rw" \
> /boot/loader/entries/arch.conf



################################################################################
# Post-installation

# Enable members of 'wheel' group to use root
FIND="%wheel ALL=(ALL) NOPASSWD: ALL" ; sed -i "s/# $FIND/$FIND/g" /etc/sudoers

# Add user
useradd -m -G wheel -s $(which zsh) cbassi
passwd cbassi

# Edit pacman.conf
sed -i "s/#Color/Color/g" /etc/pacman.conf
sed -i "s/#TotalDownload/TotalDownload/g" /etc/pacman.conf
sed -i "s/#VerbosePkgLists/VerbosePkgLists/g" /etc/pacman.conf

################################################################################
# As non root

cd /home/cbassi/
touch .zshrc
curl https://raw.githubusercontent.com/cjbassi/config/master/installation/arch3.sh > arch3.sh
su cbassi
