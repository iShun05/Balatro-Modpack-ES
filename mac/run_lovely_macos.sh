#!/bin/bash
# Lanzador de Balatro con mods (Lovely 0.9.0) para macOS.
# Steam añade %command% como argumentos: se ignoran (el juego no necesita ninguno).
DIR="$(cd "$(dirname "$0")" && pwd)"
export DYLD_INSERT_LIBRARIES="$DIR/liblovely.dylib"
cd "$DIR"
exec ./Balatro.app/Contents/MacOS/love
