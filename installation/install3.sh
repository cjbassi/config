#!/usr/bin/env bash

shopt -s dotglob

# keys {{{1

sudo mkdir /mnt/usb
sudo mount -L KEYS /mnt/usb

cp -r /mnt/usb/ssh ~/.ssh
chmod 700 ~/.ssh
chmod 644 ~/.ssh/id_ed25519.pub
chmod 600 ~/.ssh/id_ed25519

sudo umount /mnt/usb
sudo rmdir /mnt/usb


# clone repo {{{1

while [[ ! -d "~/config" ]]; do
	hub clone cjbassi/config
done


# source env {{{1

source ~/config/shell/env.sh


# Directories {{{1

mkdir -p \
	~/Downloads \
	~/Drive \
	~/projects \
	~/projects/{mine,other} \
	$XDG_CONFIG_HOME


# config files {{{1

# regular {{{2

mkdir -p $XDG_CONFIG_HOME/systemd/user
ln -sf ~/config/systemd/user/* $XDG_CONFIG_HOME/systemd/user/

# AUR {{{1

yay \
	rofi-dmenu \

yay \
	evscript-git \
	ncurses5-compat-libs \
	nerd-fonts-complete \
	network-manager-applet-indicator \
	python-pipx \
	raven-reader-bin \
	swaylock-blur-bin \
	teiler-git \
	texlive-latexindent-meta \
	tmpreaper \
	udiskie-dmenu-git \

# TODO
# opensnitch-git


# application configuration {{{1

# spacemacs {{{1

git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d

# package managers {{{1

pipx install colour-valgrind
pipx install --spec git+https://github.com/cjbassi/rofi-power rofi-power
pipx install --spec git+https://github.com/cjbassi/rofi-copyq rofi-copyq
pipx install --spec git+https://github.com/cjbassi/rofi-files rofi-files

yarn global add \
	typesync \
	create-react-app

trust_install_url="https://raw.githubusercontent.com/japaric/trust/c268696ab9f054e1092f195dddeead2420c04261/install.sh"
function trust-download {
	bash <(curl $trust_install_url) -f --git "$@"
}
trust-download cjbassi/batch-rename
trust-download cjbassi/license-gen
trust-download cjbassi/sway-utils
trust-download cjbassi/trash-cli

# TODO
# cargo-tree


# systemd {{{1

systemctl --user enable \
	evscript \
	insync \
	opensnitch-ui \
	swayidle \
	variety

sudo systemctl enable \
	lockscreen-on-suspend@$USER \
	reload-settings-on-wake@$USER \
	\
	opensnitchd

# Cleanup {{{1

rm -f .bash_logout .bash_profile .bashrc install3.sh
