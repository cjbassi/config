#!/bin/bash

# Vim
mkdir -p ~/.vim/temp ~/.vim/undodir

if ! [[ -e ~/.vim/autoload/plug.vim ]]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# dotfiles
ln -sf ~/config/dotfiles/.* ~/
