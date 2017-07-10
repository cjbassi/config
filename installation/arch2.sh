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
bootctl --path=esp install

echo "
default arch
#timeout 4
editor  0" > /boot/loader/loader.conf

echo "
title   Arch Linux
linux   /vmlinuz-linux
initrd  /intel-ucode.img
initrd  /initramfs-linux.img
#options root=... rw" > /boot/loader/entries/arch.conf

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

su cbassi
cd ~

mkdir Downloads

sudo pip install glances

git clone https://github.com/cjbassi/config
bash config/setup.sh
bash config/pacaur_install.sh

pacaur -y\
discord\
gitflow-avh\
gitflow-zshcompletion-avh\
google-chrome\
i3lock-color-git\
neofetch\
polybar\
unclutter-xfixes-git\
universal-ctags-git

# clone urxvt-vim-scrollback
# install vim mardown preview

#i3-gaps
#zsh-fast-syntax-highlighting
#gitflow-avh vs gitflow-avh-git
