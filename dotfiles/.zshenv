# vim: ft=sh

# aliases {{{1

source ~/.aliases


# Locales {{{1

LANG="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_ALL="en_US.UTF-8"


# Path {{{1

export PATH=$PATH:~/.local/bin  # python, node, go
export PATH="$HOME/.cargo/bin:$PATH"  # rust

export PATH="/usr/lib/ccache/bin/:$PATH"

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/bin/personal


# env variables {{{1

export EDITOR="nvim"
export VISUAL=$EDITR
export USE_EDITOR=$EDITOR

export PAGER="vimpager"
export MANPAGER=$PAGER

alias pager=$PAGER
alias zless=$PAGER
alias less=$PAGER

export BROWSER=google-chrome-stable

export TERM='xterm-256color'

export XDG_CURRENT_DESKTOP=i3-gaps

export PIPENV_VENV_IN_PROJECT=1

export RUSTC_WRAPPER=sccache
export RUST_BACKTRACE=1

export GOPATH=~/.local
export GOBIN=$GOPATH/bin

export LOCKPRG='i3lock-fancy -- maim'


# fzf {{{1

export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

source ~/.fzf_solarized.sh
