# Source {{{1

source ~/config/shell/env.fish
source ~/config/shell/commands.fish


# plugin manager {{{1

fundle plugin 'oh-my-fish/theme-bobthefish'
fundle plugin 'jethrokuan/fzf'

fundle init


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

set -gx UID (id -u)


# Keybinds {{{1

bind -M insert \t accept-autosuggestion
bind -M insert \ct __fzf_complete


# Plugins {{{1

# bobthefish {{{2

set -gx theme_color_scheme solarized-dark
set -gx theme_date_format "+%H:%M:%S"
set -gx theme_display_date no
set -gx theme_display_git_ahead_verbose yes
set -gx theme_display_git_dirty_verbose yes
set -gx theme_display_git_stashed_verbose yes

# fzf {{{2

set -gx FZF_COMPLETE 0
set -gx FZF_LEGACY_KEYBINDINGS 0
