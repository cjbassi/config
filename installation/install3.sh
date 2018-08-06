#!/usr/bin/env bash

# Cleanup {{{1

rm -f install3.sh


# Directories {{{1

mkdir -p downloads
mkdir -p drive
mkdir -p .ssh
mkdir -p .config
mkdir -p ~/.config/nvim/{backup,undo,swap}
mkdir -p ~/.config/{ranger,gtk-3.0}

# go
mkdir -p ~/local/{bin,pkg,src}

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


# ranger {{{1

ranger --copy-config=scope

xdg-mime default ranger.desktop inode/directory


# Neovim {{{1

# vim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +xall


# pip {{{1

pip install --user colour-valgrind
pip install --user grip
pip install --user mypy
pip install --user pipenv
pip install --user pymath2
pip install --user rope
pip install --user tldr
pip install --user trash-cli
pip install --user wpm
pip install --user xtermcolor


# npm/yarn {{{1

yarn global add npx
yarn global add typescript


# go {{{1

go get github.com/nishanths/license
go get github.com/goreleaser/goreleaser


# rust {{{1

rustup install stable
rustup default stable


# AUR {{{1

bash -c "$(curl https://raw.githubusercontent.com/cjbassi/yay-installer/master/yay-installer.sh)"

alias yay='yay -S --noconfirm --needed --mflags "--nocheck"'

# yay alacritty-git
yay alacritty-scrollback-git
yay antigen-git
yay discord
yay gitflow-avh-git
yay google-chrome
# yay google-cloud-sdk
yay gotop-bin
# yay heroku-cli
yay i3lock-fancy-git
yay insync
yay neofetch-git
yay nerd-fonts-complete
yay osu-lazer-git
yay polybar-git
yay rmtrash
yay rofi-greenclip
# yay shutter
yay spotify
yay texlive-latexindent-meta
yay unclutter-xfixes-git
yay vim-anywhere-git
yay visual-studio-code-bin


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

# disables tmpfs
sudo systemctl mask tmp.mount
