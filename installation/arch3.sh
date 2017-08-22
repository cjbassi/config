rm -f arch3.sh

# Directories
mkdir -p Downloads
mkdir -p .ssh
mkdir -p .config
mkdir -p ~/.config/nvim/{backup,undo,swap}

# ssh keys
sudo mount -L KEYS /mnt/usb
cp /mnt/usb/ssh/* /home/cjbassi/.ssh/
chmod 700 /home/cjbassi/.ssh
chmod 600 /home/cjbassi/.ssh/id_ed25519
chmod 644 /home/cjbassi/.ssh/id_ed25519.pub
chmod -x /home/cjbassi/.ssh/known_hosts

git clone git@github.com:cjbassi/config

################################################################################
# Symlinks

ln -sf ~/config/devilspie ~/.devilspie

ln -sf ~/config/dotfiles/.* ~/

ln -sf ~/config/i3 ~/.config/i3

sudo ln -sf ~/config/i3lock/suspend@.service /etc/systemd/system/

ln -sf ~/config/nvim/* ~/.config/nvim/

sudo ln -sf ~/config/peripherals/50-mouse.conf /etc/X11/xorg.conf.d/

ln -sf ~/config/polybar ~/.config/polybar

mkdir -p ~/.config/ranger
ln -sf ~/config/ranger/* ~/.config/ranger/
ranger --copy-config=scope

ln -sf ~/config/rofi ~/.config/rofi

ln -sf ~/config/termite  ~/.config/termite

################################################################################

# TODO
# sudo systemctl enable suspend@cjbassi

# vim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo '
# automatically switch to newly-connected devices
load-module module-switch-on-connect' | sudo tee -a /etc/pulse/default.pa

################################################################################

cd Downloads
git clone https://github.com/rkitover/vimpager
cd vimpager
sudo make install
cd ..
rm -rf vimpager
cd ~

cd Downloads
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts
cd ~

################################################################################

sudo pip install glances
# sudo npm install -g livedown TODO
sudo pip3 install --upgrade neovim

################################################################################

bash ~/config/installation/pacaur.sh

export EDITOR=nvim
gpg --recv-keys 5FAF0A6EE7371805

pacaur -S --noconfirm --noedit discord
pacaur -S --noconfirm --noedit dropbox
pacaur -S --noconfirm --noedit google-chrome
pacaur -S --noconfirm --noedit neofetch
pacaur -S --noconfirm --noedit unclutter-xfixes-git
pacaur -S --noconfirm --noedit universal-ctags-git
pacaur -S --noconfirm --noedit zsh-fast-syntax-highlighting-git

pacaur -S --noconfirm --noedit neomutt
pacaur -S --noconfirm --noedit neomutt

pacaur -S --noconfirm --noedit i3-gaps
pacaur -S --noconfirm --noedit i3lock-color-git

pacaur -S --noconfirm --noedit gitflow-avh
pacaur -S --noconfirm --noedit gitflow-zshcompletion-avh

pacaur -S --noconfirm --noedit polybar-git

################################################################################

echo "
###########################################
1) wifi and mutt symlink setup
2) Bluetooth
3) pavucontrol
    mic volume to 100
4) :PlugInstall
6) symlink config directory
###########################################
"

#fonts
    #noto-fonts-emoji
    #ttf-symbola
    #ttf-font-awesome
    #awesome-terminal-fonts
    #fonts on bar
