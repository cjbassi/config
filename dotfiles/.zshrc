# vim: ft=sh

# Interactivity {{{1

# If not running interactively, don't do anything
[[ -z "$PS1" ]] && return


# Antigen {{{1

source /usr/share/zsh/share/antigen.zsh

antigen bundle zdharma/fast-syntax-highlighting
antigen theme bhilburn/powerlevel9k powerlevel9k
antigen bundle bobthecow/git-flow-completion
antigen bundle zsh-users/zsh-completions
antigen bundle unixorn/git-extra-commands

antigen apply


# History {{{1

HISTFILE=~/.histfile

HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
export HISTORY_IGNORE="(l(| *)|ll(| *)|cd(| *)|(|* )rm(| *)|pwd|r|ranger(| *)|m|e?|cd?|make)"

setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

setopt EXTENDED_HISTORY

setopt APPEND_HISTORY


# Keybinds {{{1

bindkey -v
export KEYTIMEOUT=1

zle -N edit-command-line
autoload -Uz edit-command-line
bindkey -M viins '^e' edit-command-line
bindkey -M vicmd '^e' edit-command-line

bindkey '^w' backward-kill-word
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

bindkey -r '^z'

# allow v to edit the command line (standard behaviour)
#zle -N edit-command-line
#autoload -Uz edit-command-line
#bindkey -M vicmd 'v' edit-command-line


# Settings {{{1

export TERM='xterm-256color'

setopt globdots         # Tab completion includes dot files
setopt kshglob          # Addes more globbs
CASE_SENSITIVE="true"   # Case sensitive completion
stty -ixon              # Disables C-s and C-q

# makes escape not move cursor back
function zle-keymap-select
{
    if [[ $KEYMAP == 'vicmd' ]] ; then
        CURSOR=$CURSOR+1
    fi
}
zle -N zle-keymap-select

# lists directory contents on cd
function chpwd()
{
    ll
}

function my-accept-line
{
    if [[ $BUFFER != "" ]] ; then
        zle accept-line
    fi
}
zle -N my-accept-line
bindkey '^M' my-accept-line

# completion
autoload -Uz compinit
compinit -u


# Colors {{{1

alias ls='ls --color=auto'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pcregrep='pcregrep --color=auto'

alias watch='watch --color'

alias diff='diff --color=auto'

alias ip='ip -c'

alias dmesg='dmesg --color=auto'
alias tree='tree -C'

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias fdisk='fdisk --color=auto'

# Arch colors
alias cower='cower --color=auto'
alias pactree='pactree -c'

export TLDR_COLOR_BLANK="white"


# Copy/Paste {{{1

vi-prepend-x-selection () {
    PASTE=$(xclip -o -sel c </dev/null)
    LEN=${#PASTE}
    BUFFER=$LBUFFER$PASTE$RBUFFER;
    CURSOR=$CURSOR+LEN-1
}
zle -N vi-prepend-x-selection
bindkey -a 'P' vi-prepend-x-selection

vi-append-x-selection () {
    PASTE=$(xclip -o -sel c </dev/null)
    LEN=${#PASTE}
    BUFFER=${BUFFER:0:$CURSOR+1}$PASTE${BUFFER:$CURSOR+1};
    CURSOR=$CURSOR+LEN
}
zle -N vi-append-x-selection
bindkey -a 'p' vi-append-x-selection

zsh-y-x-selection () {
    zle vi-yank
    echo -n $CUTBUFFER | xclip -i -sel c;
}
zle -N zsh-y-x-selection
bindkey -a 'y' zsh-y-x-selection

zsh-Y-x-selection () {
    zle vi-yank-eol
    echo -n $CUTBUFFER | xclip -i -sel c;
}
zle -N zsh-Y-x-selection
bindkey -a 'Y' zsh-Y-x-selection


# Other Programs{{{1

# fzf {{{2

zle -N fzf-history-widget
zle -N fzf-file-widget
zle -N fzf-cd-widget

bindkey -r '^[c'
bindkey -M viins -r '^t'

bindkey -M vicmd '/' fzf-history-widget

bindkey -M vicmd '^f' fzf-file-widget
bindkey -M viins '^f' fzf-file-widget

bindkey -M vicmd '^r' fzf-cd-widget
bindkey -M viins '^r' fzf-cd-widget


# pipenv {{{2

export PIPENV_VENV_IN_PROJECT=1


# Powerlevel9k {{{2

export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode dir root_indicator virtualenv background_jobs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs)

export POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
export POWERLEVEL9K_STATUS_OK=false

export POWERLEVEL9K_STATUS_HIDE_SIGNAME=false

export POWERLEVEL9K_VIRTUALENV_FOREGROUND=255
export POWERLEVEL9K_VIRTUALENV_BACKGROUND=240

# export POWERLEVEL9K_DIR_FOREGROUND=255
# export POWERLEVEL9K_DIR_BACKGROUND=240

export POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND=255
export POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND=245

export POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND=255
export POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND=11

export POWERLEVEL9K_VCS_FOREGROUND=255
export POWERLEVEL9K_VCS_BACKGROUND=33

# export POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND=255
export POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND=125

# export POWERLEVEL9K_VI_INSERT_MODE_STRING="\e[1mINSERT\e[21m"
# export POWERLEVEL9K_VI_COMMAND_MODE_STRING="\e[1mNORMAL\e[21m"
# export POWERLEVEL9K_HOME_FOLDER_ABBREVIATION="\e[21m~"

# POWERLEVEL9K_DIR_HOME_BACKGROUND="grey"
# POWERLEVEL9K_DIR_HOME_FOREGROUND="grey"

# POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="grey"
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="grey"

# POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="grey"
# POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="grey"

# source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
# source ~/Dropbox/projects/powerlevel9k/powerlevel9k.zsh-theme


# ranger {{{2

function ranger()
{
    if [ -n "$RANGER_LEVEL" ]; then
        exit
    else
        command ranger "$@"
    fi
}
