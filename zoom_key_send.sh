#!/bin/bash

set -e

DEFAULT_SHORTCUT='alt+a'
SHORTCUT=${1:-$DEFAULT_SHORTCUT}

send_to_zoom() {
    # due to "-e" we'll stop if zoom window is not found.
    zoom=$(xdotool search --name "Zoom Meeting")
    cur_active=$(xdotool getactivewindow)
    cur_focus=$(xdotool getwindowfocus)
    
    mouselocation=$(xdotool getmouselocation)
    mouseX=$(echo "$mouselocation" | cut -d' ' -f1 | cut -d':' -f2)
    mouseY=$(echo "$mouselocation" | cut -d' ' -f2 | cut -d':' -f2)
    mouseScreen=$(echo "$mouselocation" | cut -d' ' -f3 | cut -d':' -f2)

    xdotool windowfocus "$zoom"
    xdotool windowactivate "$zoom"
    # without this sleep zoom doesn't get the key press.
    sleep 0.3
    xdotool key "$1"

    xdotool windowactivate "$cur_active"
    xdotool windowfocus "$cur_focus"
    xdotool mousemove --screen "$mouseScreen" "$mouseX" "$mouseY"
}

send_to_zoom $SHORTCUT
