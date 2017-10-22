# source ~/.zshrc
# source ~/.aliases

# alias highlight='highlight --config-file=/home/cjbassi/config/highlight/custom-solarized-dark.theme -s custom-solarized-dark'


# Locales {{{1

LANG="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_ALL="en_US.UTF-8"


# ccache {{{1

export PATH="/usr/lib/ccache/bin/:$PATH"


# golang {{{1

export GOPATH=~/go
export PATH="$PATH:$GOPATH/bin"


# fzf {{{1

export FZF_DEFAULT_OPTS='--height 40% --reverse --border --preview "head -100 {}"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Editor/Pager {{{1

export EDITOR='nvim'
export VISUAL=$EDITOR
export USE_EDITOR=$EDITOR


export PAGER="nvim -c 'set ft=man' -"
export MANPAGER=$PAGER

alias pager=$PAGER
alias zless=$PAGER
alias less=$PAGER
