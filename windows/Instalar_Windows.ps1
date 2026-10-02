# Instalador del pack de mods de Balatro (Windows 10/11)
# - Hace copia de seguridad de los mods y ajustes anteriores (no borra nada).
# - Instala los mods en limpio (sin restos de versiones viejas: imprescindible para Multiplayer).
# - Copia los ajustes compartidos para que ambos jugadores tengan la misma configuración.
# - Busca Balatro en todas las bibliotecas de Steam e instala el inyector Lovely (version.dll).

$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$raiz = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$fecha = Get-Date -Format "yyyyMMdd_HHmmss"
$datos = Join-Path $env:APPDATA "Balatro"

function Paso($texto) { Write-Host ""; Write-Host "== $texto" -ForegroundColor Cyan }
function Ok($texto)   { Write-Host "   [OK] $texto" -ForegroundColor Green }
function Aviso($texto){ Write-Host "   [!] $texto" -ForegroundColor Yellow }

Write-Host "=====================================================" -ForegroundColor Magenta
Write-Host "   Pack de mods de Balatro en español - Instalador    " -ForegroundColor Magenta
Write-Host "=====================================================" -ForegroundColor Magenta

# 0. Comprobaciones
if (-not (Test-Path (Join-Path $raiz "Mods\smods"))) {
    throw "No encuentro la carpeta 'Mods' del pack. Descomprime el ZIP completo y ejecuta el instalador desde dentro."
}
if (Get-Process -Name "Balatro" -ErrorAction SilentlyContinue) {
    throw "Balatro está abierto. Ciérralo y vuelve a ejecutar el instalador."
}

# 1. Mods (copia de seguridad + instalación limpia)
Paso "1/4 Instalando los mods"
New-Item -ItemType Directory -Force -Path $datos | Out-Null
$destinoMods = Join-Path $datos "Mods"
if (Test-Path $destinoMods) {
    $respaldo = Join-Path $datos "Mods_respaldo_$fecha"
    Move-Item -Path $destinoMods -Destination $respaldo
    Ok "Mods anteriores guardados en: $respaldo"
}
Copy-Item -Path (Join-Path $raiz "Mods") -Destination $destinoMods -Recurse -Force
# Quitar el bloqueo de «archivo descargado de Internet»
Get-ChildItem -Path $destinoMods -Recurse -File | Unblock-File -ErrorAction SilentlyContinue
$num = (Get-ChildItem -Path $destinoMods -Directory | Where-Object { $_.Name -ne "lovely" }).Count
Ok "$num mods instalados en $destinoMods"

# 2. Ajustes compartidos
Paso "2/4 Copiando los ajustes compartidos"
$destinoCfg = Join-Path $datos "config"
New-Item -ItemType Directory -Force -Path $destinoCfg | Out-Null
$respaldoCfg = Join-Path $datos "config_respaldo_$fecha"
Get-ChildItem -Path (Join-Path $raiz "config") -Filter *.jkr | ForEach-Object {
    $existente = Join-Path $destinoCfg $_.Name
    if (Test-Path $existente) {
        New-Item -ItemType Directory -Force -Path $respaldoCfg | Out-Null
        Copy-Item $existente (Join-Path $respaldoCfg $_.Name) -Force
    }
    Copy-Item $_.FullName $existente -Force
}
Ok "Ajustes copiados (los anteriores, si había, están en $respaldoCfg)"

# 3. Buscar Balatro en las bibliotecas de Steam
Paso "3/4 Buscando Balatro en Steam"
$candidatos = New-Object System.Collections.Generic.List[string]
$steam = $null
try { $steam = (Get-ItemProperty -Path "HKCU:\Software\Valve\Steam" -Name "SteamPath").SteamPath } catch {}
foreach ($base in @($steam, "${env:ProgramFiles(x86)}\Steam", "$env:ProgramFiles\Steam")) {
    if ($base -and (Test-Path $base)) {
        $candidatos.Add((Join-Path $base "steamapps\common\Balatro"))
        $vdf = Join-Path $base "steamapps\libraryfolders.vdf"
        if (Test-Path $vdf) {
            Select-String -Path $vdf -Pattern '"path"\s+"([^"]+)"' | ForEach-Object {
                $ruta = $_.Matches[0].Groups[1].Value -replace '\\\\', '\'
                $candidatos.Add((Join-Path $ruta "steamapps\common\Balatro"))
            }
        }
    }
}
$juego = $candidatos | Where-Object { Test-Path (Join-Path $_ "Balatro.exe") } | Select-Object -First 1

# 4. Inyector Lovely
Paso "4/4 Instalando el inyector Lovely 0.9.0 (version.dll)"
if ($juego) {
    $dll = Join-Path $juego "version.dll"
    if (Test-Path $dll) { Copy-Item $dll (Join-Path $juego "version.dll.respaldo_$fecha") -Force }
    Copy-Item (Join-Path $raiz "windows\version.dll") $dll -Force
    Unblock-File $dll -ErrorAction SilentlyContinue
    Ok "Lovely instalado en: $juego"
} else {
    Aviso "No he encontrado Balatro.exe automáticamente."
    Aviso "Copia a mano 'windows\version.dll' en la carpeta donde está Balatro.exe"
    Aviso "(Steam > Balatro > clic derecho > Administrar > Ver archivos locales)."
}

Write-Host ""
Write-Host "=====================================================" -ForegroundColor Magenta
Write-Host "  Instalación terminada. Abre Balatro desde Steam.   " -ForegroundColor Magenta
Write-Host "  Para jugarlo en español: Opciones > Idioma > Español (España)" -ForegroundColor Magenta
Write-Host "  Contacto: https://www.instagram.com/_shun._05/      " -ForegroundColor Magenta
Write-Host "=====================================================" -ForegroundColor Magenta
