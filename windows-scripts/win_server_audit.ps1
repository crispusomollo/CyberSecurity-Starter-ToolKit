param([switch]$Apply)
Write-Host "=== Windows Server Audit ==="
Get-LocalUser | Select Name, Enabled, LastLogon
if ($Apply) {
    Set-ItemProperty -Path "HKLM:\\System\\CurrentControlSet\\Control\\Terminal Server" -Name "fDenyTSConnections" -Value 1
    Write-Host "RDP Disabled ✅"
}

