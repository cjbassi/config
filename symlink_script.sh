#!/bin/bash

find ~/dotfiles -name '*rc' -exec ln -s {} ~/ ';'
