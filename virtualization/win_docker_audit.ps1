<#
.SYNOPSIS
    Docker Desktop Security Audit Script (Windows)
.DESCRIPTION
    Audits Docker Desktop for privileged or outdated containers, checks daemon settings,
    and can apply basic hardening.
.PARAMETER Apply
    Apply remediations (stop privileged containers, prune old images, set isolation defaults).
.EXAMPLE
    .\win_docker_audit.ps1
    .\win_docker_audit.ps1 -Apply
#>

param([switch]$Apply)

Write-Host "=== Docker Desktop Security Audit ===" -ForegroundColor Cyan

# Check Docker CLI
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "[!] Docker CLI not found." -ForegroundColor Red
    exit
}

# Check privileged containers
Write-Host "`n1️⃣ Checking for privileged containers..."
$privileged = docker ps --filter "status=running" --filter "privileged=true" --format "{{.Names}}"
if ($privileged) {
    Write-Host "[!] Privileged containers detected:" -ForegroundColor Yellow
    $privileged | ForEach-Object { Write-Host " - $_" }
} else {
    Write-Host "[✓] No privileged containers running." -ForegroundColor Green
}

# Check outdated images
Write-Host "`n2️⃣ Checking for outdated images..."
$outdated = docker images --filter "dangling=true" --format "{{.Repository}}:{{.Tag}}"
if ($outdated) {
    Write-Host "[!] Found dangling/outdated images:" -ForegroundColor Yellow
    $outdated | ForEach-Object { Write-Host " - $_" }
} else {
    Write-Host "[✓] No outdated images found." -ForegroundColor Green
}

# Check daemon.json (default path on Windows)
$daemonConfig = "$env:ProgramData\Docker\config\daemon.json"
if (Test-Path $daemonConfig) {
    $daemon = Get-Content $daemonConfig | Out-String | ConvertFrom-Json
    if ($daemon.'userns-remap') {
        Write-Host "[✓] userns-remap enabled." -ForegroundColor Green
    } else {
        Write-Host "[!] userns-remap not configured." -ForegroundColor Yellow
    }
} else {
    Write-Host "[!] Docker daemon.json not found." -ForegroundColor Red
}

if ($Apply) {
    Write-Host "`n🧰 Applying Docker hardening..." -ForegroundColor Cyan

    if ($privileged) {
        Write-Host "Stopping privileged containers..."
        $privileged | ForEach-Object { docker stop $_ }
    }

    if ($outdated) {
        Write-Host "Removing outdated images..."
        docker image prune -f
    }

    # Enable user namespace remap
    if (-not (Test-Path $daemonConfig)) {
        $daemon = @{ "userns-remap" = "default" }
        $daemon | ConvertTo-Json | Set-Content $daemonConfig
        Write-Host "[+] userns-remap added to daemon.json"
    }

    Write-Host "Restarting Docker Desktop service..."
    Stop-Service -Name "com.docker.service" -Force -ErrorAction SilentlyContinue
    Start-Service -Name "com.docker.service" -ErrorAction SilentlyContinue

    Write-Host "✅ Docker hardening complete." -ForegroundColor Green
}

