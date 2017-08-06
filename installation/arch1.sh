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
cat /etc/pacman.d/mirrorlist | grep -A1 --no-group-separator "United States" | grep "Server" > /etc/pacman.d/mirrorlist

# Install packages
pacstrap /mnt \
    base base-devel \
    xorg xorg-xinit \
    pulseaudio pulseaudio-alsa pavucontrol \
    alsa-utils \
    blueman pulseaudio-bluetooth bluez bluez-libs bluez-utils \
    xbindkeys xclip xcape \
    redshift python-gobject python-xdg librsvg \
    devilspie transset-df \
    python jdk8-openjdk python-pip xdotool gdb go nodejs npm \
    powerline-fonts ttf-dejavu ttf-symbola awesome-terminal-fonts \
    termite neovim zsh \
    ranger highlight w3m \
    the_silver_searcher \
    networkmanager network-manager-applet \
    gnome-keyring libsecret \
    gnupg \
    git tig \
    rofi \
    openssh \
    qbittorrent \
    compton \
    feh \
    parted \
    scrot \

#wmctrl \
#tmux
#ttf-insonsolata
#alsa-utils
#vimpager
#dialog wpa_supplicant \
#urxvt-perls rxvt-unicode \

################################################################################
# Configure the system

# Fstab
genfstab -U /mnt >> /mnt/etc/fstab

curl https://raw.githubusercontent.com/cjbassi/config/master/installation/arch2.sh > /mnt/arch2.sh

# Chroot
arch-chroot /mnt

################################################################################

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
