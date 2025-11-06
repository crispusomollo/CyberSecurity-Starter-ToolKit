param([switch]$Apply)
Write-Host "=== Windows Firewall Audit ==="
Get-NetFirewallProfile
if ($Apply) {
    Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
    Write-Host "Firewall Enabled ✅"
}

