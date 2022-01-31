## Zoom Unmuter

Mute/Unmute Zoom with global hotkeys!

Run `./install.sh`.

Note: Using Alt+A as the key combination is not supported at the moment, as this is the key sequence that Zoom itself accepts, and that our script sends; We have to implement anti-recursion means in `zoom_key_send.sh` for that. I'm open for PRs :)

When your key combination is pressed, Zoom's window is temporarily activated, the Alt+A sequence is sent to change the mute state, then the previous window is reverted into.

Focused window and active window are reverted, but Zoom does move to the front
