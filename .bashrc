# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions (if any)
if [ -f /etc/bashrc ]; then
      . /etc/bashrc
fi

# Set vim as default editor
export VISUAL=vim
export EDITOR=vim

# History settings
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth
shopt -s histappend
history -a

# shopt settings
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s extglob

# Colors
if [[ $TERM == xterm ]]; then TERM=xterm-256color; fi
PS1='\e[1;38;5;34m\u@\h\e[0m:\e[1;38;5;27m\w\e[0m\$ '
LS_COLORS=$LS_COLORS:'di=1;38;5;27:' ; export LS_COLORS # directory colors
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Aliases
alias ll='ls -AhlX --group-directories-first'
