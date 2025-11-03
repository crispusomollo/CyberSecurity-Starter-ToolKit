Import-Module ActiveDirectory

param(
    [int]$DaysInactive = 90
)

$reportDir = "C:\Reports"
if (!(Test-Path $reportDir)) { New-Item -Path $reportDir -ItemType Directory -Force }

$cutoff = (Get-Date).AddDays(-$DaysInactive)
Write-Host "Finding accounts with LastLogonDate before $cutoff"

Get-ADUser -Filter * -Properties LastLogonDate |
Where-Object { $_.LastLogonDate -and $_.LastLogonDate -lt $cutoff } |
Select-Object Name, SamAccountName, LastLogonDate |
Export-Csv -Path "$reportDir\InactiveUsers.csv" -NoTypeInformation -Force

Write-Host "Saved to $reportDir\InactiveUsers.csv"
