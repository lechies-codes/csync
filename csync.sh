#!/usr/bin/env bash

TARGET_DIR=$(realpath "${1:-.}")
OUTPUT_FILE="$HOME/.config/cmus/lib.pl"
echo "Syncing library..."
find "$TARGET_DIR" -type f > "$OUTPUT_FILE"
echo "Library synced."

