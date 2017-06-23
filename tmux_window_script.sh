# Get current window number
WINDOW_NUMBER=$(tmux display -p '#I')

# Get the current buffer
#TEMP="$BUFFER"

# exit if we are switching to the current window
if [[ $WINDOW_NUMBER == $1 ]] ; then
    exit
fi

# swap to the window if it exists
if tmux select-window -t $1 ; then
    :
# create window if it doesn't exist and swap to it
else
    tmux new-window -t $1
fi

PANE_COUNT=$(tmux list-panes -t $WINDOW_NUMBER | wc -l)
WINDOW_NAME=$(tmux list-window | grep "$WINDOW_NUMBER:" | awk '{print $2}' | egrep -o "[A-Za-z]+")

# if there is only one pane in the previous window
#if [[ $PANE_COUNT == 1 ]] ; then
#    # if the window name is zsh
#    if [[ $WINDOW_NAME == "zsh" ]] ; then
#        # if the previous window's buffer was empty
#        if [[ $TEMP == "" ]] ; then
#            tmux kill-window -t $WINDOW_NUMBER
#        fi
#    fi
#fi
