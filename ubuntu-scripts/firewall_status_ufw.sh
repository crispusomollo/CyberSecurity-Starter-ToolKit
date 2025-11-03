#!/bin/bash
OUT="$HOME/reports/firewall_status.txt"
mkdir -p "$HOME/reports"
echo "Firewall Status Report - $(date)" > "$OUT"

if command -v ufw >/dev/null 2>&1; then
  echo "UFW detected" >> "$OUT"
  sudo ufw status verbose >> "$OUT"
elif command -v firewall-cmd >/dev/null 2>&1; then
  echo "firewalld detected" >> "$OUT"
  sudo firewall-cmd --list-all >> "$OUT"
elif command -v iptables >/dev/null 2>&1; then
  echo "iptables rules" >> "$OUT"
  sudo iptables -L -v -n >> "$OUT"
else
  echo "No supported firewall tool detected" >> "$OUT"
fi

echo "Saved to $OUT"
