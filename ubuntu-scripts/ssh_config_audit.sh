#!/bin/bash
# Check for insecure sshd_config settings
FILE="/etc/ssh/sshd_config"
OUT="$HOME/reports/ssh_audit.txt"
mkdir -p "$HOME/reports"

echo "SSH Config Audit - $(date)" > "$OUT"
if [ -f "$FILE" ]; then
  echo "sshd_config found: $FILE" >> "$OUT"
  grep -E "PermitRootLogin|PasswordAuthentication|PermitEmptyPasswords|PubkeyAuthentication" $FILE >> "$OUT"
else
  echo "sshd_config not found" >> "$OUT"
fi

echo "Audit saved to $OUT"
