Import-Module ActiveDirectory

$reportDir = "C:\Reports"
if (!(Test-Path $reportDir)) { New-Item -Path $reportDir -ItemType Directory -Force }

Write-Host "Exporting domain users..."
Get-ADUser -Filter * -Properties Name, SamAccountName, Enabled, PasswordLastSet, LastLogonDate |
Select-Object Name, SamAccountName, Enabled, @{Name='PasswordLastSet';Expression={$_.PasswordLastSet}}, @{Name='LastLogonDate';Expression={$_.LastLogonDate}} |
Export-Csv -Path "$reportDir\DomainUserAudit.csv" -NoTypeInformation -Force
Write-Host "Saved to $reportDir\DomainUserAudit.csv"
