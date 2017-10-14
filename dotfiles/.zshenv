# export VISUAL='nvim'
# export EDITOR='nvim'
# export USE_EDITOR='nvim'

# alias highlight='highlight --config-file=/home/cjbassi/config/highlight/custom-solarized-dark.theme -s custom-solarized-dark'

export FZF_DEFAULT_OPTS='--height 40% --reverse --border --preview "head -100 {}"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vimpager
# export PAGER=vimpager
# alias less=$PAGER
# alias zless=$PAGER

source ~/.zshrc
source ~/.aliases
