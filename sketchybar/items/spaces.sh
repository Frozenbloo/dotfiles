#!/bin/bash

SPACE_SIDS=(1 2 3 4 5 6 7 8 9 10)

for sid in "${SPACE_SIDS[@]}"
do
  sketchybar --add item space.$sid left                                 \
             --set space.$sid icon=$sid                                  \
                              label.font="sketchybar-app-font:Regular:16.0" \
                              label.padding_right=20                     \
                              label.y_offset=-1                          \
                              click_script="aerospace workspace $sid && $PLUGIN_DIR/aerospace_workspace_change.sh"
done                    

sketchybar --add item space_separator left                             \
           --set space_separator icon="􀆊"                                \
                                 icon.color=$ACCENT_COLOR \
                                 icon.padding_left=4                   \
                                 label.drawing=off                     \
                                 background.drawing=off

# Add a trigger item that can be called to update all spaces
sketchybar --add event aerospace_workspace_change \
           --add item aerospace_trigger left \
           --set aerospace_trigger drawing=off \
                                  script="$PLUGIN_DIR/aerospace_workspace_change.sh" \
           --subscribe aerospace_trigger aerospace_workspace_change 