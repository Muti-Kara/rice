#!/bin/bash

# You can call this script like this:
# $ ./volume.sh up
# $ ./volume.sh down
# $ ./volume.sh mute

function get_volume {
    pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/%//'
}

function is_mute {
    pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}'
}

function send_notification {
    volume=$(get_volume)
    bar=$(seq -s "─" $(($volume / 5)) | sed 's/[0-9]//g')
    dunstify -i audio-volume-muted-blocking.svg -t 8000 -r 2593 -u normal "    $bar"
}

case $1 in
    up)
        pactl set-sink-mute @DEFAULT_SINK@ false > /dev/null
        pactl set-sink-volume @DEFAULT_SINK@ +5% > /dev/null
        send_notification
        ;;
    down)
        pactl set-sink-mute @DEFAULT_SINK@ false > /dev/null
        pactl set-sink-volume @DEFAULT_SINK@ -5% > /dev/null
        send_notification
        ;;
    mute)
        if [ "$(is_mute)" == "yes" ]; then
            pactl set-sink-mute @DEFAULT_SINK@ false > /dev/null
            dunstify -i audio-volume-muted -t 8000 -r 2593 -u normal "Unmuted"
        else
            pactl set-sink-mute @DEFAULT_SINK@ true > /dev/null
            dunstify -i audio-volume-muted -t 8000 -r 2593 -u normal "Muted"
        fi
        ;;
    *)
        echo "Usage: $0 up|down|mute"
        exit 1
        ;;
esac

