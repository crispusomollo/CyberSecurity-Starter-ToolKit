#!/usr/bin/env python3
"""Simple aggregator: merge CSV reports in Reports/ into a single summary CSV."""
import csv, glob, os

out_dir = os.path.expanduser("~/reports")
os.makedirs(out_dir, exist_ok=True)
out_file = os.path.join(out_dir, "audit_summary.csv")

csv_files = glob.glob(os.path.join(out_dir, "*.csv"))
fields = set()
rows = []

for f in csv_files:
    try:
        with open(f, newline='', encoding='utf-8') as fh:
            reader = csv.DictReader(fh)
            for r in reader:
                rows.append(r)
                fields.update(r.keys())
    except Exception as e:
        pass

fields = list(fields)
with open(out_file, "w", newline='', encoding='utf-8') as of:
    writer = csv.DictWriter(of, fieldnames=fields)
    writer.writeheader()
    for r in rows:
        writer.writerow(r)

print("Audit summary saved to", out_file)
