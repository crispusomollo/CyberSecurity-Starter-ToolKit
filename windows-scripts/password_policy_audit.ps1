Import-Module ActiveDirectory

$reportDir = "C:\Reports"
if (!(Test-Path $reportDir)) { New-Item -Path $reportDir -ItemType Directory -Force }

Get-ADUser -Filter * -Properties PasswordLastSet |
Select-Object Name, SamAccountName, PasswordLastSet |
Export-Csv -Path "$reportDir\PasswordPolicyAudit.csv" -NoTypeInformation -Force

Write-Host "Saved to $reportDir\PasswordPolicyAudit.csv"
