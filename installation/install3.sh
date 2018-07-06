#!/usr/bin/env bash

# Cleanup {{{1

rm -f install3.sh


# Directories {{{1

mkdir -p downloads
mkdir -p drive
mkdir -p .ssh
mkdir -p .config
mkdir -p .mutt
mkdir -p ~/.config/nvim/{backup,undo,swap}
mkdir -p ~/.config/{ranger,gtk-3.0}

mkdir -p go
mkdir -p go/bin
mkdir -p go/pkg
mkdir -p go/src

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

while [[ ! -d "config" ]]; do
   hub clone cjbassi/config
done

sudo ln -sf ~/config/tmp/tmp.conf /etc/tmpfiles.d/tmp.conf

sudo ln -sf ~/config/services/* /etc/systemd/system/

sudo ln -sf ~/config/peripherals/50-mouse.conf /etc/X11/xorg.conf.d/
sudo ln -sf ~/config/peripherals/50-wacom.conf /etc/X11/xorg.conf.d/

sudo ln -sf ~/config/ranger/ranger.desktop /usr/share/applications

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
ln -sf ~/config/nvim/* ~/.config/nvim/
ln -sf ~/config/ranger/* ~/.config/ranger/
ln -sf ~/config/vscode/* ~/.config/Code/User

ln -sf ~/drive/programming/go ~/go/src/github.com/cjbassi


# ranger {{{1

ranger --copy-config=scope


# Neovim {{{1

# vim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +xall


# pip {{{1

pip install --user colour-valgrind
pip install --user grip
pip install --user pipenv
pip install --user tldr
pip install --user trash-cli
pip install --user wpm
pip install --user xtermcolor


# npm {{{1

npm install -g babel-eslint
npm install -g eslint-plugin-react

npm install -g js-beautify

npm install -g typesync

export PKG=eslint-config-airbnb
npm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs npm install -g "$PKG@latest"


# go {{{1

go get -u github.com/nishanths/license
go get github.com/goreleaser/goreleaser


# AUR {{{1

bash -c "$(curl https://raw.githubusercontent.com/cjbassi/yay-installer/master/yay-installer.sh)"

# yay -S --noconfirm alacritty-git
yay -S --noconfirm alacritty-scrollback-git
yay -S --noconfirm antigen-git
yay -S --noconfirm --mflags --nocheck discord
yay -S --noconfirm gitflow-avh-git
yay -S --noconfirm google-chrome
# yay -S --noconfirm google-cloud-sdk
yay -S --noconfirm gotop-bin
# yay -S --noconfirm heroku-cli
yay -S --noconfirm insync
yay -S --noconfirm neofetch-git
yay -S --noconfirm nerd-fonts-complete
yay -S --noconfirm rmtrash
yay -S --noconfirm rofi-greenclip
# yay -S --noconfirm shutter
yay -S --noconfirm spotify
yay -S --noconfirm unclutter-xfixes-git
yay -S --noconfirm vim-anywhere-git

yay -S --noconfirm i3lock-color-git
yay -S --noconfirm i3lock-fancy-git

yay -S --noconfirm polybar-git


# Services {{{1

sudo systemctl enable NetworkManager

sudo systemctl enable i3lock@cjbassi
sudo systemctl enable kill_sshfs@cjbassi
sudo systemctl enable monitor-detect@cjbassi

sudo systemctl enable bluetooth

sudo systemctl enable insync@cjbassi

sudo systemctl enable tlp
sudo systemctl enable tlp-sleep
sudo systemctl mask system-rfkill
sudo systemctl mask system-rfkill.socket

sudo systemctl mask tmp.mount
