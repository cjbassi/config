if tmux join-pane -h -t :$1 ; then
    exit
elif tmux break-pane -t :$1 ; then
    exit
else
    tmux move-window -t :$1
fi
