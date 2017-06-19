################################################################################

# Select the mirrors
grep -A1 --no-group-separator "United States" /etc/pacman.d/mirrorlist | grep "Server" > ~/test

# Install packages
pacstrap /mnt base base-devel i3 \
    openssh git xterm ag highlight \
    tig vim tmux zsh ranger vimpager \
    python3 jdk8-openjdk python-pip

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

################################################################################

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

# Lengths shell history
fbcon=scrollback:64k

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
#chrome i3-gaps discord neofetch

#zsh-syntax-highlighting

################################################################################

# Creates key and adds it to agent
#ssh-keygen -t ed25519 -C "$(whoami)@$(hostname)-$(date -I)"
#eval $(ssh-agent)
#ssh-add ~/.ssh/id_ed25519
