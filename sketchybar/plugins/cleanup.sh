#!/bin/bash

# Cleanup script to stop the aerospace daemon when SketchyBar exits

CONFIG_DIR="/Users/frozenbloo/.config/sketchybar"
"$CONFIG_DIR/plugins/aerospace_daemon_manager.sh" stop