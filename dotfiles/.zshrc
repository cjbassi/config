# If not running interactively, don't do anything
[[ -z "$PS1" ]] && return

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
#zle -N edit-command-line
#autoload -Uz edit-command-line
#bindkey -M vicmd 'v' edit-command-line

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
stty -ixon              # Disables C-s and C-q

################################################################################
# Locales

LANG="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

################################################################################
# Colors

if [[ $TERM == xterm ]]; then TERM=xterm-256color; fi

LS_COLORS=$LS_COLORS:'di=1;38;5;27:' ; export LS_COLORS # directory colors

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

################################################################################
# Prompt

# PROMPT=$'%{\e[1;38;5;34m%}%n@%m%{\e[0m%}:%{\e[1;38;5;27m%}%~%{\e[0m%}%(!.#.$) '
INSERT=$'%{\e[1;38;5;34m%}>%{\e[0m%}%{\e[1;38;5;27m%}_%{\e[0m%} '
NORMAL=$'%{\e[1;38;5;34m%}>%{\e[0m%}%{\e[1;38;5;27m%} %{\e[0m%} '
# RPS1=$""

function zle-line-init zle-keymap-select
{
    PROMPT="${${KEYMAP/vicmd/$NORMAL}/main/$INSERT}"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

################################################################################
# Aliases

alias ll='ls -AhgoX --group-directories-first'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v' # Irdf
alias w='w -f'
alias df='df -h'
alias du='du -h'

alias pwd='echo -e "${PWD/${HOME}/~}"'
alias cat='vimcat'
alias java='bash ~/config/java_script.sh'
alias glances='glances -1 --fs-free-space --disable-memswap --disable-diskio --process-short-name --byte'

rm() {
    # ll $4
    # ignore -I
    #

    # echo -n 'rm: remove # '
    #/usr/bin/rm: remove 1 argument recursively?
    echo -n 'rm: continue with removal? '
    read
    if [[ $REPLY == 'y' ]] || [[ $REPLY == 'yes' ]]; then
        /usr/bin/rm "$@"
    fi
}

################################################################################
# Other programs

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
bindkey -M vicmd '/' fzf-history-widget
bindkey -r '^r'
bindkey -r '^t'
bindkey -r '^[c'

function expand-or-cd-or-fzf() {
    if [[ $BUFFER == "cd " ]]; then
        # BUFFER="ls "
        # CURSOR=3
        # zle list-choices
        # zle backward-kill-word
        fzf-cd-widget
        BUFFER=""
    # elif cursor is next to a space
    elif [[ $BUFFER =~ \ $ ]] ; then
        fzf-file-widget
    else
        zle expand-or-complete
    fi
}
zle -N expand-or-cd-or-fzf
bindkey '^I' expand-or-cd-or-fzf

#export FZF_COMPLETION_TRIGGER='/'

# ranger
ranger() {
    if [ -n "$RANGER_LEVEL" ]; then
        exit
    elif [ -n "$TMUX" ] && [[ $(tmux show-window-options) != *automatic-rename\ off* ]] ; then
        tmux rename-window "ranger"
        /usr/bin/ranger "$@"
        tmux setw automatic-rename on
    else
        /usr/bin/ranger "$@"
    fi
}

# glances
glances() {
    if [ -n "$TMUX" ] && [[ $(tmux show-window-options) != *automatic-rename\ off* ]] ; then
        tmux rename-window "glances"
        /usr/bin/glances "$@"
        tmux setw automatic-rename on
    else
        /usr/bin/glances "$@"
    fi
}

# vimpager
export PAGER=vimpager
alias less=$PAGER
alias zless=$PAGER

# zsh-syntax-highlighting
source /home/cbassi/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

################################################################################

# Start ranger for each shell
# if [ -z "$RANGER_LEVEL" ]; then
#     /usr/bin/ranger "$@"
# fi

# Powerline stuff
# export PATH="$HOME/.vim/bundle/powerline/scripts/:$PATH"
# . ~/.vim/plugged/powerline/powerline/bindings/zsh/powerline.zsh
# powerline-daemon -q
# . /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

# zle vi-cmd-mode
