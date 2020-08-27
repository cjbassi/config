#!/usr/bin/env bash

# Packages {{{1

pacstrap /mnt \
	base \
	base-devel \
\
	python-jedi \
	python-pylint \
	python-pytest \
	python-rope \
	python-poetry \
	twine \
	python-wheel \
	autopep8 \
	flake8 \
\
	rust-racer \
\
	tidy \
\
	gnome-keyring \
