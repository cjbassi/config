################################################################################
# Pre-installation

# Verify the boot mode
#ls /sys/firmware/efi/efivars

# Conect to the internet
#ping archlinux.org

# Update the system clock
timedatectl set-ntp true

# Partition the disks
    # boot partition
        # Create a 512 MiB FAT32 partition in parted
        # Set the boot flag (not legacy_boot)
    # root partition
        # Format to ext4

# Format the partitions
#mkfs.ext4 /dev/sda1

# Mount the file systems
#mount /dev/sda1 /mnt
#mkdir /mnt/boot
#mount /dev/sda2 /mnt/boot

################################################################################
# Installation

# Select the mirrors
#cat /etc/pacman.d/mirrorlist | grep -A1 --no-group-separator "United States" | grep "Server" > /etc/pacman.d/mirrorlist

# Install packages
pacstrap /mnt \
    base base-devel xorg i3 pulseaudio pulseaudio-alsa xbindkeys parted \
    devilspie transset-df wmctrl compton urxvt-perls feh xclip \
    openssh git rxvt-unicode the_silver_searcher highlight qbittorrent \
    tig vim tmux zsh ranger vimpager fzf rofi \
    python3 jdk8-openjdk python-pip

#alsa-utils

################################################################################
# Configure the system

# Fstab
genfstab -U /mnt >> /mnt/etc/fstab

curl https://raw.githubusercontent.com/cjbassi/config/master/installation/arch2.sh > /mnt/arch2.sh

# Chroot
arch-chroot /mnt

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

# Copy keys from usb to ~/.ssh/
#git clone git@gitlab.com:cjbassi/euler
#git clone git@gitlab.com:cjbassi/school
#git clone git@gitlab.com:cjbassi/GPM
#git clone git@gitlab.com:cjbassi/scripts

################################################################################
# ssh-server

# Enable sshd daemon
#systemctl enable sshd.service

# Sets up authorized keys for remote login
#cat ~/.ssh/id_ed25519.pub >> ~/.ssh/authorized_keys

# /etc/ssh/sshd_config
#PasswordAuthentication no
#!!!!!May need to change other things!!!!!

################################################################################

# Creates key and adds it to agent
#ssh-keygen -t ed25519 -C "$(whoami)@$(hostname)-$(date -I)"
#eval $(ssh-agent)
#ssh-add ~/.ssh/id_ed25519

# Lengthens shell history
#fbcon=scrollback:64k

#ntp
# Sets time
#sudo timedatectl set-local-rtc 0
#sudo timedatectl set-timezone America/Los_Angeles
#systemctl enable ntpd.service
