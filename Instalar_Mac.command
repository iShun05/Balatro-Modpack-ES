#!/bin/bash
# Instalador del pack de mods de Balatro (macOS)
# - Copia de seguridad de mods y ajustes anteriores (no borra nada).
# - Instalación limpia de los mods (imprescindible para Multiplayer).
# - Ajustes compartidos para que ambos jugadores tengan la misma configuración.
# - Busca Balatro en las bibliotecas de Steam e instala Lovely 0.9.0.
set -e
RAIZ="$(cd "$(dirname "$0")" && pwd)"
FECHA="$(date +%Y%m%d_%H%M%S)"
DATOS="$HOME/Library/Application Support/Balatro"

echo "====================================================="
echo "   Pack de mods de Balatro en español - Instalador"
echo "====================================================="

[ -d "$RAIZ/Mods/smods" ] || { echo "[ERROR] No encuentro la carpeta Mods del pack. Descomprime el ZIP completo."; exit 1; }
if pgrep -f "Balatro.app/Contents/MacOS/love" >/dev/null; then
    echo "[ERROR] Balatro está abierto. Ciérralo y vuelve a ejecutar el instalador."; exit 1
fi

# Quitar la cuarentena de macOS (si no, el sistema bloquea liblovely.dylib)
xattr -dr com.apple.quarantine "$RAIZ" 2>/dev/null || true

echo; echo "== 1/4 Instalando los mods"
mkdir -p "$DATOS"
if [ -L "$DATOS/Mods" ]; then
    echo "   [!] Mods es un enlace a: $(readlink "$DATOS/Mods")"
    echo "       Se quita solo el enlace (la carpeta de destino no se toca)."
    rm "$DATOS/Mods"
elif [ -d "$DATOS/Mods" ]; then
    mv "$DATOS/Mods" "$DATOS/Mods_respaldo_$FECHA"
    echo "   [OK] Mods anteriores guardados en Mods_respaldo_$FECHA"
fi
cp -R "$RAIZ/Mods" "$DATOS/Mods"
echo "   [OK] $(find "$DATOS/Mods" -mindepth 1 -maxdepth 1 -type d ! -name lovely | wc -l | tr -d ' ') mods instalados"

echo; echo "== 2/4 Copiando los ajustes compartidos"
mkdir -p "$DATOS/config"
for f in "$RAIZ"/config/*.jkr; do
    n="$(basename "$f")"
    if [ -f "$DATOS/config/$n" ]; then
        mkdir -p "$DATOS/config_respaldo_$FECHA"
        cp "$DATOS/config/$n" "$DATOS/config_respaldo_$FECHA/$n"
    fi
    cp "$f" "$DATOS/config/$n"
done
echo "   [OK] Ajustes copiados"

echo; echo "== 3/4 Buscando Balatro en Steam"
JUEGO=""
STEAM="$HOME/Library/Application Support/Steam"
CANDIDATOS=("$STEAM/steamapps/common/Balatro")
if [ -f "$STEAM/steamapps/libraryfolders.vdf" ]; then
    while IFS= read -r ruta; do CANDIDATOS+=("$ruta/steamapps/common/Balatro"); done < <(
        grep -E '"path"' "$STEAM/steamapps/libraryfolders.vdf" | sed -E 's/.*"path"[[:space:]]+"([^"]+)".*/\1/')
fi
for c in "${CANDIDATOS[@]}"; do
    if [ -d "$c/Balatro.app" ]; then JUEGO="$c"; break; fi
done

echo; echo "== 4/4 Instalando Lovely 0.9.0"
if [ -n "$JUEGO" ]; then
    [ -f "$JUEGO/liblovely.dylib" ] && cp "$JUEGO/liblovely.dylib" "$JUEGO/liblovely.dylib.respaldo_$FECHA"
    cp "$RAIZ/mac/liblovely.dylib" "$RAIZ/mac/run_lovely_macos.sh" "$JUEGO/"
    chmod +x "$JUEGO/run_lovely_macos.sh"
    echo "   [OK] Lovely instalado en: $JUEGO"
    # Acceso directo en el Escritorio para jugar con mods sin tocar Steam
    ACCESO="$HOME/Desktop/Balatro con mods.command"
    printf '#!/bin/bash\n# Abre Balatro con mods (Steam debe estar abierto)\n"%s/run_lovely_macos.sh" >/dev/null 2>&1 &\n' "$JUEGO" > "$ACCESO"
    chmod +x "$ACCESO"
    echo "   [OK] Acceso directo creado: Escritorio > «Balatro con mods»"
    echo
    echo "   IMPORTANTE: para que Steam abra el juego CON mods, pon en"
    echo "   Steam > Balatro > Propiedades > Opciones de lanzamiento:"
    echo "   \"$JUEGO/run_lovely_macos.sh\" %command%"
else
    echo "   [!] No he encontrado Balatro. Copia mac/liblovely.dylib y mac/run_lovely_macos.sh"
    echo "       a la carpeta del juego (Steam > Balatro > Administrar > Ver archivos locales)."
fi

echo
echo "====================================================="
echo "  Instalación terminada."
echo "  Contacto: https://www.instagram.com/_shun._05/"
echo "====================================================="
