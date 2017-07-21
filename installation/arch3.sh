rm -f arch3.sh

mkdir Downloads
mkdir .ssh
mkdir -p .config

git clone https://github.com/cjbassi/config

sudo ln -sf ~/config/i3lock/suspend@.service /etc/systemd/system/
systemctl enable suspend@cjbassi
systemctl enable NetworkManager.service

################################################################################
# Symlinks

mkdir -p ~/.config/ranger
ln -sf ~/config/ranger/* ~/.config/ranger/
ranger --copy-config=scope

ln -sf ~/config/i3 ~/.config/i3

ln -sf ~/config/devilspie ~/.devilspie

sudo ln -sf ~/config/peripherals/50-mouse.conf /etc/X11/xorg.conf.d/

mkdir -p ~/.vim/temp ~/.vim/undodir
if ! [[ -e ~/.vim/autoload/plug.vim ]]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

ln -sf ~/config/termite  ~/.config/termite

ln -sf ~/config/rofi ~/.config/rofi

ln -sf ~/config/powerline ~/.config/powerline

ln -sf ~/config/dotfiles/.* ~/

ln -sf ~/config/polybar ~/.config/polybar

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

sudo pip install glances

bash config/installation/pacaur.sh

pacaur -y \
    discord \
    dropbox \
    gitflow-avh \
    gitflow-zshcompletion-avh \
    google-chrome \
    i3-gaps \
    i3lock-color-git \
    neofetch \
    unclutter-xfixes-git \
    universal-ctags-git \
    zsh-fast-syntax-highlighting-git \

pacaur -y \
    polybar-git \

# lemonbar-xft-git \
# ttf-font-awesome \

echo "
###########################################
1) :PlugInstall
2) Configure pavucontrol
###########################################
"

#install vim mardown preview
#fonts
    #noto-fonts-emoji
    #ttf-symbola
    #ttf-font-awesome
    #awesome-terminal-fonts
    #fonts on bar

# git clone https://github.com/ervandew/urxvt-vim-scrollback
