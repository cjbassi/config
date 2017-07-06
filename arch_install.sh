################################################################################
# Pre-installation

# Verify the boot mode
ls /sys/firmware/efi/efivars

# Conect to the internet
ping archlinux.org

# Update the system clock
timedatectl set-ntp true

# Partition the disks
    # boot partition
        # Create a 512 MiB FAT32 partition in Parted
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
grep -A1 --no-group-separator "United States" /etc/pacman.d/mirrorlist | grep "Server" > /etc/pacman.d/mirrorlist

# Install packages
pacstrap /mnt \
    base base-devel xorg i3 alsa-utils pulseaudio xbindkeys \
    openssh git urxvt ag highlight qbittorrent maim \
    tig vim tmux zsh ranger vimpager fzf rofi \
    python3 jdk8-openjdk python-pip

# devilspie
# transset-df
# wmctrl
# compton
# urxvt-perls
# feh
# i3 lock
# xclip

################################################################################
# Configure the system

# Fstab
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot
arch-chroot /mnt

# Time Zone
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
hwclock --systohc

# Locale
FIND="n_US.UTF-8 UTF-8" ; sed -i "s/#$FIND/$FIND/g" /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf

# Hostname
echo arch > /etc/hostname

# Network configuration
systemctl enable dhcpcd@eno1.service

# Root password
passwd

# Boot loader
    # An EFI System Partition is needed for the boot partition
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
pacman -S intel-ucode # For intel CPU's
grub-mkconfig -o /boot/grub/grub.cfg

# Get grub to list windows TODO

################################################################################
# Post-installation

# Enable members of 'wheel' group to use root
FIND="%wheel ALL=(ALL) NOPASSWD: ALL" ; sed -i "s/# $FIND/$FIND/g" /etc/sudoers

# Add user
useradd -m -G wheel -s $(which zsh) cbassi
passwd cbassi

# Enable sshd daemon
systemctl enable sshd.service

# Edit pacman.conf
sed -i "s/#Color/Color/g" /etc/pacman.conf
sed -i "s/#TotalDownload/TotalDownload/g" /etc/pacman.conf
sed -i "s/#VerbosePkgLists/VerbosePkgLists/g" /etc/pacman.conf

su cbassi
cd ~
mkdir Downloads
pip install glances
git clone git@gitlab.com:calebjbassi/{config,euler,school,GPM,scripts}.git
bash config/config_script.sh

# Lengthens shell history
fbcon=scrollback:64k

# clone urxvt-vim-scrollback

################################################################################

# Copy keys from usb to ~/.ssh/

# Sets up authorized keys for remote login
#cat ~/.ssh/id_ed25519.pub >> ~/.ssh/authorized_keys

#ntp
# Sets time
#sudo timedatectl set-local-rtc 0
#sudo timedatectl set-timezone America/Los_Angeles
#systemctl enable ntpd.service

# /etc/ssh/sshd_config
#PasswordAuthentication no
#!!!!!May need to change other things!!!!!

# Install using AUR
#chrome i3-gaps discord neofetch pacaur gitflow-avh gitflow-zshcompletion-avh polybar
# google-play-music-desktop-player-bin

#zsh-syntax-highlighting

################################################################################

# Creates key and adds it to agent
#ssh-keygen -t ed25519 -C "$(whoami)@$(hostname)-$(date -I)"
#eval $(ssh-agent)
#ssh-add ~/.ssh/id_ed25519
