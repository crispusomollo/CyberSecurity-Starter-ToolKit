#!/bin/bash
BACKUP_DIR="/var/backups/mysql"
OUT="$HOME/reports/mysql_backup_report.txt"
mkdir -p "$HOME/reports"
echo "MySQL Backup Report - $(date)" > "$OUT"

if [ -d "$BACKUP_DIR" ]; then
  echo "Recent backups:" >> "$OUT"
  ls -lh "$BACKUP_DIR" | tail -n 20 >> "$OUT"
else
  echo "Backup directory not found: $BACKUP_DIR" >> "$OUT"
fi

echo "Saved to $OUT"
