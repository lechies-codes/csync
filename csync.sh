#!/usr/bin/env bash
CMUS="$HOME/.config/cmus/playlists"
TARGET_DIR=$(realpath "${1:-.}")
OUTPUT_FILE="$HOME/.config/cmus/lib.pl"

echo "Syncing library..."
find "$TARGET_DIR" -type f > "$OUTPUT_FILE"
echo "Library synced."

echo "Syncing playlist/s..."
cd "$TARGET_DIR" || exit
for dir in */; do
    [ -e "$dir" ] || continue
    playlist_name=$(basename "$dir")
    find "$dir" -type f > "$CMUS/${playlist_name}"
    echo "Created playlist: ${playlist_name}"
done
echo "Playlists synced."

