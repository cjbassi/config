# vim: ft=sh

# {{{1

# If not running interactively, don't do anything
[[ -z "$PS1" ]] && return

export TERM='xterm-256color'

# source ~/.aliases


# Antigen {{{1

source ~/.antigen.zsh

antigen bundle zdharma/fast-syntax-highlighting
antigen theme bhilburn/powerlevel9k powerlevel9k
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle bobthecow/git-flow-completion
antigen bundle zsh-users/zsh-completions
antigen bundle unixorn/git-extra-commands


# History {{{1

HISTFILE=~/.histfile

HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
export HISTORY_IGNORE="(l(| *)|ll(| *)|cd(| *)|rm(| *)|pwd|r|ranger(| *))"

setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

setopt EXTENDED_HISTORY

setopt APPEND_HISTORY


# Keybinds {{{1

bindkey -v
export KEYTIMEOUT=1

zle -N edit-command-line
autoload -Uz edit-command-line
bindkey -M vicmd '^v' edit-command-line

bindkey '^w' backward-kill-word
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

bindkey -r '^z'

# allow v to edit the command line (standard behaviour)
#zle -N edit-command-line
#autoload -Uz edit-command-line
#bindkey -M vicmd 'v' edit-command-line


# Settings {{{1

setopt globdots         # Tab completion includes dot files
setopt kshglob          # Addes more globbs
CASE_SENSITIVE="true"   # Case sensitive completion
stty -ixon              # Disables C-s and C-q

# makes escape not move cursor back
function zle-keymap-select
{
    if [[ $KEYMAP = 'vicmd' ]] ; then
        CURSOR=$CURSOR+1
    fi
}
zle -N zle-keymap-select

# lists directory contents on cd
function chpwd() { ll }

# completion
autoload -Uz compinit
compinit -u


# Colors {{{1

# LS_COLORS=$LS_COLORS:'di=1;38;5;27:' ; export LS_COLORS # directory colors

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

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey -r '^r'
bindkey -r '^[c'

export FZF_CTRL_T_COMMAND='sudo ag --hidden --ignore .git -g ""'
# export FZF_DEFAULT_OPTS='--height 40% --reverse --border --preview "head -100 {}"'

zle -N fzf-history-widget
zle -N fzf-file-widget
zle -N fzf-cd-widget

bindkey -M vicmd '/' fzf-history-widget

bindkey -M vicmd '^f' fzf-file-widget
bindkey -M viins '^f' fzf-file-widget

bindkey -M viins -r '^t'

bindkey -M vicmd '^r' fzf-cd-widget
bindkey -M viins '^r' fzf-cd-widget


# highlight {{{2

alias highlight='highlight --config-file=/home/cjbassi/config/highlight/custom-solarized-dark.theme -s custom-solarized-dark'


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


# zsh-autosuggestions {{{2

bindkey '^I' autosuggest-accept

# }}}

# Old Configs {{{1

# BASE16_SHELL=$HOME/.config/base16-shell/
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# base16_solarized-dark


# export PATH="$HOME/.vim/bundle/powerline/scripts/:$PATH"
# . ~/.vim/plugged/powerline/powerline/bindings/zsh/powerline.zsh
# powerline-daemon -q
# . /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

# zle vi-cmd-mode

# Prompt

# # PROMPT=$'%{\e[1;38;5;34m%}%n@%m%{\e[0m%}:%{\e[1;38;5;27m%}%~%{\e[0m%}%(!.#.$) '
# INSERT=$'%{\e[1;38;5;09m%}%~ %{\e[1;38;5;34m%}>%{\e[1;38;5;27m%}_%{\e[0m%} '
# NORMAL=$'%{\e[1;38;5;09m%}%~ %{\e[1;38;5;34m%}>%{\e[1;38;5;27m%} %{\e[0m%} '
# # RPS1=$""

# function zle-line-init zle-keymap-select
# {
#     PROMPT="${${KEYMAP/vicmd/$NORMAL}/main/$INSERT}"
#     zle reset-prompt
# }

# zle -N zle-line-init
# zle -N zle-keymap-select

# source /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

# function expand-or-cd-or-fzf() {
#     # if [[ $BUFFER == "cd " ]]; then
#         # BUFFER="ls "
#         # CURSOR=3
#         # zle list-choices
#         # zle backward-kill-word
#         fzf-cd-widget
#         # BUFFER=""
#         zle accept-line
#     # elif cursor is next to a space
#     # elif [[ $BUFFER =~ \ $ ]] ; then
#     #     fzf-file-widget
#     # elif [[ $BUFFER = "vim " ]] || [[ $BUFFER = "v " ]] || [[ $BUFFER = "nvim " ]] ; then
#     #     fzf-file-widget
#     # else
#     #     zle expand-or-complete
#     # fi
# }
# # zle -N expand-or-cd-or-fzf
# # bindkey '^I' expand-or-cd-or-fzf

# function fda() {
#     fzf-cd-widget
#     zle accept-line
# }
# zle -N fda

# function expand-or-cd-or-fzf() {
#     if [[ $BUFFER == "cd " ]]; then
#         # BUFFER="ls "
#         # CURSOR=3
#         # zle list-choices
#         # zle backward-kill-word
#         fzf-cd-widget
#         BUFFER=""
#         zle accept-line
#     # elif cursor is next to a space
#     # elif [[ $BUFFER =~ \ $ ]] ; then
#     #     fzf-file-widget
#     elif [[ $BUFFER = "vim " ]] || [[ $BUFFER = "v " ]] || [[ $BUFFER = "nvim " ]] ; then
#         fzf-file-widget
#     else
#         zle expand-or-complete
#     fi
# }
# zle -N expand-or-cd-or-fzf
# # bindkey '^I' expand-or-cd-or-fzf
# # bindkey '^I' expand-or-cd-or-fzf

# source /usr/share/fzf/completion.zsh
# source /usr/share/fzf/key-bindings.zsh

# bindkey -M vicmd '^r' fzf-cd-widget
# bindkey -M viins '^r' fzf-cd-widget
# bindkey -r '^r'

# function fzf_select_dir()
# {
#         find -L -path '*/\.*' -o -fstype dev -o -fstype proc \
#             -prune \
#             -o -type f -print \
#             -o -type d -print \
#             -o -type l -print 2>/dev/null \
#             env fzf -m
# }




# function zle-line-init zle-keymap-select {
#     RPS1="%{$fg_bold[yellow]%} [% $KEYMAP]%  %{$reset_color%}"
#     # RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
#     zle reset-prompt
# }

# zle -N zle-line-init
# zle -N zle-keymap-select

# vim_ins_mode="INSERT"
# vim_cmd_mode="NORMAL"
# vim_mode=$vim_ins_mode

# function zle-keymap-select {
#   vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
#   __promptline
#   zle reset-prompt
# }
# zle -N zle-keymap-select

# function zle-line-finish {
#   vim_mode=$vim_ins_mode
# }
# zle -N zle-line-finish

# function TRAPINT() {
#   vim_mode=$vim_ins_mode
#   return $(( 128 + $1 ))
# }

# promptline {{{2

# ZLE_RPROMPT_INDENT=0
# source ~/.promptline.sh

# virutalenv {{{2

# source /usr/bin/virtualenvwrapper_lazy.sh
# source /usr/bin/activate.sh
# eval "$(direnv hook zsh)"
# eval "$(pipenv --completion)"

# }}}

# elif [ -n "$TMUX" ] && [[ $(tmux show-window-options) != *automatic-rename\ off* ]] ; then
#     tmux rename-window "ranger"
#     /usr/bin/ranger "$@"
#     tmux setw automatic-rename on
