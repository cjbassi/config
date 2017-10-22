rm -f arch3.sh

# Directories {{{1

mkdir -p Downloads
mkdir -p .ssh
mkdir -p .config
mkdir -p .mutt
mkdir -p ~/.config/nvim/{backup,undo,swap}
mkdir -p ~/.config/{ranger,ncmpcpp}
mkdir -p test
mkdir -p public_html


# keys {{{1

sudo mount -L KEYS /mnt/usb

cp /mnt/usb/ssh/* /home/cjbassi/.ssh/

chmod 700 /home/cjbassi/.ssh

chmod 644 /home/cjbassi/.ssh/id_ed25519.pub
chmod 600 /home/cjbassi/.ssh/id_ed25519
# chmod 600 /home/cjbassi/.ssh/known_hosts
chmod 600 /home/cjbassi/.ssh/config

gpg --import /mnt/usb/gnupg/privkey.asc


# config {{{1

git clone git@github.com:cjbassi/config

ranger --copy-config=scope

# TODO
# try safepipe highlight --config-file=/home/cjbassi/config/highlight/custom-solarized-dark.theme -s custom-solarized-dark --out-format=${highlight_format} "$path" && { dump | trim; exit 5; }


# symlinks {{{2

sudo ln -sf ~/config/i3lock/suspend@.service /etc/systemd/system/

sudo ln -sf ~/config/peripherals/50-mouse.conf /etc/X11/xorg.conf.d/
sudo ln -sf ~/config/peripherals/50-wacom.conf /etc/X11/xorg.conf.d/

ln -sf ~/{,.}config/alacritty

ln -sf ~/config/compton/compton.conf ~/.config/

ln -sf ~/config/dotfiles/.* ~/

ln -sf ~/{,.}config/i3

ln -sf ~/config/mutt/* ~/.mutt/

ln -sf ~/config/ncmpcpp/* ~/.config/ncmpcpp/

ln -sf ~/config/nvim/* ~/.config/nvim/

ln -sf ~/{,.}config/polybar

ln -sf ~/config/ranger/* ~/.config/ranger/

ln -sf ~/{,.}config/rofi


# Services {{{1

sudo systemctl enable NetworkManager.service

sudo systemctl enable suspend@cjbassi

sudo systemctl enable bluetooth


# pip and npm {{{1

sudo pip install glances

sudo pip install --upgrade neovim

# sudo pip install virtualenv
# sudo pip install virtualenvwrapper
sudo pip install pipenv

sudo pip install colour-valgrind

# sudo pip install khal
# sudo pip install vdirsyncer

sudo npm install -g coffee-script
sudo npm install -g text-aid-too

sudo npm install -g js-beautify
sudo npm install -g eslint-plugin-react
sudo npm install -g babel-eslint
sudo npm install -g create-react-app


# zsh {{{1

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh


# neovim {{{1

# vim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +xall


# AUR {{{1

bash ~/config/arch/pacaur.sh

export EDITOR=nvim
gpg --recv-keys 5FAF0A6EE7371805

pacaur -S --noconfirm --noedit alacritty-git
# pacaur -S --noconfirm --noedit discord
pacaur -S --noconfirm --noedit dropbox
pacaur -S --noconfirm --noedit google-chrome
# pacaur -S --noconfirm --noedit neofetch
pacaur -S --noconfirm --noedit unclutter-xfixes-git
pacaur -S --noconfirm --noedit universal-ctags-git
pacaur -S --noconfirm --noedit vtop
pacaur -S --noconfirm --noedit zsh-fast-syntax-highlighting-git

pacaur -S --noconfirm --noedit neomutt
pacaur -S --noconfirm --noedit neomutt

pacaur -S --noconfirm --noedit i3-gaps
pacaur -S --noconfirm --noedit i3lock-color-git

# pacaur -S --noconfirm --noedit gitflow-avh
# pacaur -S --noconfirm --noedit gitflow-zshcompletion-avh

pacaur -S --noconfirm --noedit polybar-git


# Old config {{{1

# cd Downloads
# git clone https://github.com/rkitover/vimpager
# cd vimpager
# sudo make install
# cd ..
# rm -rf vimpager
# cd ~

#cd Downloads
#git clone https://github.com/powerline/fonts.git
#cd fonts
#./install.sh
#cd ..
#rm -rf fonts
#cd ~
