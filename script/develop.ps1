# Stop on errors
$ErrorActionPreference = "Stop"

Set-Location -Path (Join-Path -Path $PSScriptRoot -ChildPath "..")

Remove-Item -Recurse -Force "dist"

# Quit all background tasks when script exits
$jobs = @()

# Run tsc once as rollup expects those files
npm exec -- tsc
npx rollup -c

$jobs += Start-Job -ScriptBlock { npm exec -- tsc --watch }
$jobs += Start-Job -ScriptBlock { npm exec -- serve -p 5004 }

# Wait for all jobs to complete
$jobs | ForEach-Object { Receive-Job -Job $_ -Wait }