#!/bin/bash
OUT="$HOME/reports/ap_audit.txt"
mkdir -p "$HOME/reports"
echo "Access Point Audit - $(date)" > "$OUT"

# Basic wireless scan using nmcli (useful when run from a workstation)
if command -v nmcli >/dev/null 2>&1; then
  nmcli -f SSID,SECURITY,SIGNAL dev wifi list >> "$OUT"
else
  echo "nmcli not available. For APs with API/SSH use vendor-specific commands." >> "$OUT"
fi

echo "Saved to $OUT"
