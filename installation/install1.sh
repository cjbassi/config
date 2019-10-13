#!/usr/bin/env bash

# Pre-installation {{{1

# Update the system clock
timedatectl set-ntp true

# Partition
# gdisk /dev/sda
# create new partition table
# boot: 512 MiB EFI (EF00)
# root: rest is Linux filesystem (8300)

# Encrypted root partition
# cryptsetup -y -v luksFormat --type luks2 /dev/sda2
cryptsetup open /dev/sda2 cryptroot
# mkfs.ext4 /dev/mapper/cryptroot
mount /dev/mapper/cryptroot /mnt

# Boot partition
# mkfs.fat -F32 /dev/sda1
# mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

rm -rf /mnt

# Packages {{{1

# Update mirrorlist
curl "https://www.archlinux.org/mirrorlist/?country=US&protocol=https&ip_version=4" |
	sed -e "/#Server/s/^# *//" |
	rankmirrors - \
	> /etc/pacman.d/mirrorlist

# Sync database and update keyring
# performs a partial upgrade on the live image
pacman -Sy archlinux-keyring --noconfirm

# Install packages
pacstrap /mnt \
	base \
	base-devel \
\
	xorg \
\
	pulseaudio \
	pulseaudio-alsa \
	alsa-utils \
\
	blueman \
	pulseaudio-bluetooth \
	bluez \
	bluez-libs \
	bluez-utils \
\
	tlp \
	x86_energy_perf_policy \
	acpi_call \
	tp_smapi \
\
\
	mono \
	jdk8-openjdk \
	php \
\
	go \
	go-tools \
\
	gdb \
	valgrind \
	clang \
\
	nodejs \
	yarn \
	npm \
\
	python \
	python-pip \
	python-jedi \
	python-pylint \
	python-pytest \
	python-rope \
	poetry \
	mypy \
	twine \
	python-wheel \
	autopep8 \
	flake8 \
\
	rustup \
	cargo \
	rust-racer \
\
	astyle \
	cmake \
	tidy \
\
\
	ttf-dejavu \
	ttf-hack \
	noto-fonts-emoji \
	awesome-terminal-fonts \
	ttf-freefont \
	ttf-arphic-uming \
	ttf-indic-otf \
	adobe-source-han-sans-otc-fonts \
\
	networkmanager \
	network-manager-applet \
\
	unzip \
	zip \
	p7zip \
\
	gnome-keyring \
	libsecret \
\
	alacritty \
	bat \
	breeze-gtk \
	calibre \
	ccache \
	copyq \
	diff-so-fancy \
	docker \
	exa \
	fd \
	fish \
	fuse \
	fzf \
	gimp \
	git \
	gnupg \
	grim \
	httpie \
	hub \
	inotify-tools \
	jq \
	kdeconnect	\
	krita \
	libreoffice \
	light \
	lsof \
	mako \
	moreutils \
	ncdu \
	neofetch \
	neovim \
		python-neovim \
	openssh \
	pacman-contrib \
	pamixer \
	parted \
	pasystray \
	pavucontrol \
	perl-file-mimeinfo \
	playerctl \
	postgresql \
	pydf \
	qbittorrent \
	reflector \
	riot-desktop \
	ripgrep \
	rofi \
	rsync \
	skim \
	slurp \
	sshfs \
	strace \
	sway \
	swaybg	\
	swayidle \
	swaylock \
	sxiv \
	tig \
	time \
	tk \
	tokei \
	udiskie \
	variety \
	vlc \
	waybar	\
	wget \
	whois \
	xclip \
	xorg-xeyes \
	xsel \
	xterm \
	youtube-dl \
	zathura-pdf-mupdf

# TODO

# otf-ipafont
# ttf-hanazono
# ttf-symbola
# ttf-emojione-color
# ttf-twemoji-color
# adobe-source-han-sans-jp-fonts
# ttf-sazanami

	# redshift                        \
	#     python-gobject              \
	#     python-xdg                  \
	#     librsvg                     \


# Chroot {{{1

genfstab -U /mnt >> /mnt/etc/fstab

curl "https://raw.githubusercontent.com/cjbassi/config/master/installation/install2.sh" > /mnt/install2.sh
chmod +x /mnt/install2.sh
arch-chroot /mnt ./install2.sh
