#!/bin/bash
OUT="$HOME/reports/firewall_audit.txt"
mkdir -p "$HOME/reports"
echo "Firewall Audit - $(date)" > "$OUT"

if command -v ufw >/dev/null 2>&1; then
  echo "UFW status:" >> "$OUT"
  sudo ufw status verbose >> "$OUT"
elif command -v firewall-cmd >/dev/null 2>&1; then
  echo "firewalld status:" >> "$OUT"
  sudo firewall-cmd --list-all >> "$OUT"
elif command -v iptables >/dev/null 2>&1; then
  echo "iptables rules:" >> "$OUT"
  sudo iptables -L -v -n >> "$OUT"
else
  echo "No supported firewall utility found" >> "$OUT"
fi

echo "Saved to $OUT"
