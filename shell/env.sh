# locales {{{1

export LANG=en_US.UTF-8
export LC_COLLATE=$LANG
export LC_CTYPE=$LANG
export LC_MESSAGES=$LANG
export LC_MONETARY=$LANG
export LC_NUMERIC=$LANG
export LC_TIME=$LANG
export LC_ALL=$LANG


# custom {{{1

export INTERNAL_DISPLAY=eDP-1
export EXTERNAL_DISPLAY=HDMI-A-1


# default programs {{{1

export EDITOR=emacsclient
export editor=$EDITOR
export VISUAL=$EDITOR
export USE_EDITOR=$EDITOR

export PAGER=less
export MANPAGER=$PAGER

export TERMINAL="alacritty -e"
export BROWSER=google-chrome-stable

export LOCKPRG=swaylock-blur
export EXITPRG="swaymsg exit"


# environment {{{1

export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export TERM=xterm-256color


# XDG {{{1

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export AWS_CONFIG_FILE=$XDG_CONFIG_HOME/aws/config
export AWS_SHARED_CREDENTIALS_FILE=$XDG_CONFIG_HOME/aws/credentials
export CARGO_HOME=$XDG_DATA_HOME/cargo
export CCACHE_DIR=$XDG_CACHE_HOME/ccache
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export INPUTRC=$XDG_CONFIG_HOME/readline/inputrc
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PSQL_HISTORY=$XDG_CACHE_HOME/pg/psql_history
export PYLINTHOME=$XDG_CACHE_HOME/pylint
export PIPX_HOME=$XDG_DATA_HOME/pipx
export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc
export XSERVERRC=$XDG_CONFIG_HOME/X11/xserverrc

export PIPX_BIN_DIR=$PIPX_HOME/bin


# path {{{1

export PATH=$PATH:$PIPX_BIN_DIR
export PATH=$PATH:$XDG_DATA_HOME/npm/bin
export PATH=$PATH:$CARGO_HOME/bin

export PATH=$PATH:/usr/bin/vendor_perl  # mimeopen/mimetype etc
export PATH=$PATH:/usr/lib/ccache/bin/

export PATH=$PATH:~/config/bin/{,personal}


# config {{{1

export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"
export TLDR_COLOR_BLANK=white
export WINIT_HIDPI_FACTOR=1.0  # alacritty

export RUSTC_WRAPPER=sccache
export RUST_BACKTRACE=1

export FZF_DEFAULT_OPTS="--height 40% --reverse --border"
export FZF_FIND_FILE_COMMAND=fd
source ~/config/shell/fzf-solarized.sh
