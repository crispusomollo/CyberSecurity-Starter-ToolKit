# 🛡️ Cybersecurity Starter Toolkit

A cross-platform security auditing and remediation toolkit designed for **enterprise IT environments** with mixed Windows, Linux, and network devices. Developed to empower system administrators and cybersecurity roles with actionable scripts for **visibility, compliance, and automation**. Audit, harden, and monitor your environment across **Windows, Linux, Databases, and Network Devices** — all in one place.

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux-blue.svg)](#)
[![Database](https://img.shields.io/badge/Database-MySQL%20%7C%20Oracle%20%7C%20MongoDB-orange.svg)](#)
[![Automation](https://img.shields.io/badge/Scripts-Bash%20%7C%20PowerShell%20%7C%20Python-yellow.svg)](#)
[![Security Level](https://img.shields.io/badge/Security-Audit%20%26%20Hardening-critical.svg)](#)
[![Contributions Welcome](https://img.shields.io/badge/Contributions-Welcome-brightgreen.svg)](../../issues)
[![Maintained](https://img.shields.io/badge/Maintained-Active-success.svg)](#)

---

##   Features

| Category | Highlights |
|-----------|-------------|
| 🪟 **Windows & Windows Server** | User audits, AD group tracking, patch checks, ransomware protection |
| 🐧 **Ubuntu / Linux** | SSH audits, file integrity, firewall & cron job reviews |
| 🧮 **Databases** | Oracle, SQL Server, MySQL, MongoDB privilege & backup checks |
| 🌐 **Network Devices** | Firewall, switch, access point, and CCTV audit automation |
| 📊 **Reporting Tools** | Automated dashboards, email alerts, and syslog forwarding |
| 🚀 **Advanced Add-ons** | Threat intel feed checks, incident response collectors |

---

## 🗂️ Folder Overview

```bash
windows-scripts/        → PowerShell scripts for endpoints & servers
ubuntu-scripts/         → Bash scripts for Linux hosts
database-scripts/       → SQL/JS scripts for DB security auditing
network-scripts/        → Infrastructure device checks (firewall, switches, APs)
virtualization/         → VM audit for virtualization type and network exposure
reporting-tools/        → Python scripts for reporting and dashboards
advanced/               → Proactive automation & threat intelligence
report-templates/       → Excel/CSV templates for reporting
```

## 🧱 FOLDER STRUCTURE

```
Cybersecurity_Champion_Toolkit/
│
├── windows-scripts/
│   ├── domain_user_audit.ps1
│   ├── local_admin_audit.ps1
│   ├── server_hardening.ps1
│   ├── patch_status.ps1
│   ├── ransomware_protection_check.ps1
│   ├── event_log_monitor.ps1
│   └── ad_group_changes.ps1
│
├── ubuntu-scripts/
│   ├── system_audit.sh
│   ├── ssh_config_audit.sh
│   ├── user_permission_audit.sh
│   ├── firewall_status_ufw.sh
│   ├── cron_audit.sh
│   ├── port_scan_check.sh
│   └── file_integrity_check.sh
│
├── database-scripts/
│   ├── oracle_user_privileges.sql
│   ├── sqlserver_logins_roles.sql
│   ├── mysql_user_privileges.sql
│   ├── mysql_backup_check.sh
│   ├── mongodb_user_privileges.js
│   └── mongodb_backup_check.js
│
├── network-scripts/
│   ├── firewall_audit.sh
│   ├── switch_config_backup.sh
│   ├── access_point_audit.sh
│   ├── cctv_status_check.sh
│   ├── open_port_audit.sh
│   └── network_inventory_scan.sh
│
├── reporting-tools/
│   ├── generate_audit_report.py
│   ├── security_summary_dashboard.py
│   ├── email_alerts.py
│   ├── log_anomaly_detector.py
│   └── syslog_forwarder.py
│
├── advanced/
│   ├── security_baseline_checker.py
│   ├── endpoint_inventory_collector.py
│   ├── threat_intel_feed_checker.py
│   └── incident_response_collector.py
│
├── report-templates/
│   ├── audit_report_template.xlsx
│   ├── privileged_accounts_template.csv
│   └── patch_dashboard_template.xlsx
│
├── README.md
├── instructions.txt
├── LICENSE
└── .gitignore
```

---

## 🧰 Getting Started

### Clone the repo:

```bash
git clone https://github.com/crispusomollo/Cybersecurity_Starter_Toolkit.git
cd Cybersecurity_Starter_Toolkit
```

### Example Usage

- Test in a lab environment before applying in production.
- Never embed credentials in scripts — use environment variables or secure vaults.

#### 🧮 Database Audit
```sql
mysql -u root -p < database-scripts/mysql_audit.sql
mongo < database-scripts/mongodb_audit.js
sqlplus sys@ORCL as sysdba @database-scripts/oracle_audit.sql
```

#### 🔐 SSH Audit & Hardening
```bash
sudo bash ssh/ssh_audit.sh --apply
```

#### 🌐 Network Security
```bash
sudo bash network/firewall_audit.sh --apply
sudo bash network/switch_audit.sh
```

#### 🐳 Docker & VM
```bash
sudo bash docker/docker_audit.sh --apply
sudo bash vm/vm_audit.sh
```

#### 🪟 Windows Server / AD
``` powershell
# Run PowerShell as Administrator
.\windows\win_server_audit.ps1 -Apply
.\windows\ad_audit.ps1 -Apply
```

#### 📊 Generate Report
```bash
python3 reporting-tools/generate_report.py
```

---

## 🧱 System Architecture

```
┌───────────────────────────────┐
│       Endpoints & Servers     │
│  (Windows / Ubuntu / Server)  │
└──────────────┬────────────────┘
               │
               ▼
┌───────────────────────────────┐
│        Databases Layer        │
│  Oracle / SQL Server / MySQL  │
│           / MongoDB           │
└──────────────┬────────────────┘
               │
               ▼
┌───────────────────────────────┐
│    Network & Infrastructure   │
│ (Firewall / Switch / AccessPt)│
└──────────────┬────────────────┘
               │
               ▼
┌───────────────────────────────┐
│      Reporting & Alerts       │
│ Dashboards / Email / Syslog   │
└───────────────────────────────┘
```

---

## 🪄 Future Additions

* Security Baseline comparison against CIS Benchmarks
* Integration with SIEM tools (e.g. Wazuh, Graylog)
* Scheduled reports & compliance scoring

---

## 📜 License

This project is licensed under the **MIT License** — feel free to use and modify with attribution.

---

## 👤 Author

**Crispus Omollo**
💻 Systems & Security Automation
📧 [crispusomollo@gmail.com](mailto:crispusomollo@gmail.com)

---

⭐ *If this project helps your organization improve internal security, give it a star on GitHub!*


