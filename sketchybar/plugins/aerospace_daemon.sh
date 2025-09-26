#!/bin/bash

# Aerospace workspace monitoring daemon
# Checks every 2 seconds and updates SketchyBar if needed

DAEMON_PID_FILE="/tmp/sketchybar_aerospace_daemon.pid"
UPDATE_INTERVAL=0.01

# Function to cleanup on exit
cleanup() {
    if [ -f "$DAEMON_PID_FILE" ]; then
        rm -f "$DAEMON_PID_FILE"
    fi
    exit 0
}

# Set up signal handlers
trap cleanup SIGTERM SIGINT EXIT

# Store PID for daemon management
echo $$ > "$DAEMON_PID_FILE"

# Cache for comparison
LAST_STATE=""

while true; do
    # Get current state
    CURRENT_WORKSPACE=$(aerospace list-workspaces --focused 2>/dev/null)
    
    # Create a state signature by combining workspace and app info
    STATE_SIGNATURE="workspace:$CURRENT_WORKSPACE"
    
    # Add app info for each workspace to the signature
    for i in {1..10}; do
        if aerospace list-workspaces --all 2>/dev/null | grep -q "^$i$"; then
            apps=$(aerospace list-windows --workspace $i --format "%{app-name}" 2>/dev/null | sort -u | tr '\n' '|')
            STATE_SIGNATURE="${STATE_SIGNATURE};ws$i:$apps"
        fi
    done
    
    # Update if state has changed
    if [ "$STATE_SIGNATURE" != "$LAST_STATE" ]; then
        echo "State changed, updating SketchyBar..."
        sketchybar --trigger aerospace_workspace_change
        LAST_STATE="$STATE_SIGNATURE"
    fi
    
    sleep $UPDATE_INTERVAL
done