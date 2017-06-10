# If not running interactively, don't do anything
[[ -z "$PS1" ]] && return

## powerline
#powerline-daemon -q
#. /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

################################################################################
# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
export HISTORY_IGNORE="(ll|cd|cd ..)"

################################################################################
# Vim keybinds
bindkey -v
export KEYTIMEOUT=1
bindkey '^w' backward-kill-word
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
# allow v to edit the command line (standard behaviour)
zle -N edit-command-line
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

################################################################################
# Completion
zstyle :compinstall filename '/home/cbassi/.zshrc'
autoload -Uz compinit
compinit

################################################################################
# Set vim as default editor
export VISUAL=vim
export EDITOR=vim
export USE_EDITOR=vim

################################################################################
# Settings
setopt globdots         # Tab completion includes dot files
setopt kshglob          # Addes more globbs
CASE_SENSITIVE="true"   # Case sensitive completion

################################################################################
# Colors
if [[ $TERM == xterm ]]; then TERM=xterm-256color; fi
PS1=$'%{\e[1;38;5;34m%}%n@%m%{\e[0m%}:%{\e[1;38;5;27m%}%~%{\e[0m%}%(!.#.$) '
LS_COLORS=$LS_COLORS:'di=1;38;5;27:' ; export LS_COLORS # directory colors
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

################################################################################
# Aliases
alias ll='ls -AhlX --group-directories-first'
alias glances='glances -1 --disable-memswap --disable-diskio --process-short-name --byte'
alias java='bash ~/config/java_script.sh'
alias say='echo $1'

################################################################################
# Plugins

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# Ranger
#export RANGER_LOAD_DEFAULT_RC=FALSE

# vimpager
export PAGER='vimpager'
alias less=$PAGER
