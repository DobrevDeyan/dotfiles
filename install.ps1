# Windows installer — run from repo root: .\install.ps1
# First allow scripts: Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
param()
$ErrorActionPreference = "Stop"
$here = $PSScriptRoot

function Sync-Dir($src, $dest) {
    if (-not (Test-Path $dest)) { New-Item -ItemType Directory -Force $dest | Out-Null }
    Copy-Item -Recurse -Force "$src\*" $dest
    Write-Host "  Copied $src -> $dest"
}

Write-Host "`n== Neovim config =="
$nvimConfig = "$env:LOCALAPPDATA\nvim"
if (Test-Path $nvimConfig) {
    Move-Item $nvimConfig "$nvimConfig.bak" -Force
    Write-Host "  Backed up $nvimConfig -> $nvimConfig.bak"
}
Sync-Dir "$here\nvim" $nvimConfig

Write-Host "`n== WezTerm config =="
$wezConfig = "$env:USERPROFILE\.config\wezterm"
if (-not (Test-Path $wezConfig)) { New-Item -ItemType Directory -Force $wezConfig | Out-Null }
Copy-Item "$here\wezterm\wezterm.lua" "$wezConfig\wezterm.lua" -Force
Write-Host "  Copied wezterm.lua -> $wezConfig"

Write-Host "`n== Mononoki Nerd Font =="
$fontZip = "$env:TEMP\Mononoki.zip"
$fontDir  = "$env:TEMP\MononokiNF"
$fontUrl  = "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Mononoki.zip"
Invoke-WebRequest -Uri $fontUrl -OutFile $fontZip -UseBasicParsing
Expand-Archive -Path $fontZip -DestinationPath $fontDir -Force
$shellFonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
Get-ChildItem "$fontDir\*.ttf" | ForEach-Object {
    if (-not (Test-Path "$env:WINDIR\Fonts\$($_.Name)")) {
        $shellFonts.CopyHere($_.FullName, 0x10)
        Write-Host "  Installed $($_.Name)"
    }
}
Remove-Item $fontZip, $fontDir -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "`n== VS Code theme =="
$vsExt = "$env:USERPROFILE\.vscode\extensions\forestdark-theme-1.0.0"
Sync-Dir "$here\vscode\forestdark-theme" $vsExt

Write-Host @"

== Done ==
  Neovim : open nvim, run :Lazy sync
  WezTerm: restarts automatically (Cmder at D:\cmder)
  VS Code: Ctrl+Shift+P -> Color Theme -> Forest Dark
  Font   : set 'Mononoki Nerd Font' in WezTerm if not auto-detected
"@
