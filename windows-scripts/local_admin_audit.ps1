$computers = Get-ADComputer -Filter * | Select-Object -ExpandProperty Name
$results = @()
foreach ($computer in $computers) {
    try {
        $admins = Get-LocalGroupMember -Group "Administrators" -ComputerName $computer
        foreach ($admin in $admins) {
            $results += [PSCustomObject]@{
                Computer = $computer
                Admin = $admin.Name
                ObjectType = $admin.ObjectClass
            }
        }
    } catch {
        Write-Warning "Cannot connect to $computer"
    }
}
$results | Export-Csv -Path "C:\Reports\LocalAdminAudit.csv" -NoTypeInformation
Write-Host "Local admin audit exported to C:\Reports\LocalAdminAudit.csv"

