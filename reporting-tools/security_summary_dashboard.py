#!/usr/bin/env python3
# Minimal summary generator: counts CSV files and creates a text summary
import os, glob
out = os.path.expanduser("~/reports/security_dashboard.txt")
csvs = glob.glob(os.path.expanduser("~/reports/*.csv"))
with open(out, "w") as fh:
    fh.write("Security Dashboard Summary\n")
    fh.write("========================\n")
    fh.write(f"CSV reports found: {len(csvs)}\n")
    for c in csvs:
        fh.write(f"- {os.path.basename(c)}\n")
print("Dashboard saved to", out)
