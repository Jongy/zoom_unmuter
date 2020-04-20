#!/bin/bash

set -e

if [ $# -ne 1 ]; then
    echo "Usage: $0 (un)mute-key"
    echo "For example, '$0 control+space'. Key is xbindkeys style."
    exit 1
fi

mute_key="$1"
key_send=$(readlink -f $(dirname $0)/zoom_key_send.sh)

if ! which xdotool 1>/dev/null 2>&1 || ! which xbindkeys 1>/dev/null 2>&1 ; then
    echo "Install xdotool and xbindkeys."
    echo "On Ubuntu, 'sudo apt-get install xdotool xbindkeys'"
    exit 1
fi

cat >> ~/.xbindkeysrc <<EOF
"$key_send"
    $1

EOF

xbindkeys

echo "All is set, xbindkeys started"
