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
mkdir -p ~/playground
mkdir -p ~/.config/variety

# go
mkdir -p ~/.local/{bin,pkg,src}

ln -sf ~/.local/share/Trash/files ~/trash


# ssh/gpg {{{1

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

sudo ln -sf ~/config/other/tmp.conf /etc/tmpfiles.d/tmp.conf

sudo ln -sf ~/config/services/* /etc/systemd/system/

sudo ln -sf ~/config/peripherals/50-mouse.conf /etc/X11/xorg.conf.d/
sudo ln -sf ~/config/peripherals/50-wacom.conf /etc/X11/xorg.conf.d/

sudo ln -sf ~/config/ranger/ranger.desktop /usr/share/applications
sudo ln -sf ~/config/other/visual-studio-code.desktop /usr/share/applications/visual-studio-code.desktop

ln -sf ~/config/dotfiles/.* ~/

ln -sf ~/config/bin ~/bin

mkdir -p ~/.config/alacritty
ln -sf ~/config/other/alacritty.yml ~/.config/alacritty/

mkdir -p ~/.config/dunst
ln -sf ~/config/other/dunstrc ~/.config/dunst/

mkdir -p ~/.config/i3
ln -sf ~/config/other/i3 ~/.config/i3/config

mkdir -p ~/.config/polybar
ln -sf ~/config/other/polybar ~/.config/polybar/config

mkdir -p ~/.config/rofi
ln -sf ~/config/other/rofi ~/.config/rofi/config

mkdir -p ~/.config/sxhkd
ln -sf ~/config/other/sxhkdrc ~/.config/sxhkd/

mkdir -p ~/.config/tig
ln -sf ~/config/other/tig ~/.config/tig/config

mkdir -p ~/.config/variety
ln -sf ~/config/other/variety.conf ~/.config/variety/

mkdir -p ~/.config/gtk-3.0
ln -sf ~/config/other/gtk-3.0 ~/.config/gtk-3.0/settings.ini

ln -sf ~/config/nvim/* ~/.config/nvim/
ln -sf ~/config/ranger/* ~/.config/ranger/

mkdir -p ~/.config/Code/User/snippets
ln -sfn ~/config/vscode/snippets ~/.config/Code/User/snippets

ln -sf ~/config/other/mimeapps.list ~/.config/

ln -sf ~/config/ranger/ranger.desktop ~/.local/share/applications

mkdir -p ~/.config/networkmanager-dmenu/
ln -sf ~/config/other/networkmanager-dmenu.ini ~/.config/networkmanager-dmenu/config.ini


# ranger {{{1

ranger --copy-config=scope

xdg-mime default ranger.desktop inode/directory


# rust {{{1

rustup install nightly
rustup default nightly


# Neovim {{{1

# vim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +xall


# vscode {{{1

echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/40-max-user-watches.conf && sudo sysctl --system


# pip {{{1

pip install --user colour-valgrind
pip install --user grip
pip install --user mypy
pip install --user pipenv
pip install --user pymath2
pip install --user pytest
pip install --user rope
pip install --user trash-cli
pip install --user twine
pip install --user wheel
pip install --user wpm
pip install --user xtermcolor

pip install --user git+https://github.com/cjbassi/random
pip install --user git+https://github.com/cjbassi/rofi-power
pip install --user git+https://github.com/cjbassi/rofi-copyq


# go {{{1

export GOPATH=~/.local
export GOBIN=$GOPATH/bin

go get github.com/nishanths/license
go get github.com/goreleaser/goreleaser


# cargo {{{1

cargo install cargo-update


# AUR {{{1

bash -c "$(curl https://raw.githubusercontent.com/cjbassi/yay-installer/master/yay-installer.sh)"

alias yay='yay -S --noconfirm --needed --mflags "--nocheck --skippgpcheck"'

yay sccache-bin

yay antigen-git
yay cargo-edit-git
yay cht.sh
yay copyq
yay discord
yay dmenu-extended-git
yay git-extras-git
yay git-fire-git
yay google-chrome
# yay google-cloud-sdk
yay gotop-bin
# yay heroku-cli
yay i3lock-fancy-git
yay imgurbash2
yay insync
yay light
yay loop
yay ncurses5-compat-libs        # for vscode C/C++ formatting
yay neofetch-git
yay nerd-fonts-complete
yay networkmanager-dmenu
# yay osu-lazer-git
yay pasystray-git
yay polybar-git
yay pulseaudio-ctl
yay rmtrash
# yay shutter
yay spotify
yay teiler-git
yay texlive-latexindent-meta    # for vscode latex formatting
yay unclutter-xfixes-git
yay visual-studio-code-bin


# Services {{{1

sudo systemctl enable NetworkManager

sudo systemctl enable i3lock@cjbassi
sudo systemctl enable kill_sshfs@cjbassi
sudo systemctl enable monitor-detect@cjbassi

sudo systemctl enable bluetooth

# tlp (battery improvements)
sudo systemctl enable tlp
sudo systemctl enable tlp-sleep
sudo systemctl mask system-rfkill
sudo systemctl mask system-rfkill.socket

sudo systemctl mask tmp.mount  # disables tmpfs

# TODO auto-login
