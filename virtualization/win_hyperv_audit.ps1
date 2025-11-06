<#
.SYNOPSIS
    Hyper-V Security Audit Script
.DESCRIPTION
    Checks VM configurations for resource limits, secure boot, network exposure,
    and optionally applies isolation and firewall rules.
.PARAMETER Apply
    Apply hardening (enables Secure Boot, disables external NICs).
.EXAMPLE
    .\win_hyperv_audit.ps1
    .\win_hyperv_audit.ps1 -Apply
#>

param([switch]$Apply)

Write-Host "=== Hyper-V Security Audit ===" -ForegroundColor Cyan

# Check for Hyper-V feature
if (-not (Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All).State -eq "Enabled") {
    Write-Host "[!] Hyper-V not enabled on this system." -ForegroundColor Red
    exit
}

$vms = Get-VM
if (-not $vms) {
    Write-Host "[i] No VMs detected." -ForegroundColor Yellow
    exit
}

foreach ($vm in $vms) {
    Write-Host "`nInspecting VM: $($vm.Name)" -ForegroundColor Cyan
    $vmNetwork = Get-VMNetworkAdapter -VMName $vm.Name

    Write-Host " - State: $($vm.State)"
    Write-Host " - Dynamic Memory: $($vm.DynamicMemoryEnabled)"
    Write-Host " - Secure Boot: $($vm.SecuritySettings.SecureBootEnabled)"
    Write-Host " - Network: $($vmNetwork.SwitchName)"

    if (-not $vm.SecuritySettings.SecureBootEnabled) {
        Write-Host " [!] Secure Boot not enabled." -ForegroundColor Yellow
    }

    if ($vmNetwork.SwitchName -eq "Default Switch") {
        Write-Host " [!] VM attached to Default Switch (NAT). Check for exposure." -ForegroundColor Yellow
    }
}

if ($Apply) {
    Write-Host "`n🧰 Applying Hyper-V hardening..." -ForegroundColor Cyan

    foreach ($vm in $vms) {
        # Enable Secure Boot for Generation 2 VMs
        $sec = Get-VMFirmware -VMName $vm.Name -ErrorAction SilentlyContinue
        if ($sec -and -not $sec.SecureBoot) {
            Set-VMFirmware -VMName $vm.Name -EnableSecureBoot On
            Write-Host " [+] Enabled Secure Boot for $($vm.Name)"
        }

        # Disable network adapters connected to exposed switches
        $nics = Get-VMNetworkAdapter -VMName $vm.Name
        foreach ($nic in $nics) {
            if ($nic.SwitchName -eq "Default Switch") {
                Disconnect-VMNetworkAdapter -VMName $vm.Name -Name $nic.Name
                Write-Host " [+] Disconnected $($nic.Name) from Default Switch."
            }
        }
    }

    # Enable Windows Firewall for host
    Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
    Write-Host "✅ Hyper-V hardening complete." -ForegroundColor Green
}

