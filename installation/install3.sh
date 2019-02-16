#!/usr/bin/env bash

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

while [[ ! -d "config" ]]; do
   hub clone cjbassi/config
done


# zsh {{{1

source ~/config/zsh/.zshenv
setopt globdots


# Directories {{{1

mkdir -p \
    ~/Downloads \
    ~/Drive \
    ~/playground \
    ~/playground/{forks,packages,personal,school,test} \
    $XDG_CONFIG_HOME \
    $XDG_CONFIG_HOME/nvim/{backup,undo,swap} \
    $GOPATH/{bin,pkg,src} \
    $XDG_STATE_HOME/zsh \
    $XDG_DATA_HOME/tig

ln -sf $XDG_DATA_HOME/Trash/files ~/.Trash


# config files {{{1

# root {{{2

sudo ln -sf ~/config/systemd/root/* /etc/systemd/system/

sudo ln -sf ~/config/root/tmp.conf /etc/tmpfiles.d/

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

mkdir -p $XDG_CONFIG_HOME/git
ln -sf ~/config/other/gitconfig $XDG_CONFIG_HOME/git/config

mkdir -p $XDG_CONFIG_HOME/gtk-2.0
ln -sf ~/config/other/gtkrc-2.0 $XDG_CONFIG_HOME/gtk-2.0/gtkrc

mkdir -p $XDG_CONFIG_HOME/gtk-3.0
ln -sf ~/config/other/gtkrc-3.0 $XDG_CONFIG_HOME/gtk-3.0/settings.ini

mkdir -p $XDG_CONFIG_HOME/joshuto
ln -sf ~/config/joshuto/* $XDG_CONFIG_HOME/joshuto/

mkdir -p $XDG_CONFIG_HOME/npm
ln -sf ~/config/other/npmrc $XDG_CONFIG_HOME/npm/

mkdir -p $XDG_CONFIG_HOME/nvim
ln -sf ~/config/nvim/* $XDG_CONFIG_HOME/nvim/

mkdir -p $XDG_CONFIG_HOME/opensnitch
ln -sf ~/config/other/opensnitch.json $XDG_CONFIG_HOME/opensnitch/ui-config.json

mkdir -p $XDG_CONFIG_HOME/ranger
ln -sf ~/config/ranger/* $XDG_CONFIG_HOME/ranger/

mkdir -p $XDG_CONFIG_HOME/readline
ln -sf ~/config/other/inputrc $XDG_CONFIG_HOME/readline/

mkdir -p $XDG_CONFIG_HOME/rofi
ln -sf ~/config/other/rofi $XDG_CONFIG_HOME/rofi/config

mkdir -p $XDG_CONFIG_HOME/sway
ln -sf ~/config/other/sway $XDG_CONFIG_HOME/sway/config

mkdir -p $XDG_CONFIG_HOME/swaylock
ln -sf ~/config/other/swaylock $XDG_CONFIG_HOME/swaylock/config

mkdir -p $XDG_CONFIG_HOME/tig
ln -sf ~/config/other/tigrc $XDG_CONFIG_HOME/tig/

mkdir -p $XDG_CONFIG_HOME/variety
ln -sf ~/config/other/variety.conf $XDG_CONFIG_HOME/variety/

mkdir -p $XDG_CONFIG_HOME/waybar
ln -sf ~/config/waybar/* $XDG_CONFIG_HOME/waybar/

mkdir -p $XDG_CONFIG_HOME/zathura
ln -sf ~/config/other/zathurarc $XDG_CONFIG_HOME/zathura/

mkdir -p $XDG_CONFIG_HOME/zsh
ln -sf ~/config/zsh/* $XDG_CONFIG_HOME/zsh/


# rust {{{1

rustup install stable
rustup default stable

rustup install nightly

rustup component add clippy


# AUR {{{1

bash <(curl https://raw.githubusercontent.com/cjbassi/yay-installer/master/yay-installer) git

yay -R --noconfirm vi

function yay {
    command yay -S --noconfirm --needed --mflags "--nocheck" "$@"
}

yay \
    neovim-symlinks \
    pandoc-bin \
    rofi-dmenu \
    sccache-bin \
    sway-git

yay \
    cht.sh \
    discord \
    evscript-git \
    git-extras-git \
    google-chrome \
    gotop-bin \
    imgurbash2-git \
    insync \
    ncurses5-compat-libs \
    nerd-fonts-complete \
    networkmanager-dmenu \
    nvimpager-git \
    redshift-wayland-git \
    spotify \
    swaylock-blur-git \
    teiler-git \
    texlive-latexindent-meta \
    tmpreaper \
    udiskie-dmenu-git \
    vimclip-git \
    visual-studio-code-bin \
    waybar-git \
    zgen-git

# loop \


# application configuration {{{1

# nvimpager {{{2

ln -sfn $XDG_CONFIG_HOME/{nvim,nvimpager}
ln -sfn $XDG_DATA_HOME/{nvim,nvimpager}


# vscode {{{2

echo "fs.inotify.max_user_watches=524288" \
    | sudo tee /etc/sysctl.d/40-max-user-watches.conf \
    && sudo sysctl --system


# language package managers {{{1

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


TRUST="https://raw.githubusercontent.com/japaric/trust/c268696ab9f054e1092f195dddeead2420c04261/install.sh"
function trust-download { bash <(curl ${TRUST}) -f --git "$@" };
trust-download cjbassi/i3-workspace-groups
trust-download cjbassi/license-gen
trust-download cjbassi/recover-youtube-videos

# cargo install \
#     cargo-edit \
#     cargo-update \
# loop


# plugins {{{1

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +xall


# systemd {{{1

systemctl --user enable \
    blueman-applet \
    copyq \
    evscript \
    insync \
    mako \
    nm-applet \
    pasystray \
    udiskie \
    opensnitch-ui \
    recover-youtube-videos.timer \
    redshift-gtk \
    variety \
    waybar

sudo systemctl enable \
    lockscreen-on-suspend@$USER \
    reload-settings-on-wake@$USER \
    kill-sshfs-on-suspend \
    \
    NetworkManager \
    bluetooth \
    docker \
    opensnitchd

sudo systemctl mask tmp.mount  # disables tmpfs

# tlp (battery improvements)
sudo systemctl enable tlp
sudo systemctl enable tlp-sleep
sudo systemctl mask system-rfkill
sudo systemctl mask system-rfkill.socket


# Cleanup {{{1

rm -f .bash_logout .bash_profile .bashrc install3.sh .zshrc
