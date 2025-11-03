# Simple event log parser to find failed logons and privilege use
$reportDir = "C:\Reports"
if (!(Test-Path $reportDir)) { New-Item -Path $reportDir -ItemType Directory -Force }

$start = (Get-Date).AddDays(-7)
$events = Get-WinEvent -FilterHashtable @{LogName="Security"; StartTime=$start} -ErrorAction SilentlyContinue |
Where-Object { $_.Id -in 4625, 4672, 4648 } |
Select TimeCreated, Id, LevelDisplayName, @{Name='Message';Expression={$_.Message}}

$events | Export-Csv -Path "$reportDir\SecurityEvents_Last7days.csv" -NoTypeInformation -Force
Write-Host "Exported security events to $reportDir\SecurityEvents_Last7days.csv"
