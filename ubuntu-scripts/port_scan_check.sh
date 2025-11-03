#!/bin/bash
# Quick local port scan using ss
OUT="$HOME/reports/port_scan.txt"
mkdir -p "$HOME/reports"

echo "Port Scan - $(date)" > "$OUT"
ss -tuln | sed -n '1,200p' >> "$OUT"

echo "Saved to $OUT"
