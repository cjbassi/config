rm -f arch3.sh

mkdir Downloads
mkdir -p .config

git clone https://github.com/cjbassi/config

systemctl enable suspend@cbassi

################################################################################
# Symlinks

ln -sf ~/config/ranger ~/.config/ranger
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

################################################################################

cd Downloads
git clone https://github.com/rkitover/vimpager
cd vimpager
sudo make install
cd ~

sudo pip install glances
sudo pip install i3ipc

bash config/installation/pacaur.sh

pacaur -y \
    discord \
    gitflow-avh \
    gitflow-zshcompletion-avh \
    google-chrome \
    i3-gaps \
    i3lock-color-git \
    lemonbar-xft-git \
    neofetch \
    powerline-vim \
    unclutter-xfixes-git \
    universal-ctags-git \
    zsh-fast-syntax-highlighting-git \

# polybar
# ttf-font-awesome \

echo "
###########################################
1) :PlugInstall
2) Configure internet
3) Configure audio
    - set-default-source ...
    - set-default-sink ...
###########################################
"

#install vim mardown preview
#gitflow-avh vs gitflow-avh-git
#fonts
    #noto-fonts-emoji
    #ttf-symbola
    #ttf-font-awesome
    #awesome-terminal-fonts
    #fonts on bar

# git clone https://github.com/ervandew/urxvt-vim-scrollback
