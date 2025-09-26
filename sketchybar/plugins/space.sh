#!/bin/sh

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

# Get current workspace from aerospace
CURRENT_WORKSPACE=$(aerospace list-workspaces --focused)

# Use provided name or fall back to $NAME environment variable
ITEM_NAME=${1:-$NAME}

# Extract workspace number from the item name (space.1 -> 1)
WORKSPACE_ID=$(echo $ITEM_NAME | sed 's/space\.//')

if [ "$WORKSPACE_ID" = "$CURRENT_WORKSPACE" ]; then
  sketchybar --set $ITEM_NAME background.drawing=on \
                              background.color=$ACCENT_COLOR \
                              label.color=$BAR_COLOR \
                              icon.color=$BAR_COLOR
else
  sketchybar --set $ITEM_NAME background.drawing=off \
                              label.color=$ACCENT_COLOR \
                              icon.color=$ACCENT_COLOR
fi