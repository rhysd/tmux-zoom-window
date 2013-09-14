#!/bin/bash

# zoom window feature with backward compatibility

function tmux-zoom-window()
{
    local tmux_version=`tmux -V | cut -f 2 -d ' '`
    if [[ $tmux_version > "1.8" || $tmux_version = "1.8" ]]; then
        tmux resize-pane -Z
        return
    fi

    #
    # backward compatibility(1.7 or earlier)
    #
    local current_win=`tmux list-windows | sed '/active/!d' | cut -f 1 -d ':'`
    local current_win_name=`tmux list-windows | sed -e '/active/!d' -e 's/*//' | cut -f 2 -d ' '`
    local current_pane=`tmux list-panes | sed '/active/!d' | cut -f 1 -d ':'`
    local num_panes=`tmux list-panes | wc | sed -e 's/^ *//g' -e 's/ .*$//g'`

    if [[ $num_panes -eq 1 && $current_win_name =~ ^zoom-win ]]; then
        local original_win=`echo $current_win_name | cut -f 2 -d '@'`
        local original_pane=`echo $current_win_name | cut -f 3 -d '@'`
        tmux select-window -t $original_win
        tmux select-pane -t $original_pane
        echo $? > hoge
        tmux swap-pane -s $current_win_name \; kill-window -t $current_win
    elif [[ $num_panes -ne 1 ]]; then
        #create a zoom window if we have more than 1 pane in the window
        #unless we already have a zoom, if we already have a zoom, switch to the zoom
        #  (it doesn't delete and swap automatically because we might be killing a window we need)
        #  (if you want to move it back to the pane, just hit the zoom bind key again)
        local zoom_win=zoom-win$current_win@$current_pane
        if [[ $(tmux list-windows) =~ $zoom_win ]]; then
            tmux select-window -t $zoom_win
        else
            tmux new-window -d -n $zoom_win 'clear && echo TMUX ZOOM && read' \
                 \; swap-pane -s $zoom_win \
                 \; select-window -t $zoom_win
        fi
    fi
}

tmux-zoom-window
