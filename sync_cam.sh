#!/bin/bash

# Configuration
LOCAL_DIR="/home/kannan/UAS-SUAS-2024/ODLC-2023/src/predict/live_feed_new"
REMOTE_USER="uas-2024"
REMOTE_HOST="10.42.0.1"
REMOTE_DIR="/home/uas-2024/Camera-Feed-2023/camera_feed_C/build/data/"
EXCLUDE_FILE="/path/to/exclude/file" # Optional, if you want to exclude files

# Function to perform rsync
sync() {
    rsync -avz --delete "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR" "$LOCAL_DIR"
}

# Initial sync
sync

# Watch for changes and sync
ssh "$REMOTE_USER@$REMOTE_HOST" "inotifywait -m -r -e modify,attrib,move,close_write,create,delete $REMOTE_DIR --format '%w%f'" | while read MODIFIED
do
    echo "Detected change in $MODIFIED"
    sync
done
