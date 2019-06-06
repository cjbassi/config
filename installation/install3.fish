#!/usr/bin/env fish

setopt globdots

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

while not test -d ~/config
   hub clone cjbassi/config
end

source ~/config/other/shell/env.fish

# Directories {{{1

mkdir -p \
    ~/Downloads \
    ~/Drive \
    ~/playground \
    ~/playground/{my-projects,other-projects,packages,school,test} \
    $XDG_CONFIG_HOME \
    $XDG_STATE_HOME/nvim/{backup,undo,swap} \
    $GOPATH/{bin,pkg,src} \
    $XDG_DATA_HOME/fish \
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

mkdir -p ~/.local/share/applications/
ln -sf ~/{config/,}.local/share/applications/alacritty.desktop

# .config {{{3

cp -f ~/config/.config/mimeapps.list $XDG_CONFIG_HOME

function symlink-dot-config
    mkdir -p ~/.config/$args
    ln -sf ~/config/.config/$args/* ~/.config/$args
end

symlink-dot-config alacritty
symlink-dot-config Code/User
symlink-dot-config fish
symlink-dot-config git
symlink-dot-config gtk-2.0
symlink-dot-config gtk-3.0
symlink-dot-config npm
symlink-dot-config nvim
symlink-dot-config opensnitch
symlink-dot-config readline
symlink-dot-config rofi
symlink-dot-config sway
symlink-dot-config swaylock
symlink-dot-config tig
symlink-dot-config variety
symlink-dot-config waybar
symlink-dot-config zathura


# rust {{{1

rustup install stable
rustup default stable

rustup install nightly

rustup component add clippy


# AUR {{{1

bash <(curl https://raw.githubusercontent.com/cjbassi/yay-installer/master/yay-installer) bin

yay -R --noconfirm vi

function yay
    command yay -S --noconfirm --needed --mflags "--nocheck" $args
end

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
    fundle-git \
    git-extras-git \
    google-chrome \
    gotop-bin \
    imgurbash2-git \
    insync \
    ncurses5-compat-libs \
    nerd-fonts-complete \
    network-manager-applet-indicator \
    networkmanager-dmenu \
    nvimpager-git \
    redshift-wayland-git \
    spotify \
    swaybg-git \
    swaylock-blur-bin \
    teiler-git \
    texlive-latexindent-meta \
    tmpreaper \
    udiskie-dmenu-git \
    vimclip-git \
    visual-studio-code-bin \
    waybar-git

# TODO
# loop
# opensnitch-git


# application configuration {{{1

# nvimpager {{{2

ln -sfn $XDG_CONFIG_HOME/{nvim,nvimpager}
ln -sfn $XDG_DATA_HOME/{nvim,nvimpager}


# vscode {{{2

echo "fs.inotify.max_user_watches=524288" \
    | sudo tee /etc/sysctl.d/40-max-user-watches.conf \
    && sudo sysctl --system

~/config/installation/vscode-extensions.sh


# package managers {{{1

fundle install

pip install --user \
    colour-valgrind \
    grip \
    wpm \
    xtermcolor \
    git+https://github.com/cjbassi/{pymath,rofi-{power,copyq,files}}

yarn global add \
    serverless \
    typesync \
    create-react-app

set -l trust_install_url "https://raw.githubusercontent.com/japaric/trust/c268696ab9f054e1092f195dddeead2420c04261/install.sh"
function trust-download
    bash <(curl $trust_install_url) -f --git $args
end
trust-download cjbassi/batch-rename
trust-download cjbassi/i3-workspace-groups
trust-download cjbassi/license-gen
trust-download cjbassi/random
trust-download cjbassi/recover-youtube-videos
trust-download cjbassi/sway-utils
trust-download cjbassi/trash-man

# TODO
# cargo install \
#     cargo-edit \
#     cargo-update \
# loop
# cargo-release


# neovim {{{1

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +xall


# systemd {{{1

systemctl --user enable \
    blueman-applet \
    copyq \
    discord \
    evscript \
    insync \
    mako \
    nm-applet \
    opensnitch-ui \
    pasystray \
    recover-youtube-videos.timer \
    redshift-gtk \
    riot-desktop \
    swayidle \
    udiskie \
    variety \
    waybar

sudo systemctl enable \
    kill-sshfs-on-suspend \
    lockscreen-on-suspend@$USER \
    reload-settings-on-wake@$USER \
    \
    bluetooth \
    docker \
    NetworkManager \
    opensnitchd \
    systemd-timesyncd

sudo systemctl mask tmp.mount  # disables tmpfs

# tlp (battery improvements)
sudo systemctl enable tlp
sudo systemctl enable tlp-sleep
sudo systemctl mask system-rfkill
sudo systemctl mask system-rfkill.socket


# Cleanup {{{1

rm -f .bash_logout .bash_profile .bashrc install3.fish
