#!/bin/bash
# Simple network discovery using nmap (requires nmap)
OUT="$HOME/reports/network_scan.txt"
mkdir -p "$HOME/reports"
echo "Network Inventory Scan - $(date)" > "$OUT"
if command -v nmap >/dev/null 2>&1; then
  nmap -sn 192.168.1.0/24 -oG - | grep Up >> "$OUT"
else
  echo "nmap not installed. Install nmap to enable discovery." >> "$OUT"
fi
echo "Saved to $OUT"
