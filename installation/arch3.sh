rm -f arch3.sh

mkdir Downloads

cd Downloads
git clone https://github.com/rkitover/vimpager
cd vimpager
sudo make install

sudo pip install glances

git clone https://github.com/ervandew/urxvt-vim-scrollback

git clone https://github.com/cjbassi/config
bash config/installation/config_files.sh
bash config/installation/pacaur.sh

pacaur -y \
discord \
gitflow-avh \
gitflow-zshcompletion-avh \
google-chrome \
i3-gaps \
i3lock-color-git \
neofetch \
polybar \
unclutter-xfixes-git \
universal-ctags-git \
zsh-fast-syntax-highlighting-git \

echo "
###########################################
# 1) :PlugInstall
# 2) edit /boot/loader/entries/arch.conf
# 3) systemctl enable ...
# 4) Configure audio
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
