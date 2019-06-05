# source {{{1

source ~/config/other/shell/env.fish
source ~/config/other/shell/commands.fish


# Settings {{{1

fish_vi_key_bindings

function fish_greeting; end  # disable fish greeting

# integrate clipboard with vim
bind yy fish_clipboard_copy
bind Y fish_clipboard_copy
bind p fish_clipboard_paste

# https://github.com/fish-shell/fish-shell/issues/583
function __command_on_cd --on-variable PWD --description 'Run command when directory changes'
    status --is-command-substitution; and return
    ll
end

bind \cd 'exit'


# Prompt {{{1

set -gx theme_color_scheme solarized-dark

set -gx theme_date_format "+%H:%M:%S"
set -gx theme_display_date no

set -gx theme_display_git_ahead_verbose yes
set -gx theme_display_git_dirty_verbose yes
set -gx theme_display_git_stashed_verbose yes


# Variables {{{1

# set -gx UID (id -u)

set -gx FZF_COMPLETE 0


# Keybinds {{{1

# bind / '__fzf_reverse_isearch && commandline -f repaint'
bind -M insert \cf __fzf_find_file
