# vim: ft=sh

# commands {{{1

source ~/config/other/commands.sh

export SOURCE_COMMANDS="source $ZDOTDIR/.commands; shopt -s expand_aliases"


# Locales {{{1

LANG="en_US.UTF-8"
LC_COLLATE=$LANG
LC_CTYPE=$LANG
LC_MESSAGES=$LANG
LC_MONETARY=$LANG
LC_NUMERIC=$LANG
LC_TIME=$LANG
LC_ALL=$LANG


# env variables {{{1

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export TERM=xterm-256color

export EDITOR=nvim
export editor=nvim
export VISUAL=$EDITOR
export USE_EDITOR=$EDITOR

export PAGER=nvimpager
export MANPAGER=$PAGER
alias pager=$PAGER
alias zless=$PAGER
alias less=$PAGER

export TERMINAL="alacritty -e"
export BROWSER=google-chrome-stable

export LOCKPRG="swaylock-blur"
export EXITPRG="swaymsg exit"

export INTERNAL_DISPLAY=eDP-1
export EXTERNAL_DISPLAY=HDMI-1

export WINIT_HIDPI_FACTOR=1.0 # alacritty

export PIPENV_VENV_IN_PROJECT=1

# export RUSTC_WRAPPER=sccache
export RUST_BACKTRACE=1

export ZGEN_DIR=$XDG_DATA_HOME/zgen
export CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export CCACHE_DIR=$XDG_CACHE_HOME/ccache
export PYLINTHOME=$XDG_CACHE_HOME/pylint
export AWS_SHARED_CREDENTIALS_FILE=$XDG_CONFIG_HOME/aws/credentials
export AWS_CONFIG_FILE=$XDG_CONFIG_HOME/aws/config
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export HISTFILE=$XDG_STATE_HOME/zsh/history
export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc
export XSERVERRC=$XDG_CONFIG_HOME/X11/xserverrc
export INPUTRC=$XDG_CONFIG_HOME/readline/inputrc
export TIGRC_USER=$XDG_CONFIG_HOME/tig/tigrc
export PSQL_HISTORY=$XDG_CACHE_HOME/pg/psql_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PYTHONUSERBASE=$XDG_DATA_HOME/pip
export GOPATH=$XDG_DATA_HOME/go
export GOBIN=$GOPATH/bin


# Path {{{1

export PATH=$PATH:$PYTHONUSERBASE/bin
export PATH=$PATH:$GOBIN
export PATH=$PATH:$XDG_DATA_HOME/npm/bin
export PATH=$PATH:$CARGO_HOME/bin

export PATH=$PATH:/usr/bin/vendor_perl # mimeopen/mimetype etc

export PATH=$PATH:/usr/lib/ccache/bin/


# fzf {{{1

export FZF_DEFAULT_OPTS="--height 40% --reverse --border"
export FZF_DEFAULT_COMMAND="fd"

source ~/config/other/fzf-solarized.sh
