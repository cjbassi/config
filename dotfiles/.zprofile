#!/usr/bin/env bash

# sudo loadkeys ~/config/keyboard/consolekeys

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  startx
fi

export PATH="$HOME/.cargo/bin:$PATH"
