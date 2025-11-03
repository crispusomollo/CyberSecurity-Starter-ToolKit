#!/bin/bash
OUT="$HOME/reports/cron_audit.txt"
mkdir -p "$HOME/reports"

echo "Cron Jobs Audit - $(date)" > "$OUT"
for user in $(cut -f1 -d: /etc/passwd); do
  echo -e "\nCrontab for $user:" >> "$OUT"
  crontab -u $user -l 2>/dev/null >> "$OUT"
done

echo "System cron directories:" >> "$OUT"
ls -la /etc/cron.* >> "$OUT"

echo "Saved to $OUT"
