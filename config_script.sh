#!/bin/bash

# Vim directories
mkdir ~/.vim/temp ~/.vim/undodir

# Ranger config
ln -sf ~/config/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sf ~/config/ranger/commands.py ~/.config/ranger/commands.py

# i3 config
ln -sf ~/config/X11/config ~/.config/i3/

# i3 statusbar
sudo ln -sf ~/config/X11/i3status.conf /etc/

# X11 mouse acceleration and speed
sudo ln -sf ~/config/X11/50-mouse.conf /etc/X11/xorg.conf.d/

# Home directory config files
ln -sf ~/config/dotfiles/.* ~/

# Vim-plug
if ! [[ -e ~/.vim/autoload/plug.vim ]]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
