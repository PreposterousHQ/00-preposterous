# preposterize.ps1
# Propagates any artifact from laptop to Drive, droplet mirrors, and GitHub
# Usage: .\preposterize.ps1 -Source <path> -Dest <ontology-path> [-Commit "message"] [-NoGit]

param(
    [Parameter(Mandatory=$true)][string]$Source,
    [Parameter(Mandatory=$true)][string]$Dest,
    [string]$Commit = "",
    [switch]$NoGit
)

$PREPOSTEROUS = "C:\Preposterous"
$DROPLET = "165.227.85.162"
$DROPLET_USER = "openclaw"
$GITHUB_REPO = "PreposterousHQ/00-preposterous"
$LOG = "$PREPOSTEROUS\00-command-center\diagnostics\propagation-log.md"
$TIMESTAMP = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

Write-Host ""
Write-Host "PREPOSTERIZE ? $TIMESTAMP" -ForegroundColor Cyan
Write-Host "Source: $Source" -ForegroundColor White
Write-Host "Destination: $PREPOSTEROUS\$Dest" -ForegroundColor White
Write-Host ""

# ?? PHASE 1: COPY TO LAPTOP ??????????????????????????????????????????????????

Write-Host "[1/4] Copying to C:\Preposterous\$Dest..." -ForegroundColor Yellow

$destPath = "$PREPOSTEROUS\$Dest"

if (-not (Test-Path $destPath)) {
    New-Item -ItemType Directory -Force -Path $destPath | Out-Null
    Write-Host "      Created destination folder." -ForegroundColor Gray
}

if (Test-Path $Source -PathType Container) {
    $folderName = Split-Path $Source -Leaf
    Copy-Item -Path $Source -Destination "$destPath\$folderName" -Recurse -Force
    Write-Host "      Folder copied: $folderName" -ForegroundColor Green
} else {
    Copy-Item -Path $Source -Destination $destPath -Force
    $fileName = Split-Path $Source -Leaf
    Write-Host "      File copied: $fileName" -ForegroundColor Green
}

# ?? PHASE 2: WAIT FOR DRIVE SYNC ?????????????????????????????????????????????

Write-Host "[2/4] Waiting for Drive for Desktop sync (30s)..." -ForegroundColor Yellow
Start-Sleep -Seconds 30
Write-Host "      Done waiting." -ForegroundColor Green

# ?? PHASE 3: TRIGGER DROPLET RCLONE SYNC ?????????????????????????????????????

Write-Host "[3/4] Triggering rclone sync on droplet..." -ForegroundColor Yellow

$sshScript = @"
rclone sync gdrive:Preposterous/00-command-center /home/openclaw/.openclaw/workspace-conductor/gdrive-mirror/00-command-center --config /home/openclaw/.config/rclone/rclone.conf 2>&1
rclone sync gdrive:Preposterous/00-command-center /home/openclaw/.openclaw/workspace-geodessa/gdrive-mirror/00-command-center --config /home/openclaw/.config/rclone/rclone.conf 2>&1
echo RCLONE_DONE
"@

$sshScript | Out-File -FilePath "$env:TEMP\preposterize-rclone.sh" -Encoding ASCII
scp -o StrictHostKeyChecking=no "$env:TEMP\preposterize-rclone.sh" "${DROPLET_USER}@${DROPLET}:/tmp/preposterize-rclone.sh" 2>&1
$result = ssh -o StrictHostKeyChecking=no "${DROPLET_USER}@${DROPLET}" "bash /tmp/preposterize-rclone.sh" 2>&1

if ($result -match "RCLONE_DONE") {
    Write-Host "      Droplet sync complete." -ForegroundColor Green
} else {
    Write-Host "      WARNING: Droplet sync may have failed. Check manually." -ForegroundColor Red
    Write-Host $result -ForegroundColor Gray
}

# ?? PHASE 4: GIT PUSH ????????????????????????????????????????????????????????

if (-not $NoGit -and $Commit -ne "") {
    Write-Host "[4/4] Pushing to GitHub..." -ForegroundColor Yellow
    
    $gitPath = "C:\PreposterousGit\00-preposterous"
    
    if (Test-Path $gitPath) {
        Push-Location $gitPath
        git add -A 2>&1
        git commit -m $Commit 2>&1
        git push 2>&1
        Pop-Location
        Write-Host "      Pushed to $GITHUB_REPO" -ForegroundColor Green
    } else {
        Write-Host "      WARNING: Git repo not found at $gitPath" -ForegroundColor Red
    }
} else {
    Write-Host "[4/4] Git skipped (no --Commit flag or --NoGit set)." -ForegroundColor Gray
}

# ?? LOG ???????????????????????????????????????????????????????????????????????

$logEntry = "## $TIMESTAMP`n- Source: $Source`n- Dest: $destPath`n- Git: $(if ($Commit) { $Commit } else { 'skipped' })`n"
Add-Content -Path $LOG -Value $logEntry

Write-Host ""
Write-Host "DONE. Artifact propagated." -ForegroundColor Cyan
Write-Host ""
