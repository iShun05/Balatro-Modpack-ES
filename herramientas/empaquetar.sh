#!/bin/bash
# Genera el pack a partir de los mods instalados y crea los ZIP de la release.
# Uso: herramientas/empaquetar.sh vX.X
#   1. Sincroniza Mods/ desde la carpeta de mods real (sin cachés de Lovely ni basura de macOS).
#   2. Copia los ajustes compartidos (config/) sin datos personales.
#   3. Crea en dist/: pack Windows, pack Mac y un ZIP por cada mod.
set -euo pipefail
VERSION="${1:?Indica la versión, p. ej. v0.1}"
RAIZ="$(cd "$(dirname "$0")/.." && pwd)"
ORIGEN_MODS="${ORIGEN_MODS:-/Volumes/SanDisk/mods/Balatro}"
ORIGEN_CFG="${ORIGEN_CFG:-$HOME/Library/Application Support/Balatro/config}"
DIST="$RAIZ/dist"

# Ajustes que se comparten (Multiplayer.jkr va aparte, ya limpio de datos personales)
CONFIGS=(Bunco CardSleeves Cryptid JokerDisplay Pokermon Prism ScrDesc ShopUndo SixSuits
         Steamodded TheBindingOfJimbo cartomancer extracredit joker_evolution kino malverk
         ortalab paperback toomanyjokers)

echo "== Sincronizando Mods/"
rsync -a --delete \
    --exclude '.git' --exclude '.github' --exclude '.DS_Store' --exclude '._*' \
    --exclude 'ZZ_*' --exclude '.lovelyignore' \
    --exclude 'lovely/dump' --exclude 'lovely/log' --exclude 'lovely/game-dump' \
    "$ORIGEN_MODS/" "$RAIZ/Mods/"

echo "== Copiando ajustes"
for c in "${CONFIGS[@]}"; do
    cp "$ORIGEN_CFG/$c.jkr" "$RAIZ/config/$c.jkr"
done

echo "== Creando ZIP en dist/"
rm -rf "$DIST"; mkdir -p "$DIST/mods"
cd "$RAIZ"
COMUN=(Mods config docs README.md CHANGELOG.md)
zip -qrX "$DIST/Balatro_Pack_ES_Windows_$VERSION.zip" "${COMUN[@]}" Instalar_Windows.bat windows -x '*.DS_Store' '*/._*'
zip -qrX "$DIST/Balatro_Pack_ES_Mac_$VERSION.zip" "${COMUN[@]}" Instalar_Mac.command mac -x '*.DS_Store' '*/._*'
cd "$RAIZ/Mods"
for d in */; do
    d="${d%/}"
    [ "$d" = "lovely" ] && continue
    zip -qrX "$DIST/mods/mod_$d.zip" "$d" -x '*.DS_Store' '*/._*'
done
ls -lh "$DIST" "$DIST/mods" | awk '{print $5, $9}'
