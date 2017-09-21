# SET fish_key_bindings:fish_vi_key_bindings

# SET fish_greeting

# function su
  #   /bin/su --shell=/usr/bin/fish $argv
# end

source ~/.aliases
export GOPATH=~/go

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


function fish_mode_prompt; end
function fish_prompt
  env FISH_VERSION=$FISH_VERSION PROMPTLINE_LAST_EXIT_CODE=$status bash ~/.promptline.sh left
end
function fish_right_prompt
  env FISH_VERSION=$FISH_VERSION PROMPTLINE_LAST_EXIT_CODE=$status bash ~/.promptline.sh right
end

function ranger
    if [ -n "$RANGER_LEVEL" ]; then
        exit
    # elif [ -n "$TMUX" ] && [[ $(tmux show-window-options) != *automatic-rename\ off* ]] ; then
    #     tmux rename-window "ranger"
    #     /usr/bin/ranger "$@"
    #     tmux setw automatic-rename on
    else
        /usr/bin/ranger $argv
    end
end


# SET fish_key_bindings:fish_vi_key_bindings
