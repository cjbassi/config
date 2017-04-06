#!/bin/bash

find ~/dotfiles -name '*rc' -exec ln -s {} ~/ ';'
ln -s ~/dotfiles/*.vim ~/.vim/colors/
mkdir ~/.vim/temp ~/.vim/undodir

source ~/.bashrc
