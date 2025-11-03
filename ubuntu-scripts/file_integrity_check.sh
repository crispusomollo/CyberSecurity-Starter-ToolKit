#!/bin/bash
# Basic file integrity snapshot of /etc and /usr/bin
SNAP="$HOME/reports/file_integrity_$(date +%Y%m%d).sha256"
mkdir -p "$HOME/reports"
echo "Creating file integrity snapshot at $SNAP"
find /etc /usr/bin -type f -readable -print0 2>/dev/null | xargs -0 sha256sum 2>/dev/null > "$SNAP"
echo "Snapshot saved to $SNAP"
