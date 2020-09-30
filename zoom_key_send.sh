#!/bin/bash

set -e

send_to_zoom() {
    # due to "-e" we'll stop if zoom window is not found.
    zoom=$(xdotool search --name "Zoom Meeting")
    cur_active=$(xdotool getactivewindow)
    cur_focus=$(xdotool getwindowfocus)

    xdotool windowfocus "$zoom"
    xdotool windowactivate "$zoom"
    # without this sleep zoom doesn't get the key press.
    sleep 0.3
    xdotool key "$1"

    xdotool windowactivate "$cur_active"
    xdotool windowfocus "$cur_focus"
}

send_to_zoom "alt+a"
