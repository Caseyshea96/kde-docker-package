$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath $PSScriptRoot

$java = Get-ChildItem -LiteralPath (Join-Path $PSScriptRoot 'runtime') -Recurse -Filter java.exe -ErrorAction SilentlyContinue |
    Where-Object { $_.FullName -match '[\\/]bin[\\/]java\.exe$' } |
    Select-Object -First 1 -ExpandProperty FullName

if (-not $java) {
    $javaCommand = Get-Command java -ErrorAction SilentlyContinue
    if ($javaCommand) { $java = $javaCommand.Source }
}

if (-not $java) {
    Write-Error 'Java 25 was not found. Run setup-java.ps1 first.'
}

$minMemory = if ($env:PAPER_MIN_MEMORY) { $env:PAPER_MIN_MEMORY } else { '2G' }
$maxMemory = if ($env:PAPER_MAX_MEMORY) { $env:PAPER_MAX_MEMORY } else { '4G' }

& $java "-Xms$minMemory" "-Xmx$maxMemory" '-jar' 'paper-26.1.2-74.jar' '--nogui'
