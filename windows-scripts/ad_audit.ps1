param([switch]$Apply)
Import-Module ActiveDirectory
Write-Host "=== Active Directory Audit ==="
Get-ADDefaultDomainPasswordPolicy | Out-File .\\ad_password_policy.txt
if ($Apply) {
    $old = (Get-Date).AddDays(-180)
    Get-ADUser -Filter {LastLogonDate -lt $old -and Enabled -eq $true} | Disable-ADAccount
}

