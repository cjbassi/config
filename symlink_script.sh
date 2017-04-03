#!/bin/bash

find ~/dotfiles -name '*rc' -exec ln -s {} ~/ ';'
ln -s ~/dotfiles/*.vim ~/.vim/colors/
