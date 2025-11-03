#!/bin/bash
# Basic SSH-based switch config backup. Replace with vendor CLI if needed.
SWITCHS=("192.168.1.10" "192.168.1.11")
USER="admin"
BACKUP_DIR="$PWD/backups"
mkdir -p "$BACKUP_DIR"

for ip in "${SWITCHS[@]}"; do
  echo "Backing up $ip..."
  ssh $USER@$ip "show running-config" > "$BACKUP_DIR/switch_${ip}_$(date +%Y%m%d_%H%M).cfg" 2>/dev/null
  if [ $? -eq 0 ]; then
    echo "Saved backup for $ip"
  else
    echo "Failed to backup $ip"
  fi
done
