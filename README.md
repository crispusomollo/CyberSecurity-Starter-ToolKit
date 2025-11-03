# Cybersecurity Champion Starter Toolkit

![GitHub Repo Size](https://img.shields.io/github/repo-size/crispusomollo/CyberSecurity-Starter-ToolKit) 
![Last Commit](https://img.shields.io/github/last-commit/crispusomollo/CyberSecurity-Starter-ToolKit) 
![License](https://img.shields.io/github/license/crispusomollo/CyberSecurity-Starter-ToolKit)

### **Technologies / Tools Covered**

![Windows](https://img.shields.io/badge/Windows-10%2F11-blue?logo=windows)  
![Windows Server](https://img.shields.io/badge/Windows%20Server-2019%2F2022%2F2025-blue?logo=windowsserver)  
![Ubuntu](https://img.shields.io/badge/Ubuntu-Linux-orange?logo=ubuntu)  
![PowerShell](https://img.shields.io/badge/PowerShell-ps-blue?logo=powershell)  
![SQL](https://img.shields.io/badge/SQL-Database-green?logo=postgresql)  
![Oracle](https://img.shields.io/badge/Oracle-DB-red?logo=oracle)  
![MySQL](https://img.shields.io/badge/MySQL-Database-blue?logo=mysql)  
![MongoDB](https://img.shields.io/badge/MongoDB-Database-green?logo=mongodb)  

---

## **Overview**
The **Cybersecurity Starter Toolkit** is designed for system administrators stepping into a cybersecurity leadership role. It provides **ready-to-use scripts, templates, and dashboards** for auditing, monitoring, and hardening:

- **Windows & Windows Server** – AD audits, local admins, password policies, server hardening  
- **Ubuntu Linux** – system audit, patch checks, sudoers audit  
- **Databases** – Oracle, SQL Server, MySQL, MongoDB user & privilege audits, backup verification  
- **Network Security** – firewall, switches, access points, CCTV cameras  

**Key Goals:**
- Improve **visibility** into accounts, privileges, network devices, and patch status  
- Promote **security hygiene** in day-to-day IT operations  
- Enable **automated reporting** for management  

---

## **Workflow Diagram**

```mermaid
flowchart TD
    A[Start: Clone Repository] --> B{Select Environment}
    B --> |Windows / Server| C[Run PowerShell Scripts]
    B --> |Ubuntu| D[Run Shell Scripts]
    B --> |Database| E{Choose DB}
    E --> |Oracle / SQL Server| F[Run SQL Scripts]
    E --> |MySQL| G[Run MySQL Scripts]
    E --> |MongoDB| H[Run MongoDB Scripts]
    B --> |Network| I[Run Network Audit Scripts]
    C --> J[Export Reports to CSV/Excel]
    D --> J
    F --> J
    G --> J
    H --> J
    I --> J
    J --> K[Populate Reporting Templates]
    K --> L[Visualize in Dashboard / Share with Management]
    L --> M[Repeat Audits Regularly]
```

> Workflow: choose environment → run scripts → export reports → populate templates → visualize → repeat.

---

## **Folder Structure**

```
Cybersecurity_Champion_Toolkit/
│
├── windows-scripts/       # PowerShell scripts for AD, local admins, server hardening
├── ubuntu-scripts/        # Linux system audit & patch scripts
├── database-scripts/      # Oracle, SQL Server, MySQL, MongoDB scripts
├── network-scripts/       # Firewall, switch, AP, CCTV audit scripts
├── report-templates/      # Excel & CSV templates for dashboards
├── README.md
├── instructions.txt
└── LICENSE
```

---

## **Getting Started**

### **1. Clone the Repository**

```bash
git clone https://github.com/crispusomollo/CyberSecurity-Starter-ToolKit.git
cd Cybersecurity_Starter_Toolkit
```

### **2. Windows & Windows Server Scripts**

* Open PowerShell as Administrator
* Navigate to `windows-scripts/` and run scripts:

```powershell
.\domain_user_audit.ps1
.\server_hardening.ps1
```

* Reports saved in `C:\Reports`.

### **3. Ubuntu Scripts**

* Make scripts executable:

```bash
chmod +x *.sh
```

* Run scripts:

```bash
./system_audit.sh
./patch_update_check.sh
```

* Reports saved in `~/reports/`.

### **4. Database Scripts**

* **Oracle / SQL Server** – run `.sql` files in your client
* **MySQL** – run `.sql` or `.sh` scripts, check `/var/backups/mysql/` for backup reports
* **MongoDB** – run `.js` scripts using `mongo` shell, check backup paths
* Always **test on non-production environments first**

### **5. Network Security Scripts**

* Run scripts in `network-scripts/` to check:

  * Firewall status
  * Switch ports via SNMP
  * Access points connected devices
  * CCTV camera status & firmware

---

## **Reporting**

* Populate results in `report-templates/audit_report_template.xlsx` or `privileged_accounts_template.csv`
* Visualize dashboards:

  * Patch compliance
  * Privileged account audits
  * Database security
  * Network device audit

---

## **Contributing**

* Fork the repository, add new scripts, templates, or improvements, and submit a Pull Request

---

## **License**

MIT License – see [LICENSE](LICENSE) for details

---

### ✅ **Tips**

* Add screenshots of report outputs for clarity
* Schedule recurring audits with Task Scheduler (Windows) or cron (Linux)
* Expand scripts gradually to include **alerts and automated remediation**

```

