#!/usr/bin/env python3
# Collect basic inventory from local machine
import platform, json, os
out = os.path.expanduser("~/reports/endpoint_inventory.json")
data = {
    "hostname": platform.node(),
    "os": platform.platform(),
}
os.makedirs(os.path.dirname(out), exist_ok=True)
with open(out, "w") as fh:
    json.dump(data, fh, indent=2)
print("Inventory saved to", out)
