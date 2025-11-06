#!/bin/bash
# ============================================
# Virtual Machine Security Audit Script
# ============================================
# Usage:
#   bash vm_audit.sh            # audit only
#   bash vm_audit.sh --apply    # audit + remediate
# ============================================

echo "=== Virtual Machine Security Audit ==="

# Detect virtualization type
virt_type=$(systemd-detect-virt)
if [ "$virt_type" == "none" ]; then
  echo "[✓] Not running in a virtualized environment."
else
  echo "[i] Virtualization detected: $virt_type"
fi

# Check for hypervisor tools (VMWare, KVM, VirtualBox)
echo
echo "1️⃣ Checking hypervisor guest tools..."
if command -v vmtoolsd >/dev/null 2>&1; then
  echo "[✓] VMware Tools installed."
elif command -v qemu-ga >/dev/null 2>&1; then
  echo "[✓] QEMU Guest Agent installed."
elif command -v VBoxService >/dev/null 2>&1; then
  echo "[✓] VirtualBox Guest Additions installed."
else
  echo "[!] No guest tools detected. Consider installing for better host-guest integration."
fi

# Check network exposure
echo
echo "2️⃣ Checking open ports..."
ss -tuln | awk 'NR==1 || /LISTEN/'
echo
echo "3️⃣ Checking for bridged network interfaces..."
ip link show | grep -E "br-|vnet|virbr" && echo "[!] Bridged interfaces detected." || echo "[✓] No bridged interfaces found."

if [[ $1 == "--apply" ]]; then
  echo
  echo "🧰 Applying VM hardening..."

  # Disable bridged interfaces (for isolated VMs)
  for iface in $(ip link show | grep -E "br-|vnet|virbr" | awk -F: '{print $2}' | xargs); do
    echo "Disabling interface: $iface"
    ip link set "$iface" down
  done

  # Firewall protection
  if command -v ufw >/dev/null 2>&1; then
    ufw default deny incoming
    ufw default allow outgoing
    ufw enable
    echo "[✓] Firewall applied for VM isolation."
  fi

  echo "✅ VM hardening complete."
fi

