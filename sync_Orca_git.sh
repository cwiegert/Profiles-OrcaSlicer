#!/bin/bash

# Source and destination directories
#SOURCE="/Users/corywiegert/Library/Application Support/OrcaSlicer/user/3054054929"
SOURCE="/Users/corywiegert/Library/Application Support/OrcaSlicer/user/default"
DESTINATION="/Users/corywiegert/SynologyDrive/OrcaSlicer-Configurations"


# Sync files
rsync -av --update "$SOURCE/" "$DESTINATION/"

# Optional: Navigate to the Git repo, stage, and commit changes
cd "$DESTINATION" || exit
git add -A
git commit -m "Auto-synced changes from parent directory"
git push
