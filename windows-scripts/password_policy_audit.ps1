Import-Module ActiveDirectory
Get-ADUser -Filter * -Properties PasswordLastSet |
Select-Object Name, SamAccountName, PasswordLastSet |
Export-Csv "C:\Reports\PasswordPolicyAudit.csv" -NoTypeInformation
Write-Host "Password policy audit exported to C:\Reports\PasswordPolicyAudit.csv"

