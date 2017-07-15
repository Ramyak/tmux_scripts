#!/bin/bash
SESSION=ha

tmux attach-session -t $SESSION && exit 0

tmux -2 new-session -d -s $SESSION

tmux new-window -t $SESSION:0 -n 'HoneywellSecurity'
tmux send-keys "~/rtl/HoneywellSecurity/rpi/honeywell" C-m

tmux new-window -t $SESSION:1 -n 'ha'
tmux send-keys "sudo su -s /bin/bash homeassistant" C-m
tmux send-keys "hass" C-m


tmux new-window -t $SESSION:2 -n 'mqtt'
tmux send-keys "cd ~/rtl/honeywell_to_mqtt/" C-m

tmux new-window -t $SESSION:3 -n 'ha_config'
tmux send-keys "sudo su -s /bin/bash homeassistant" C-m
tmux send-keys "cd  ~/.homeassistant/" C-m

tmux new-window -t $SESSION:4 -n 'home'

# Set default window
tmux select-window -t $SESSION:3

# Attach to session
tmux -2 attach-session -t $SESSION
