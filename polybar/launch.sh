#!/usr/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar left &
polybar middle &
polybar right &

# Hide modules initially
sleep 1
polybar-msg action network-essid module_hide
