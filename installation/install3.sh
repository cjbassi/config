#!/usr/bin/env bash

# Cleanup {{{1

rm -f install3.sh


# Directories {{{1

mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Pictures
mkdir -p ~/drive
mkdir -p ~/.ssh
mkdir -p ~/.config
mkdir -p ~/.config/nvim/{backup,undo,swap}
mkdir -p ~/playground
mkdir -p ~/.local/{bin,pkg,src}  # go
mkdir -p ~/.config/systemd/user

ln -sf ~/.local/share/Trash/files ~/Trash


# ssh/gpg {{{1

sudo mount -L KEYS /mnt/usb  # TODO

cp /mnt/usb/ssh/* /home/cjbassi/.ssh/
chmod 700 /home/cjbassi/.ssh
chmod 644 /home/cjbassi/.ssh/id_ed25519.pub
chmod 600 /home/cjbassi/.ssh/id_ed25519
chmod 600 /home/cjbassi/.ssh/config

gpg --import /mnt/usb/gnupg/privkey.asc


# config files {{{1

# cloning {{{2

while [[ ! -d "config" ]]; do
   hub clone cjbassi/config
done

# root symlinks {{{2

sudo ln -sf ~/config/services/root/* /etc/systemd/system/

sudo ln -sf ~/config/other/tmp.conf /etc/tmpfiles.d/

sudo ln -sf ~/config/peripherals/50-mouse.conf /etc/X11/xorg.conf.d/
sudo ln -sf ~/config/peripherals/50-wacom.conf /etc/X11/xorg.conf.d/

# user symlinks {{{2

ln -sf ~/config/services/user/* ~/.config/systemd/user/

ln -sf ~/config/dotfiles/.* ~/

ln -sf ~/config/other/mimeapps.list ~/.config/

# ln -sf ~/config/desktop_files/* ~/.local/share/applications/ # TODO

mkdir -p ~/.config/alacritty
ln -sf ~/config/other/alacritty.yml ~/.config/alacritty/

# mkdir -p ~/.config/Code/User/snippets
# ln -sfn ~/config/vscode/snippets/ ~/.config/Code/User/snippets/ # TODO

mkdir -p ~/.config/dmenu-extended/config
ln -sf ~/config/other/dmenuExtended_preferences.txt ~/.config/dmenu-extended/config/

mkdir -p ~/.config/dunst
ln -sf ~/config/other/dunstrc ~/.config/dunst/

mkdir -p ~/.config/gtk-3.0
ln -sf ~/config/other/gtk-3.0 ~/.config/gtk-3.0/settings.ini

mkdir -p ~/.config/i3
ln -sf ~/config/other/i3 ~/.config/i3/config

mkdir -p ~/.config/networkmanager-dmenu
ln -sf ~/config/other/networkmanager-dmenu.ini ~/.config/networkmanager-dmenu/config.ini

mkdir -p ~/.config/nvim
ln -sf ~/config/nvim/* ~/.config/nvim/

mkdir -p ~/.config/polybar
ln -sf ~/config/polybar/config ~/.config/polybar/config

mkdir -p ~/.config/ranger
ln -sf ~/config/ranger/* ~/.config/ranger/

mkdir -p ~/.config/rofi
ln -sf ~/config/other/rofi ~/.config/rofi/config

mkdir -p ~/.config/sxhkd
ln -sf ~/config/other/sxhkdrc ~/.config/sxhkd/

mkdir -p ~/.config/tig
ln -sf ~/config/other/tig ~/.config/tig/config

mkdir -p ~/.config/variety
ln -sf ~/config/other/variety.conf ~/.config/variety/

mkdir -p ~/.config/zathura
ln -sf ~/config/other/zathurarc ~/.config/zathura/


# ranger_devicons {{{1

git clone https://github.com/alexanderjeurissen/ranger_devicons
(cd ranger_devicons; make install)
rm -rf ranger_devicons


# nvimpager {{{1

ln -s ~/.config/{nvim,nvimpager}
ln -s ~/.local/share/{nvim,nvimpager}


# ranger {{{1

# ranger --copy-config=scope # TODO


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
pip install --user rope  # TODO
pip install --user trash-cli
pip install --user twine  # for publishing to PyPI
pip install --user wheel  # TODO
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

cargo install cargo-edit
cargo install cargo-update
cargo install i3-workspace-groups


# AUR {{{1

bash -c "$(curl https://raw.githubusercontent.com/cjbassi/yay-installer/master/yay-installer.sh)"

alias yay='yay -S --noconfirm --needed --mflags "--nocheck --skippgpcheck"'

yay neovim-symlinks
yay pandoc-bin
yay rofi-dmenu
yay sccache-bin

yay antigen-git
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
yay nerd-fonts-complete
yay networkmanager-dmenu
yay nvimpager-git
# yay osu-lazer-git
yay pasystray-git
yay polybar-git
yay rmtrash
# yay shutter
yay spotify
yay teiler-git
yay texlive-latexindent-meta    # for vscode latex formatting
yay tmpreaper
yay unclutter-xfixes-git
yay vimclip-git
yay visual-studio-code-bin


# Services {{{1

systemctl --user enable dunst
systemctl --user enable redshift-gtk

systemctl --user enable blueman-applet
systemctl --user enable copyq
systemctl --user enable insync
systemctl --user enable nm-applet
systemctl --user enable pasystray
systemctl --user enable polybar
systemctl --user enable sxhkd
systemctl --user enable unclutter
systemctl --user enable variety
systemctl --user enable xcape

sudo systemctl enable i3lock@cjbassi
sudo systemctl enable kill-sshfs-suspend
# sudo systemctl enable monitor-detect@cjbassi TODO

sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
sudo systemctl enable docker

sudo systemctl mask tmp.mount  # disables tmpfs

# tlp (battery improvements)
sudo systemctl enable tlp
sudo systemctl enable tlp-sleep
sudo systemctl mask system-rfkill
sudo systemctl mask system-rfkill.socket

# TODO auto-login
