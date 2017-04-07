#!/bin/bash

mkdir ~/.vim/temp ~/.vim/undodir
mkdir ~/.vim/colors

find ~/dotfiles -name '*rc' -exec ln -s {} ~/ ';'
ln -s ~/dotfiles/*.vim ~/.vim/colors/
ln -s ~/dotfiles/.gitconfig ~/.gitconfig

source ~/.bashrc
