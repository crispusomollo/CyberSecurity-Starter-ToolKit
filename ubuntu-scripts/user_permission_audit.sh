#!/bin/bash
OUT="$HOME/reports/user_permissions.txt"
mkdir -p "$HOME/reports"

echo "User Permission Audit - $(date)" > "$OUT"
echo -e "\nUsers with UID 0:" >> "$OUT"
awk -F: '$3==0{print $1}' /etc/passwd >> "$OUT"

echo -e "\nUsers in sudo group:" >> "$OUT"
getent group sudo | awk -F: '{print $4}' >> "$OUT"

echo -e "\nSudoers file content:" >> "$OUT"
sudo cat /etc/sudoers 2>/dev/null >> "$OUT" || echo "Need sudo to read /etc/sudoers" >> "$OUT"

echo "Saved to $OUT"
