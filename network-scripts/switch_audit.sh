#!/bin/bash
echo "=== Switch Audit ==="
read -p "Enter switch IP: " ip
snmpwalk -v2c -c public $ip 1.3.6.1.2.1.1.1.0

