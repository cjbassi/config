#!/bin/bash

# Vim
mkdir -p ~/.vim/temp ~/.vim/undodir

if ! [[ -e ~/.vim/autoload/plug.vim ]]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Ranger
mkdir -p ~/.config/ranger
ln -sf ~/config/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sf ~/config/ranger/commands.py ~/.config/ranger/commands.py

# wm
mkdir -p ~/.config/i3
ln -sf ~/config/wm/config ~/.config/i3/
mkdir -p ~/.
ln -sf ~/config/wm/opacity.ds ~/.devilspie

# X11 mouse acceleration and speed
sudo ln -sf ~/config/peripherals/50-mouse.conf /etc/X11/xorg.conf.d/

# dotfiles
ln -sf ~/config/dotfiles/.* ~/

# polybar
mkdir -p ~/.config/polybar
ln -sf ~/config/polybar/config ~/.config/polybar/
