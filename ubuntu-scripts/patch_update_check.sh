#!/bin/bash
mkdir -p ~/reports
echo "Checking for available updates..."
sudo apt update -y
sudo apt list --upgradable >> ~/reports/updates_report.txt
echo "Update report saved to ~/reports/updates_report.txt"

