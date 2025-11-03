# Check for installed hotfixes and last reboot time

$reportDir = "C:\Reports"
if (!(Test-Path $reportDir)) { New-Item -Path $reportDir -ItemType Directory -Force }

"Patch Status Report - $(Get-Date)" | Out-File "$reportDir\PatchStatus.txt"
Get-HotFix | Select HotFixID, Description, InstalledOn | Out-File "$reportDir\PatchStatus.txt" -Append
"Last Boot Time: $(Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime" | Out-File "$reportDir\PatchStatus.txt" -Append

Write-Host "Saved to $reportDir\PatchStatus.txt"
