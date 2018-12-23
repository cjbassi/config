#!/usr/bin/env bash

# ssh/gpg {{{1

sudo mkdir /mnt/usb
sudo mount -L KEYS /mnt/usb

cp /mnt/usb/ssh/* ~/.ssh/
chmod 700 ~/.ssh
chmod 644 ~/.ssh/id_ed25519.pub
chmod 600 ~/.ssh/id_ed25519
chmod 600 ~/.ssh/config

gpg --import /mnt/usb/gnupg/privkey.asc

sudo umount /mnt/usb
sudo rmdir /mnt/usb


# clone repo {{{1

while [[ ! -d "config" ]]; do
   hub clone cjbassi/config
done


# env variables {{{1

source ~/config/zsh/.zshenv


# Directories {{{1

mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Pictures
mkdir -p ~/Drive
mkdir -p ~/.ssh
mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_CONFIG_HOME/nvim/{backup,undo,swap}
mkdir -p ~/playground
mkdir -p $GOPATH/{bin,pkg,src}
mkdir -p $XDG_CONFIG_HOME/systemd/user

ln -sf $XDG_DATA_HOME/Trash/files ~/Trash


# symlinks {{{1

# root symlinks {{{2

sudo ln -sf ~/config/systemd/root/* /etc/systemd/system/

sudo ln -sf ~/config/root/tmp.conf /etc/tmpfiles.d/

sudo ln -sf ~/config/peripherals/50-mouse.conf /etc/X11/xorg.conf.d/
sudo ln -sf ~/config/peripherals/50-wacom.conf /etc/X11/xorg.conf.d/

sudo cp ~/config/root/blueman_policykit /etc/polkit-1/rules.d/90-blueman.rules

# user symlinks {{{2

ln -sf ~/config/systemd/user/* $XDG_CONFIG_HOME/systemd/user/

ln -sf ~/config/dotfiles/* ~/

ln -sf ~/config/other/mimeapps.list $XDG_CONFIG_HOME

mkdir -p $XDG_CONFIG_HOME/alacritty
ln -sf ~/config/other/alacritty.yml $XDG_CONFIG_HOME/alacritty/

mkdir -p $XDG_CONFIG_HOME/Code/User
ln -sfn ~/config/vscode/snippets/ $XDG_CONFIG_HOME/Code/User/snippets

mkdir -p $XDG_CONFIG_HOME/dunst
ln -sf ~/config/other/dunstrc $XDG_CONFIG_HOME/dunst/

mkdir -p $XDG_CONFIG_HOME/git
ln -sf ~/config/other/gitconfig $XDG_CONFIG_HOME/git/config

mkdir -p $XDG_CONFIG_HOME/gtk-2.0
ln -sf ~/config/other/gtkrc-2.0 $XDG_CONFIG_HOME/gtk-2.0/gtkrc

mkdir -p $XDG_CONFIG_HOME/gtk-3.0
ln -sf ~/config/other/gtkrc-3.0 $XDG_CONFIG_HOME/gtk-3.0/settings.ini

mkdir -p $XDG_CONFIG_HOME/i3
ln -sf ~/config/other/i3 $XDG_CONFIG_HOME/i3/config

mkdir -p $XDG_CONFIG_HOME/npm
ln -sf ~/config/other/npmrc $XDG_CONFIG_HOME/npm/

mkdir -p $XDG_CONFIG_HOME/nvim
ln -sf ~/config/nvim/* $XDG_CONFIG_HOME/nvim/

mkdir -p $XDG_CONFIG_HOME/polybar
ln -sf ~/config/polybar/config $XDG_CONFIG_HOME/polybar/config

mkdir -p $XDG_CONFIG_HOME/ranger
ln -sf ~/config/ranger/* $XDG_CONFIG_HOME/ranger/

mkdir -p $XDG_CONFIG_HOME/readline
ln -sf ~/config/other/inputrc $XDG_CONFIG_HOME/readline/

mkdir -p $XDG_CONFIG_HOME/rofi
ln -sf ~/config/other/rofi $XDG_CONFIG_HOME/rofi/config

mkdir -p $XDG_CONFIG_HOME/sxhkd
ln -sf ~/config/other/sxhkdrc $XDG_CONFIG_HOME/sxhkd/

mkdir -p $XDG_CONFIG_HOME/tig
ln -sf ~/config/other/tigrc $XDG_CONFIG_HOME/tig/

mkdir -p $XDG_CONFIG_HOME/variety
ln -sf ~/config/other/variety.conf $XDG_CONFIG_HOME/variety/

mkdir -p $XDG_CONFIG_HOME/X11
ln -sf ~/config/X11/* $XDG_CONFIG_HOME/X11

mkdir -p $XDG_CONFIG_HOME/zathura
ln -sf ~/config/other/zathurarc $XDG_CONFIG_HOME/zathura/

mkdir -p $XDG_CONFIG_HOME/zsh
ln -sf ~/config/zsh/* $XDG_CONFIG_HOME/zsh/


# AUR {{{1

bash -c "$(curl https://raw.githubusercontent.com/cjbassi/yay-installer/master/yay-installer.sh)"

function yay {
    command yay -S --noconfirm --needed --mflags "--nocheck --skippgpcheck" "$@"
}

yay neovim-symlinks
yay pandoc-bin
yay rofi-dmenu
yay sccache-bin

yay cht.sh
yay copyq
yay discord
yay git-extras-git
yay git-fire-git
yay google-chrome
yay gotop-bin
yay i3lock-fancy-git
yay imgurbash2-git
yay insync
yay light
yay loop
yay mons-git
yay ncurses5-compat-libs        # vscode C/C++ formatting
yay nerd-fonts-complete
yay networkmanager-dmenu
yay nvimpager-git
yay polybar-git
yay rmtrash
yay spotify
yay sway-git
yay teiler-git
yay texlive-latexindent-meta    # vscode latex formatting
yay tmpreaper
yay udiskie-dmenu-git
yay unclutter-xfixes-git
yay vimclip-git
yay visual-studio-code-bin
yay zgen-git


# one time settings {{{1 # TODO

light -S 50
pamixer -t


# zgen update

# zgen reset TODO


# ranger_devicons {{{1

git clone https://github.com/alexanderjeurissen/ranger_devicons
(cd ranger_devicons; make install)
rm -rf ranger_devicons


# rust {{{1

rustup install stable
rustup default stable

rustup install nightly


# yarn {{{1

yarn global add serverless


# Neovim {{{1

# vim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +xall


# nvimpager {{{1

ln -sfn $XDG_CONFIG_HOME/{nvim,nvimpager}
ln -sfn $XDG_DATA_HOME/{nvim,nvimpager}


# sway {{{1

ln -s $XDG_CONFIG_HOME/{i3,sway}


# vscode {{{1

echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/40-max-user-watches.conf && sudo sysctl --system


# pip {{{1

pip install --user colour-valgrind
pip install --user grip
pip install --user wpm
pip install --user xtermcolor

pip install --user git+https://github.com/cjbassi/pymath
pip install --user git+https://github.com/cjbassi/random
pip install --user git+https://github.com/cjbassi/rofi-power
pip install --user git+https://github.com/cjbassi/rofi-copyq
pip install --user git+https://github.com/cjbassi/rofi-files


# go {{{1

# go get github.com/nishanths/license
go get github.com/cjbassi/license
go get github.com/goreleaser/goreleaser


# cargo {{{1

cargo install cargo-edit
cargo install cargo-update
cargo install i3-workspace-groups


# systemd {{{1

systemctl --user enable dunst
systemctl --user enable redshift-gtk

systemctl --user enable blueman-applet
systemctl --user enable copyq
systemctl --user enable insync
# systemctl --user enable mons
systemctl --user enable nm-applet
systemctl --user enable pasystray
systemctl --user enable polybar
systemctl --user enable sxhkd
systemctl --user enable udiskie
systemctl --user enable unclutter
# systemctl --user enable variety
systemctl --user enable xcape

sudo systemctl enable i3lock@$USER
sudo systemctl enable kill-sshfs-suspend

sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
sudo systemctl enable docker

sudo systemctl mask tmp.mount  # disables tmpfs

# tlp (battery improvements)
sudo systemctl enable tlp
sudo systemctl enable tlp-sleep
sudo systemctl mask system-rfkill
sudo systemctl mask system-rfkill.socket


# Cleanup {{{1

rm -f install3.sh
