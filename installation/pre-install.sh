#!/usr/bin/env bash

# TODO connect to wifi
git clone https://github.com/cjbassi/config /tmp
# update `my-config-dir` variable in `configuration.nix`
/tmp/config/installation/install.sh
