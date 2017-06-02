#!/bin/bash

mkdir ~/.vim/temp ~/.vim/undodir ~/.vim/colors

ln -s ~/config/X11/config ~/.config/i3/
sudo ln -s ~/config/X11/i3status.conf /etc/
sudo ln -s ~/config/X11/50-mouse.conf /etc/X11/xorg.conf.d/

ln -s ~/config/colorschemes/* ~/.vim/colors/

ln -s ~/config/dotfiles/.* ~/
