# Check Windows Defender status and Controlled Folder Access where available
$reportDir = "C:\Reports"
if (!(Test-Path $reportDir)) { New-Item -Path $reportDir -ItemType Directory -Force }

"Ransomware Protection Report - $(Get-Date)" | Out-File "$reportDir\RansomwareProtection.txt"
if (Get-Command -Name Get-MpComputerStatus -ErrorAction SilentlyContinue) {
    Get-MpComputerStatus | Select AntivirusEnabled, RealTimeProtectionEnabled, AMServiceEnabled | Out-File "$reportDir\RansomwareProtection.txt" -Append
    try {
        Get-MpPreference | Select -Property ControlledFolderAccess | Out-File "$reportDir\RansomwareProtection.txt" -Append
    } catch { "ControlledFolderAccess: Not available or requires elevated privileges" | Out-File "$reportDir\RansomwareProtection.txt" -Append }
} else {
    "Windows Defender not present or cmdlets unavailable." | Out-File "$reportDir\RansomwareProtection.txt" -Append
}

Write-Host "Saved to $reportDir\RansomwareProtection.txt"
