#!/bin/bash

# Initialize all spaces on startup
for i in {1..10}; do
  $CONFIG_DIR/plugins/space.sh "space.$i" &
done
wait