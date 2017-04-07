# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions (if any)
if [ -f /etc/bashrc ]; then
      . /etc/bashrc
fi

# Set vim as default editor
export VISUAL=vim
export EDITOR=vim

# Set terminal to 256 color mode for vim
#export TERM=xterm-256color
#export TERM=xterm

# Prompt
#PS1='\e[01;32m\u@\h\e[0m:\e[01;34m\w\e[0m\$ '
PS1='\e[1;38;5;34m\u@\h\e[0m:\e[1;38;5;27m\w\e[0m\$ '

# Change directory color
LS_COLORS=$LS_COLORS:'di=1;38;5;27:' ; export LS_COLORS

# Aliases
alias ls='ls --color=auto'
alias ll='ls -AhlX --group-directories-first'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# shopt settings
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s extglob

history -a

# Makes bash tabing working like Vim
bind 'TAB:menu-complete'
bind 'set show-all-if-ambiguous on'
bind 'set menu-complete-display-prefix on'
