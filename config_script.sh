#!/bin/bash

dir="$HOME/dotfiles"

mkdir ~/.vim/temp ~/.vim/undodir ~/.vim/colors

ln -s $dir/config ~/.config/i3/

sudo ln -s $dir/i3status.conf /etc/

sudo ln -s $dir/50-mouse.conf /etc/X11/xorg.conf.d/

ln -s $dir/solarizes.vim ~/.vim/colors/

ln -s $dir/.bashrc ~/
ln -s $dir/.gitconfig ~/
ln -s $dir/.inputrc ~/
ln -s $dir/.tmux.conf ~/
ln -s $dir/.vimrc ~/
ln -s $dir/.xinitrc ~/

source ~/.bashrc
