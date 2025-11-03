#!/bin/bash
REPORT_DIR="$HOME/reports"
mkdir -p "$REPORT_DIR"
OUT="$REPORT_DIR/sys_audit.txt"

echo "System Report - $(hostname) - $(date)" > "$OUT"
echo "OS Info:" >> "$OUT"
lsb_release -a >> "$OUT" 2>/dev/null || uname -a >> "$OUT"

echo -e "\nUsers:" >> "$OUT"
cut -d: -f1 /etc/passwd >> "$OUT"

echo -e "\nSudoers (group 'sudo'):" >> "$OUT"
getent group sudo >> "$OUT" 2>/dev/null || echo "No sudo group found" >> "$OUT"

echo -e "\nLast Logins:" >> "$OUT"
last -a | head -n 20 >> "$OUT"

echo -e "\nDisk Usage:" >> "$OUT"
df -h >> "$OUT"

echo "Report saved to $OUT"
