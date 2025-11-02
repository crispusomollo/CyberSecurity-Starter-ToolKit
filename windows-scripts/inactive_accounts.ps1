$DaysInactive = 90
$Time = (Get-Date).AddDays(-$DaysInactive)
Get-ADUser -Filter * -Properties LastLogonDate |
Where-Object { $_.LastLogonDate -lt $Time } |
Select-Object Name, SamAccountName, LastLogonDate |
Export-Csv "C:\Reports\InactiveUsers.csv" -NoTypeInformation
Write-Host "Inactive users report exported to C:\Reports\InactiveUsers.csv"

