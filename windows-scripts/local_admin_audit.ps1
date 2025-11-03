Import-Module ActiveDirectory

$reportDir = "C:\Reports"
if (!(Test-Path $reportDir)) { New-Item -Path $reportDir -ItemType Directory -Force }

$computers = Get-ADComputer -Filter * | Select-Object -ExpandProperty Name
$results = @()

foreach ($computer in $computers) {
    try {
        $admins = Invoke-Command -ComputerName $computer -ScriptBlock { Get-LocalGroupMember -Group "Administrators" } -ErrorAction Stop
        foreach ($admin in $admins) {
            $results += [PSCustomObject]@{
                Computer = $computer
                Admin = $admin.Name
                ObjectType = $admin.ObjectClass
            }
        }
    } catch {
        $results += [PSCustomObject]@{
            Computer = $computer
            Admin = "ERROR: $_"
            ObjectType = "Error"
        }
    }
}

$results | Export-Csv -Path "$reportDir\LocalAdminAudit.csv" -NoTypeInformation -Force
Write-Host "Saved to $reportDir\LocalAdminAudit.csv"
