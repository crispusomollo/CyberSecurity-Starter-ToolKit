# Detect AD group membership changes by comparing snapshots (requires two snapshots)
param(
    [string]$oldSnapshot = "C:\Reports\AD_Groups_Old.json",
    [string]$newSnapshot = "C:\Reports\AD_Groups_New.json"
)

function Export-ADGroupsSnapshot {
    $groups = Get-ADGroup -Filter * | ForEach-Object {
        $members = Get-ADGroupMember $_.DistinguishedName -ErrorAction SilentlyContinue | Select -ExpandProperty SamAccountName -ErrorAction SilentlyContinue
        [PSCustomObject]@{Group = $_.Name; Members = $members}
    }
    return $groups
}

if (!(Test-Path $oldSnapshot)) {
    Write-Host "Old snapshot not found. Creating initial snapshot at $oldSnapshot"
    Export-ADGroupsSnapshot | ConvertTo-Json -Depth 5 | Out-File $oldSnapshot
    exit
}

$new = Export-ADGroupsSnapshot
$new | ConvertTo-Json -Depth 5 | Out-File $newSnapshot

$old = Get-Content $oldSnapshot | ConvertFrom-Json

# Simple diff by group
$report = @()
foreach ($g in $new) {
    $oldGroup = $old | Where-Object { $_.Group -eq $g.Group }
    $added = @()
    $removed = @()
    if ($oldGroup) {
        $added = $g.Members | Where-Object { $oldGroup.Members -notcontains $_ }
        $removed = $oldGroup.Members | Where-Object { $g.Members -notcontains $_ }
    } else {
        $added = $g.Members
    }
    if ($added.Count -gt 0 -or $removed.Count -gt 0) {
        $report += [PSCustomObject]@{Group=$g.Group;Added=$added -join ",";Removed=$removed -join ","}
    }
}

$report | Export-Csv -Path "C:\Reports\AD_Group_Changes.csv" -NoTypeInformation -Force
Write-Host "AD group changes exported to C:\Reports\AD_Group_Changes.csv"
