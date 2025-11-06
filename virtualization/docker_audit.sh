#!/bin/bash
# ============================================
# Docker Security Audit Script
# ============================================
# Usage:
#   bash docker_audit.sh            # audit only
#   bash docker_audit.sh --apply    # audit + remediate
# ============================================

echo "=== Docker Security Audit ==="
echo "Checking Docker environment..."
docker info >/dev/null 2>&1 || { echo "Docker not running or not installed."; exit 1; }

echo
echo "1️⃣ Checking for privileged containers..."
privileged_containers=$(docker ps --filter "status=running" --filter "privileged=true" -q)
if [ -n "$privileged_containers" ]; then
  echo "[!] Privileged containers detected:"
  docker ps --filter "status=running" --filter "privileged=true" --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}'
else
  echo "[✓] No privileged containers running."
fi

echo
echo "2️⃣ Checking for outdated images..."
docker images --format 'table {{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.CreatedSince}}'
outdated=$(docker images | grep '<none>')
if [ -n "$outdated" ]; then
  echo "[!] Found dangling/outdated images:"
  echo "$outdated"
else
  echo "[✓] No outdated images found."
fi

echo
echo "3️⃣ Checking Docker daemon configuration..."
config_file="/etc/docker/daemon.json"
if [ -f "$config_file" ]; then
  grep -q '"userns-remap"' "$config_file" && echo "[✓] userns-remap is enabled." || echo "[!] userns-remap not configured."
else
  echo "[!] Docker daemon.json not found."
fi

if [[ $1 == "--apply" ]]; then
  echo
  echo "🧰 Applying Docker hardening..."

  # Backup daemon.json
  [ -f "$config_file" ] && cp "$config_file" "$config_file.bak_$(date +%F)"
  
  # Enable user namespace remapping if not present
  if ! grep -q '"userns-remap"' "$config_file" 2>/dev/null; then
    echo '{"userns-remap": "default"}' > "$config_file"
    systemctl restart docker
    echo "[+] userns-remap enabled and Docker restarted."
  fi

  # Stop privileged containers
  if [ -n "$privileged_containers" ]; then
    echo "Stopping privileged containers..."
    docker stop $privileged_containers
  fi

  # Remove dangling images
  if [ -n "$outdated" ]; then
    echo "Removing outdated images..."
    docker image prune -f
  fi

  echo "✅ Docker hardening complete."
fi

