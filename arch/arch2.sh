rm /arch2.sh

# Time Zone
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
hwclock --systohc

# Locale
SEARCH="#en_US.UTF-8 UTF-8"
REPLACE="en_US.UTF-8 UTF-8"
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf

# Hostname
echo arch > /etc/hostname

# Network configuration
systemctl enable NetworkManager.service
#systemctl enable dhcpcd@wlp4s0.service
systemctl enable dhcpcd.service

read -p "Please give password: " password

# Root password
echo "root:$password" | chpasswd

# Boot loader
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


################################################################################
# Post-installation
################################################################################

mkdir /mnt/usb

# Add user
useradd -m -G wheel -s $(which zsh) cjbassi
echo "cjbassi:$password" | chpasswd

useradd -m -G wheel -s $(which zsh) develop
echo "develop:$password" | chpasswd

# Enable members of 'wheel' group to use root
SEARCH="# %wheel ALL=\(ALL\) NOPASSWD: ALL"
REPLACE="%wheel ALL=\(ALL\) NOPASSWD: ALL"
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/sudoers

# Edit pacman.conf
perl -i -pe "s/#Color/Color/g" /etc/pacman.conf
perl -i -pe "s/#TotalDownload/TotalDownload/g" /etc/pacman.conf
perl -i -pe "s/#VerbosePkgLists/VerbosePkgLists/g" /etc/pacman.conf


################################################################################
# Compilation Optimization
################################################################################

# ccache
SEARCH=" \!ccache "
REPLACE=" ccache "
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/makepkg.conf

# Uses more threads for compilation
SEARCH="#MAKEFLAGS=\"-j.\""
REPLACE="MAKEFLAGS=\"-j$(nproc)\""
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/makepkg.conf

# More efficient compression format
SEARCH="PKGEXT=\'.pkg.tar.xz\'"
REPLACE="PKGEXT=\'.pkg.tar.lzo\'"
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/makepkg.conf

# Uses more threads for compression
SEARCH="COMPRESSXZ=\(xz -c -z -\)"
REPLACE="COMPRESSXZ=(xz -c -z --threads=$(nproc))"
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/makepkg.conf


################################################################################
# As non root

cd /home/cjbassi/
touch .zshrc
curl https://raw.githubusercontent.com/cjbassi/config/master/arch/arch3.sh > arch3.sh
su cjbassi
