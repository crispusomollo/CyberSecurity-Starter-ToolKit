#!/usr/bin/env python3
# Simple syslog forwarder placeholder: reads files in ~/reports and prints to stdout.
import glob
for f in glob.glob("~/reports/*"):
    print("Forwarding", f)
# Replace with real syslog forwarding logic or integration with SIEM.
