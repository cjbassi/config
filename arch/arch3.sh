#!/bin/bash

# Cleanup {{{1

rm -f arch3.sh


# Directories {{{1

mkdir -p downloads
mkdir -p drive
mkdir -p .ssh
mkdir -p .config
mkdir -p .mutt
mkdir -p ~/.config/nvim/{backup,undo,swap}
mkdir -p ~/.config/{ranger,ncmpcpp,gtk-3.0}
mkdir -p temp
mkdir -p public_html

ln -sf ~/.local/share/Trash/files ~/trash


# Keys {{{1

sudo mount -L KEYS /mnt/usb

cp /mnt/usb/ssh/* /home/cjbassi/.ssh/

chmod 700 /home/cjbassi/.ssh

chmod 644 /home/cjbassi/.ssh/id_ed25519.pub
chmod 600 /home/cjbassi/.ssh/id_ed25519
# chmod 600 /home/cjbassi/.ssh/known_hosts
chmod 600 /home/cjbassi/.ssh/config

gpg --import /mnt/usb/gnupg/privkey.asc


# Config {{{1

hub clone cjbassi/config

# symlinks {{{2

sudo ln -sf ~/config/i3lock/suspend@.service /etc/systemd/system/

sudo ln -sf ~/config/peripherals/50-mouse.conf /etc/X11/xorg.conf.d/
sudo ln -sf ~/config/peripherals/50-wacom.conf /etc/X11/xorg.conf.d/

ln -sf ~/config/dotfiles/.* ~/

ln -sf ~/config/bin ~/bin

ln -sf ~/config/mutt/* ~/.mutt/

ln -sf ~/{,.}config/alacritty
ln -sf ~/{,.}config/i3
ln -sf ~/{,.}config/polybar
ln -sf ~/{,.}config/rofi
ln -sf ~/{,.}config/sxhkd
ln -sf ~/{,.}config/tig

ln -sf ~/config/gtk-3.0/* ~/.config/gtk-3.0/
ln -sf ~/config/ncmpcpp/* ~/.config/ncmpcpp/
ln -sf ~/config/nvim/* ~/.config/nvim/
ln -sf ~/config/ranger/* ~/.config/ranger/

# }}}

# Neovim {{{1

# vim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +xall


# pip and npm {{{1

sudo pip install colour-valgrind
sudo pip install glances
sudo pip install --upgrade neovim
sudo pip install pipenv
sudo pip install tldr
sudo pip install trash-cli
# sudo pip install xtermcolor

sudo npm install -g coffee-script
sudo npm install -g text-aid-too

sudo npm install -g babel-eslint
sudo npm install -g create-react-app
sudo npm install -g eslint-plugin-react
sudo npm install -g js-beautify

# sudo npm install -g eslint-config-airbnb
# sudo npm install -g eslint-config-google
# sudo npm install -g eslint-config-standard
# sudo npm install -g eslint-config-xo

export PKG=eslint-config-airbnb
npm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs sudo npm install -g "$PKG@latest"

sudo npm install -g gtop
sudo npm install -g vtop


# AUR {{{1

bash ~/config/arch/pacaur.sh

export EDITOR=nvim

pacaur -S --noconfirm --noedit alacritty-git
pacaur -S --noconfirm --noedit antigen-git
# pacaur -S --noconfirm --noedit discord
# pacaur -S --noconfirm --noedit dropbox
pacaur -S --noconfirm --noedit gitflow-avh-git
pacaur -S --noconfirm --noedit google-chrome
# pacaur -S --noconfirm --noedit google-cloud-sdk
# pacaur -S --noconfirm --noedit heroku-cli
pacaur -S --noconfirm --noedit insync
pacaur -S --noconfirm --noedit neofetch-git
pacaur -S --noconfirm --noedit nerd-fonts-complete
pacaur -S --noconfirm --noedit pymodoro-git
pacaur -S --noconfirm --noedit unclutter-xfixes-git

pacaur -S --noconfirm --noedit i3lock-color-git

pacaur -S --noconfirm --noedit polybar-git


# Services {{{1

sudo systemctl enable NetworkManager

sudo systemctl enable suspend@cjbassi

sudo systemctl enable bluetooth

sudo systemctl enable insync@cjbassi

sudo systemctl enable tlp
sudo systemctl enable tlp-sleep
sudo systemctl mask system-rfkill
sudo systemctl mask system-rfkill.socket
