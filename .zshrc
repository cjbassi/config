# History Settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Set to vi mode
bindkey -v

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

# 10ms for key sequences
export KEYTIMEOUT=1

zstyle :compinstall filename '/home/calebbassi/.zshrc'

# Autocompletion
autoload -Uz compinit && compinit

# Set vim as default editor
export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim

bindkey '^w' backward-kill-word

# Set terminal to 256 color mode for vim
export TERM=xterm-256color

# Prompt
autoload -U colors && colors
PROMPT=$'\e[01;32m%n@%m\e[0m:\e[01;34m%~\e[0m%(#~#~$) '

# Aliases
alias ls='ls --color=auto'
# ll = ls -AFlh
alias ll='echo total
          du -hs -- "$@" | cut -f1
          ls -AFlh'
#(du -hs ./*; ls -lh) | awk '{ if($1 == "total") {X = 1} else if (!X) {SIZES[$2] = $1} else { sub($5 "[ ]*", sprintf("%-7s ", SIZES["./" $9]), $0); print $0} }'


function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[red]%} [% NORMAL]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
