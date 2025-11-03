#!/usr/bin/env python3
# Basic anomaly detector: looks for spikes of 'failed login' in log files in ~/reports
import glob, os, re
out = os.path.expanduser("~/reports/anomaly_report.txt")
patterns = [re.compile(r'failed', re.I), re.compile(r'fail', re.I)]
counts = {}
for f in glob.glob(os.path.expanduser("~/reports/*.txt")):
    with open(f, encoding='utf-8', errors='ignore') as fh:
        text = fh.read()
        cnt = sum(1 for p in patterns for _ in p.finditer(text))
        counts[f] = cnt

with open(out, "w") as fh:
    fh.write("Anomaly Report\n")
    fh.write("================\n")
    for k,v in sorted(counts.items(), key=lambda x: x[1], reverse=True):
        fh.write(f"{os.path.basename(k)}: {v}\n")

print("Anomaly report saved to", out)
