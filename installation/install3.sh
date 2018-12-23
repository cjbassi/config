#!/usr/bin/env bash

# ssh/gpg {{{1

sudo mkdir /mnt/usb
sudo mount -L KEYS /mnt/usb

cp -r /mnt/usb/ssh ~/.ssh
chmod 700 ~/.ssh
chmod 644 ~/.ssh/id_ed25519.pub
chmod 600 ~/.ssh/id_ed25519
# chmod 600 ~/.ssh/config

gpg --import /mnt/usb/gnupg/privkey.asc

sudo umount /mnt/usb
sudo rmdir /mnt/usb


# clone repo {{{1

while [[ ! -d "config" ]]; do
   hub clone cjbassi/config
done


# zsh {{{1

source ~/config/zsh/.zshenv
source ~/config/zsh/.zshrc


# Directories {{{1

mkdir -p \
    ~/Downloads \
    ~/Drive \
    $XDG_CONFIG_HOME \
    $XDG_CONFIG_HOME/nvim/{backup,undo,swap} \
    ~/playground \
    $GOPATH/{bin,pkg,src} \
    $XDG_DATA_HOME/zsh

ln -sf $XDG_DATA_HOME/Trash/files ~/Trash


# config files {{{1

# root {{{2

sudo ln -sf ~/config/systemd/root/* /etc/systemd/system/

sudo ln -sf ~/config/root/tmp.conf /etc/tmpfiles.d/

sudo ln -sf ~/config/peripherals/50-mouse.conf /etc/X11/xorg.conf.d/
sudo ln -sf ~/config/peripherals/50-wacom.conf /etc/X11/xorg.conf.d/

sudo cp ~/config/root/blueman_policykit /etc/polkit-1/rules.d/90-blueman.rules

# regular {{{2

mkdir -p $XDG_CONFIG_HOME/systemd/user
ln -sf ~/config/systemd/user/* $XDG_CONFIG_HOME/systemd/user/

ln -sf ~/config/dotfiles/* ~/

cp -f ~/config/other/mimeapps.list $XDG_CONFIG_HOME

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


# rust {{{1

rustup install stable
rustup default stable

rustup install nightly


# AUR {{{1

bash -c "$(curl https://raw.githubusercontent.com/cjbassi/yay-installer/master/yay-installer.sh)"

command yay -S --noconfirm --needed --mflags "--nocheck --skippgpcheck" \
    neovim-symlinks \
    pandoc-bin \
    rofi-dmenu \
    sccache-bin \
    \
    cht.sh \
    copyq \
    discord \
    git-extras-git \
    git-fire-git \
    google-chrome \
    gotop-bin \
    i3lock-fancy-git \
    imgurbash2-git \
    insync \
    light \
    loop \
    mons-git \
    ncurses5-compat-libs \
    nerd-fonts-complete \
    networkmanager-dmenu \
    nvimpager-git \
    polybar-git \
    rmtrash \
    spotify \
    sway-git \
    teiler-git \
    texlive-latexindent-meta \
    tmpreaper \
    udiskie-dmenu-git \
    unclutter-xfixes-git \
    vimclip-git \
    visual-studio-code-bin \
    zgen-git


# program setup {{{1

# zgen {{{2

# zgen reset # TODO


# ranger_devicons {{{2

git clone https://github.com/alexanderjeurissen/ranger_devicons
(cd ranger_devicons; make install)
rm -rf ranger_devicons


# Neovim {{{2

# vim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +xall


# nvimpager {{{2

ln -sfn $XDG_CONFIG_HOME/{nvim,nvimpager}
ln -sfn $XDG_DATA_HOME/{nvim,nvimpager}


# sway {{{2

ln -s $XDG_CONFIG_HOME/{i3,sway}


# vscode
echo "fs.inotify.max_user_watches=524288" \
    | sudo tee /etc/sysctl.d/40-max-user-watches.conf \
    && sudo sysctl --system


# pl package managers {{{1

pip install --user \
    colour-valgrind \
    grip \
    wpm \
    xtermcolor \
    git+https://github.com/cjbassi/{pymath,random,rofi-{power,copyq,files}}

yarn global add \
    serverless \
    typesync \
    create-react-app

# go get github.com/nishanths/license
go get \
    github.com/cjbassi/license \
    github.com/goreleaser/goreleaser

# cargo install \
#     cargo-edit \
#     cargo-update \
#     i3-workspace-groups


# systemd {{{1

# mons
# variety
systemctl --user enable \
    dunst \
    redshift-gtk \
    \
    blueman-applet \
    copyq \
    insync \
    nm-applet \
    pasystray \
    polybar \
    sxhkd \
    udiskie \
    unclutter \
    xcape

sudo systemctl enable \
    i3lock@$USER \
    kill-sshfs-suspend \
    \
    NetworkManager \
    bluetooth \
    docker

sudo systemctl mask tmp.mount  # disables tmpfs

# tlp (battery improvements)
sudo systemctl enable tlp
sudo systemctl enable tlp-sleep
sudo systemctl mask system-rfkill
sudo systemctl mask system-rfkill.socket


# delete config files {{{1

rm .bash_logout .bash_profile .bashrc


# Cleanup {{{1

rm -f install3.sh
