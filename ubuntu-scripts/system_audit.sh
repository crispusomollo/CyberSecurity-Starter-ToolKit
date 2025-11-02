#!/bin/bash
mkdir -p ~/reports
echo "System Report - $(hostname)" > ~/reports/sys_audit.txt
echo "=============================" >> ~/reports/sys_audit.txt
echo -e "\nOS Info:" >> ~/reports/sys_audit.txt
lsb_release -a >> ~/reports/sys_audit.txt
echo -e "\nUsers:" >> ~/reports/sys_audit.txt
cut -d: -f1 /etc/passwd >> ~/reports/sys_audit.txt
echo -e "\nSudoers:" >> ~/reports/sys_audit.txt
getent group sudo >> ~/reports/sys_audit.txt
echo -e "\nLast Logins:" >> ~/reports/sys_audit.txt
last -a | head -n 10 >> ~/reports/sys_audit.txt
echo "Report saved to ~/reports/sys_audit.txt"

