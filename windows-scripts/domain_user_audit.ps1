Import-Module ActiveDirectory
Get-ADUser -Filter * -Properties Name, SamAccountName, Enabled, PasswordLastSet, LastLogonDate |
Select-Object Name, SamAccountName, Enabled, PasswordLastSet, LastLogonDate |
Export-Csv -Path "C:\Reports\DomainUserAudit.csv" -NoTypeInformation
Write-Host "Domain user audit exported to C:\Reports\DomainUserAudit.csv"

