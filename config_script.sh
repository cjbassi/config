#!/bin/bash

# Vim directories
mkdir ~/.vim/temp ~/.vim/undodir

# Ranger config
ln -s ~/config/rc.conf ~/.config/ranger/rc.conf

# i3 config
ln -s ~/config/X11/config ~/.config/i3/

# i3 statusbar
sudo ln -s ~/config/X11/i3status.conf /etc/

# X11 mouse acceleration and speed
sudo ln -s ~/config/X11/50-mouse.conf /etc/X11/xorg.conf.d/

# Home directory config files
ln -s ~/config/dotfiles/.* ~/
