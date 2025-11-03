#!/bin/bash
OUT="$HOME/reports/cctv_status.txt"
mkdir -p "$HOME/reports"
LIST="$PWD/cctv_list.txt"
echo "CCTV Status Check - $(date)" > "$OUT"

if [ ! -f "$LIST" ]; then
  echo "CCTV list ($LIST) not found. Create one IP per line." >> "$OUT"
else
  while read -r ip; do
    echo -n "$ip - " >> "$OUT"
    ping -c1 -W1 $ip >/dev/null 2>&1
    if [ $? -eq 0 ]; then
      echo "Online" >> "$OUT"
    else
      echo "Offline or unreachable" >> "$OUT"
    fi
  done < "$LIST"
fi

echo "Saved to $OUT"
