rm -f arch3.sh

# Directories
mkdir -p Downloads
mkdir -p .ssh
mkdir -p .config
mkdir -p ~/.config/nvim/{backup,undo,swap}

read

# ssh keys
sudo mount -L KEYS /mnt/usb
cp /mnt/usb/ssh/* /home/cjbassi/.ssh/
chmod 700 /home/cjbassi/.ssh
chmod 600 /home/cjbassi/.ssh/id_ed25519
chmod 644 /home/cjbassi/.ssh/id_ed25519.pub

git clone git@github.com:cjbassi/config

read

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

read

################################################################################

systemctl enable suspend@cjbassi

read

# vim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
read

cd Downloads
git clone https://github.com/rkitover/vimpager
cd vimpager
sudo make install
cd ..
rm -rf vimpager
cd ~

read

cd Downloads
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts
cd ~

read

sudo pip install glances
read
sudo npm install -g livedown
read

bash ~/config/installation/pacaur.sh
read

pacaur -y \
    discord \
    dropbox \
    gitflow-avh \
    google-chrome \
    i3-gaps \
    i3ipc-glib-git \
    i3lock-color-git \
    neofetch \
    neomutt \
    unclutter-xfixes-git \
    universal-ctags-git \
    zsh-fast-syntax-highlighting-git \
    
read

pacaur -y \
    gitflow-zshcompletion-avh \
    polybar-git \

# lemonbar-xft-git \
# ttf-font-awesome \

echo "
###########################################
1) :PlugInstall
2) Configure pavucontrol
###########################################
"

#fonts
    #noto-fonts-emoji
    #ttf-symbola
    #ttf-font-awesome
    #awesome-terminal-fonts
    #fonts on bar
