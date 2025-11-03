<# Server hardening diagnostic script.
   Non-destructive checks only. Review output and implement recommendations manually. #>

$reportDir = "C:\Reports"
if (!(Test-Path $reportDir)) { New-Item -Path $reportDir -ItemType Directory -Force }
$report = "$reportDir\Server_Hardening_Report.txt"

"Windows Server Hardening Report - $(Get-Date)" | Out-File $report
"=====================================================" | Out-File $report -Append

"Firewall Profiles:" | Out-File $report -Append
Get-NetFirewallProfile | Select Name, Enabled | Out-File $report -Append

"`nWindows Update Service:" | Out-File $report -Append
Get-Service -Name wuauserv | Select Name, Status, StartType | Out-File $report -Append

"`nRDP (fDenyTSConnections):" | Out-File $report -Append
try {
    $rdp = Get-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name fDenyTSConnections -ErrorAction Stop
    "fDenyTSConnections = $($rdp.fDenyTSConnections)" | Out-File $report -Append
} catch {
    "RDP setting not found or error: $_" | Out-File $report -Append
}

"`nPassword Policy (net accounts):" | Out-File $report -Append
net accounts | Out-File $report -Append

"`nSMB Signing (LanmanServer):" | Out-File $report -Append
Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name requiresecuritysignature -ErrorAction SilentlyContinue | Out-File $report -Append

"`nAudit Policy:" | Out-File $report -Append
auditpol /get /category:* | Out-File $report -Append

"`nBitLocker Status (if available):" | Out-File $report -Append
if (Get-Command -Name Get-BitLockerVolume -ErrorAction SilentlyContinue) {
    Get-BitLockerVolume | Select MountPoint, VolumeStatus, KeyProtector | Out-File $report -Append
} else {
    "BitLocker cmdlets not present on this system." | Out-File $report -Append
}

"`nCompleted: $(Get-Date)" | Out-File $report -Append
Write-Host "Hardening report saved to $report"
