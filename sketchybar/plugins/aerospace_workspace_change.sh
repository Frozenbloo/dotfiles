#!/bin/bash

source "$CONFIG_DIR/colors.sh"

# Get the current focused workspace
CURRENT_WORKSPACE=$(aerospace list-workspaces --focused)

# Update all space items
for i in {1..10}; do
  # Check if workspace exists
  if aerospace list-workspaces --all | grep -q "^$i$"; then
    # Get apps in this workspace
    apps=$(aerospace list-windows --workspace $i --format "%{app-name}" 2>/dev/null | sort -u)
    
    icon_strip=""
    if [ -n "$apps" ] && [ "$apps" != "" ]; then
      while read -r app; do
        if [ -n "$app" ]; then
          icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
        fi
      done <<< "$apps"
    fi
    
    # Set the label for this workspace
    sketchybar --set space.$i label="$icon_strip"
    
    # Update the space appearance (selected/unselected)
    if [ "$i" = "$CURRENT_WORKSPACE" ]; then
      sketchybar --set space.$i background.drawing=on \
                           background.color=$ACCENT_COLOR \
                           label.color=$BAR_COLOR \
                           icon.color=$BAR_COLOR
    else
      sketchybar --set space.$i background.drawing=off \
                           label.color=$ACCENT_COLOR \
                           icon.color=$ACCENT_COLOR
    fi
  else
    # Workspace doesn't exist or is empty
    sketchybar --set space.$i label="" \
                         background.drawing=off \
                         label.color=$ACCENT_COLOR \
                         icon.color=$ACCENT_COLOR
  fi
done