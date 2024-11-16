#!/bin/bash

# see man zscroll for documentation of the following parameters
# -l 30
zscroll -l 200 \
        --delay 0.1 \
        --scroll-padding "  " \
        --match-command "`dirname $0`/get_spotify_status.sh --status" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true "`dirname $0`/get_spotify_status.sh" &

wait

