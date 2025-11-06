#!/bin/bash
echo "=== SSH Audit ==="
grep -E 'PermitRootLogin|PasswordAuthentication' /etc/ssh/sshd_config
if [[ $1 == "--apply" ]]; then
  echo "Backing up sshd_config..."
  cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak_$(date +%F)
  sed -i 's/^#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
  sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
  systemctl restart sshd
  echo "SSH hardened ✅"
fi

