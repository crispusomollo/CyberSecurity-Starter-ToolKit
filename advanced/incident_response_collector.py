#!/usr/bin/env python3
# Collect basic logs and system info for triage (non-invasive)
import os, shutil
outdir = os.path.expanduser("~/reports/incident_snapshot")
os.makedirs(outdir, exist_ok=True)
# Example copies (modify per policy)
for f in ["/var/log/syslog", "/var/log/auth.log"]:
    if os.path.exists(f):
        shutil.copy(f, outdir)
print("Incident snapshot created at", outdir)
