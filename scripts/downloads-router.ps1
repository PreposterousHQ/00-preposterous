$downloads = "$env:USERPROFILE\Downloads"
$prep = "C:\Preposterous"
$logFile = "$prep\00-command-center\diagnostics\downloads-router-log.txt"
function Log($msg) { $ts = Get-Date -Format "yyyy-MM-dd HH:mm:ss"; Add-Content -Path $logFile -Value "$ts  $msg" -ErrorAction SilentlyContinue }
$files = Get-ChildItem -Path $downloads -File -ErrorAction SilentlyContinue
if ($files.Count -eq 0) { exit }
Log "--- Auto-run: $($files.Count) files ---"
foreach ($file in $files) {
    $n = $file.Name.ToLower(); $ext = $file.Extension.ToLower(); $dest = $null
    if ($n -match "clipchamp") { Log "  DEL: $($file.Name)"; Remove-Item $file.FullName -Force -EA SilentlyContinue; continue }
    if ($ext -match "^\.(exe|msi)$" -and $file.LastWriteTime -lt (Get-Date).AddDays(-7)) { Log "  DEL: $($file.Name)"; Remove-Item $file.FullName -Force -EA SilentlyContinue; continue }
    if ($ext -match "^\.(pdf|doc|docx|txt|md|pptx|xlsx)$") {
        if ($n -match "mental.?wealth|mental.?health|consortium|psychepath|one.?mind|unbreakable") { $dest = "$prep\01-mental-wealth" }
        elseif ($n -match "storyliving|syntony|fullofit|trimtab|scenius|metta|fractal.?impact") { $dest = "$prep\02-storylivingry-studio" }
        elseif ($n -match "esp.?fund|philanthropy|cohearts") { $dest = "$prep\03-esp" }
        elseif ($n -match "realization|realize") { $dest = "$prep\04-realization-labs" }
        elseif ($n -match "invoice|receipt") { $dest = "$prep\05-operations\financial" }
        elseif ($n -match "nda|agreement|contract|amendment") { $dest = "$prep\05-operations\legal-entity" }
    }
    if (!$dest) {
        switch -Regex ($ext) {
            "^\.(mp4|mkv|avi|mov|wmv|flv|webm|m4v)$"       { $dest = "$prep\07-media-assets\video" }
            "^\.(mp3|wav|m4a|ogg|flac|aac|wma|opus|amr)$"   { $dest = "$prep\07-media-assets\audio" }
            "^\.(jpg|jpeg|png|gif|webp|bmp|svg|tiff|heic)$"  { $dest = "$prep\07-media-assets\images" }
            "^\.(pdf)$"                                       { $dest = "$prep\06-archive\_triage\downloads-docs" }
            "^\.(doc|docx|txt|md|pptx|xlsx|csv|rtf)$"        { $dest = "$prep\06-archive\_triage\downloads-docs" }
            "^\.(zip|rar|7z|tar|gz)$"                         { $dest = "$prep\06-archive\_triage\downloads-archives" }
        }
    }
    if ($dest) { if (!(Test-Path $dest)) { New-Item -ItemType Directory -Path $dest -Force | Out-Null }; Log "  ROUTE: $($file.Name) -> $dest"; Move-Item $file.FullName "$dest\$($file.Name)" -Force -EA SilentlyContinue }
}
Resolve-Path "$env:LOCALAPPDATA\Packages\Clipchamp.Clipchamp_*\LocalCache" -EA SilentlyContinue | ForEach-Object { Remove-Item "$($_.Path)\*" -Recurse -Force -EA SilentlyContinue }
Resolve-Path "$env:LOCALAPPDATA\Packages\Clipchamp.Clipchamp_*\TempState" -EA SilentlyContinue | ForEach-Object { Remove-Item "$($_.Path)\*" -Recurse -Force -EA SilentlyContinue }
