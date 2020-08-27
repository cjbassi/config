#!/usr/bin/env bash

# clone config repo
while [[ ! -d "~/config" ]]; do
	hub clone cjbassi/config
done

# create directories
mkdir -p \
	~/Downloads \
	~/Drive \
	~/projects/{mine,other}

# set initial laptop screen brightness
light -S 50
