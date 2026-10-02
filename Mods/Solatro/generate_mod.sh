#!/bin/bash
# Solatro mod packager.
#
# Builds the distributable Lovely-injector mod folder (Solatro/) and release
# zip in the repo root from the working sources in balatro_files/Balatro/.
# See HIDDEN_README.md and SOLATRO_DISTRIBUTION_PLAN.md for the full plan.
#
# Usage:
#   ./generate_mod.sh            build Solatro/ and Solatro-<version>.zip in root
#   ./generate_mod.sh --install  also copy the mod into the user's Mods folder
#                                (~/Library/Application Support/Balatro/Mods)
set -euo pipefail

VERSION="1.0.0"
ROOT="$(cd "$(dirname "$0")" && pwd)"
SRC="$ROOT/balatro_files/Balatro"
OUT="$ROOT/Solatro"
MODS_DIR="$HOME/Library/Application Support/Balatro/Mods"

[ -f "$SRC/solatro.lua" ] || { echo "error: $SRC/solatro.lua not found" >&2; exit 1; }

echo "==> Building Solatro $VERSION"
rm -rf "$OUT" "$ROOT"/Solatro-*.zip
mkdir -p "$OUT/lovely" "$OUT/assets/1x" "$OUT/assets/2x" "$OUT/assets/sounds"

# The mod itself, unchanged from the working tree
cp "$SRC/solatro.lua" "$OUT/solatro.lua"

# The four modified logos, renamed so we never ship files that shadow the
# game's own asset names. solatro.lua re-points G.ASSET_ATLAS at these at
# runtime (see the set_render_settings wrapper).
for scale in 1x 2x; do
    cp "$SRC/resources/textures/$scale/balatro.png"     "$OUT/assets/$scale/solatro.png"
    cp "$SRC/resources/textures/$scale/balatro_alt.png" "$OUT/assets/$scale/solatro_alt.png"
done

# Solatro's music track; solatro.lua self-installs it into the save dir's
# resources/sounds/ on first run so the vanilla sound thread loads it.
cp "$SRC/resources/sounds/music69.ogg" "$OUT/assets/sounds/music69.ogg"

# Lovely injection patches: load solatro.lua as a module, then require it from
# the same spot the source patch used (right after `require "challenges"`).
cat > "$OUT/lovely/solatro.toml" <<TOML
[manifest]
version = "$VERSION"
priority = 0

# Load solatro.lua as a module before main.lua finishes loading.
# NOTE: lovely resolves module sources against the MOD ROOT (not this toml's
# folder) - "../solatro.lua" crashes with "not found in preloaded sources".
[[patches]]
[patches.module]
source = "solatro.lua"
before = "main.lua"
name = "solatro"

# Kick it off where the source patch used to require it
[[patches]]
[patches.pattern]
target = "main.lua"
pattern = "require \"challenges\""
position = "after"
payload = "require \"solatro\""
match_indent = true
TOML

# Steamodded metadata: not required (the mod runs on bare Lovely), but it makes
# Solatro show up properly in the SMODS Mods menu for players who run it.
cat > "$OUT/solatro.json" <<JSON
{
    "id": "Solatro",
    "name": "Solatro",
    "display_name": "Solatro",
    "author": ["bryanthaboi", "bois club games"],
    "description": "A full game of Klondike Solitaire on the main menu, built from Balatro's own cards. Drag cards or runs, or pick a card up with a click and click again to place it. Double click sends cards to their foundation. Classic victory cascade included.",
    "prefix": "solatro",
    "main_file": "solatro.lua",
    "version": "$VERSION",
    "badge_colour": "eac058"
}
JSON

cat > "$OUT/README.md" <<'MD'
# Solatro

When you get tired of playing Balatro and want to play Solitaire but still look
like a cool person that plays Balatro.

**Requires [Balatro](https://www.playbalatro.com) (you must own the game) and
[Lovely Injector](https://github.com/ethangreen-dev/lovely-injector).
[Steamodded](https://github.com/Steamodded/smods) is supported but not required.**

## Install

1. Install [Lovely Injector](https://github.com/ethangreen-dev/lovely-injector?tab=readme-ov-file#manual-installation)
   for your OS (this also creates the `Mods` folder).
2. Copy the `Solatro` folder into your Balatro `Mods` folder:
   - **Windows:** `%AppData%/Balatro/Mods`
   - **macOS:** `~/Library/Application Support/Balatro/Mods`
   - **Linux (Steam/Proton):** `~/.steam/steam/steamapps/compatdata/2379780/pfx/drive_c/users/steamuser/AppData/Roaming/Balatro/Mods`
3. Launch the game the way Lovely tells you to (on macOS: `run_lovely_macos.sh`).

## Play

- Press **PLAY** on the main menu to deal a fresh game of Solitaire.
- **Drag** any face-up card (or a whole run) onto another column or foundation.
- Or **click** a card to pick it up, then click the pile where it should go.
- If you do not already know how to play solitaire, sorry.

## Notes

- No game files are modified: all patches are applied in memory by Lovely at
  launch, and the mod only wraps vanilla functions while Solitaire is running.
- Bugs and suggestions: open an issue on the repo, or find us in the Balatro
  Discord modding forums.

*solatro mod by bryanthaboi / bois club games*
MD

cat > "$OUT/CHANGELOG.md" <<MD
# Changelog

## $VERSION

- First public release.
- Full Klondike Solitaire (draw 1) on the main menu with Balatro's cards.
- Drag whole runs, pick-then-place with clicks, double click to foundation.
- Move counter, timer, new deal button and the classic victory cascade.
MD

cat > "$OUT/LICENSE" <<'MD'
MIT License

Copyright (c) 2026 bryanthaboi / bois club games

This license covers ONLY the Solatro mod code and packaging in this folder.
Balatro itself, and all of its assets, belong to LocalThunk / Playstack and
are NOT distributed with, or covered by, this license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
MD

# Release zip contains the Solatro/ folder itself so it can be unzipped
# straight into a Mods folder.
(cd "$ROOT" && zip -qr "Solatro-$VERSION.zip" Solatro -x '*.DS_Store')

echo "==> Wrote $OUT"
echo "==> Wrote $ROOT/Solatro-$VERSION.zip"

if [ "${1:-}" = "--install" ]; then
    mkdir -p "$MODS_DIR"
    rm -rf "$MODS_DIR/Solatro"
    cp -R "$OUT" "$MODS_DIR/Solatro"
    echo "==> Installed to $MODS_DIR/Solatro"
fi
