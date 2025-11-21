#!/bin/bash

# Define the save directory and ensure it exists
SCR_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCR_DIR"

# Define the filename format (e.g., Screenshot_2025-11-21_09-30-00.png)
FILENAME="Screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"
FILE_PATH="$SCR_DIR/$FILENAME"

# ----------------------------------------------------------------------
# 1. Use slurp to select an area.
# 2. Use grim to capture the selected area.
# 3. Pipe the image output (-) to `tee`.
# 4. `tee` does two things:
#    a) Saves a copy to the file path.
#    b) Passes a copy to the next command (wl-copy).
# 5. `wl-copy` copies the image data to the clipboard.
# ----------------------------------------------------------------------

# Command for area screenshot (This command opens the region selector)
grim -g "$(slurp)" - | tee "$FILE_PATH" | wl-copy

# Send a notification on completion (requires 'dunst' or 'mako' running)
notify-send "Screenshot Captured" "Saved to: $FILENAME and copied to clipboard."
