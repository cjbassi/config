# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Set vim as default editor
export VISUAL=vim
export EDITOR=vim

# Set terminal to 256 color mode for vim
export TERM=xterm-256color

# Prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Aliases
alias ls='ls --color=auto'
alias ll='ls -AhlX --group-directories-first'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Makes bash tabing working like Vim
bind 'TAB:menu-complete'
bind 'set show-all-if-ambiguous on'
bind 'set menu-complete-display-prefix on'
