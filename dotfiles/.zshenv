# vim: ft=sh

# Sources {{{1

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

# pip, npm, go
export PATH=$PATH:~/.local/bin

export PATH="/usr/lib/ccache/bin/:$PATH"

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/bin/personal

export GOPATH=~/.local
export GOBIN=$GOPATH/bin

export PATH="$HOME/.cargo/bin:$PATH"


# fzf {{{1

export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export FZF_CTRL_T_COMMAND='rg --files'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.fzf_solarized.sh


# env variables {{{1

export EDITOR='nvim'
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
