# Settings {{{1

fish_vi_key_bindings
function fish_greeting; end  # disable fish greeting

# integrate clipboard with vim
bind yy fish_clipboard_copy
bind Y fish_clipboard_copy
bind p fish_clipboard_paste

## Prompt {{{2

set -g theme_color_scheme solarized-dark

set -g theme_date_format "+%H:%M:%S"
set -g theme_display_date no

set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_stashed_verbose yes

# Keybinds {{{1
