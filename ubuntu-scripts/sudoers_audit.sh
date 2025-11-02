#!/bin/bash
mkdir -p ~/reports
echo "Sudoers Audit - $(hostname)" > ~/reports/sudoers_report.txt
getent group sudo >> ~/reports/sudoers_report.txt
echo "Report saved to ~/reports/sudoers_report.txt"

