#!/bin/bash
OUT="$HOME/reports/open_ports.txt"
mkdir -p "$HOME/reports"
echo "Open Ports Audit - $(date)" > "$OUT"
ss -tuln | sed -n '1,200p' >> "$OUT"
echo "Saved to $OUT"
