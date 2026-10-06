# Historial de cambios — Balatro · Pack de mods en español

## v0.5 — 2026-10-06
### Corregido
- **Cierre al cobrar con *Piggy Bank* (y otros 3 comodines por dinero).** Síntoma: al pulsar «Cobrar» al final de la ronda el juego se cerraba con `attempt to compare number with table`. Afectaba a *Piggy Bank*, la baratija *Counterfeit Penny* y el comodín de gasto en tienda de Repentance (The Binding of Jimbo) y a *Mint Condition* (Ortalab); con Talisman el importe del dinero llega como número grande.
- **La pantalla de error nombraba un mod equivocado** (decía «Multiplayer» cuando el fallo era de The Binding of Jimbo): ahora señala el mod del propio mensaje de error.
### Mejorado
- `herramientas/empaquetar.sh` ya no copia los ajustes del PC de quien empaqueta (solo con `COPIAR_AJUSTES=1`), para que cambios personales no viajen en el pack.
### Archivos y pruebas
- Incluye **Guía y Traducción ES v0.6** (`Mods/GuiaTraduccionES`), `README.md`, `docs/mods/GuiaTraduccionES.md`.
- Probado en el juego: *Piggy Bank* con una ganancia de dinero «grande» → sin cierre y el comodín sube su valor.

## v0.4 — 2026-10-03
- **El botón derecho del ratón vuelve a deseleccionar las cartas de la mano**, como en el Balatro normal. Causa: Handy asigna «Ratón derecho» a su «seleccionar rápido» (que se resuelve antes que «deseleccionar mano»), así que con el cursor sobre una carta el derecho seleccionaba otra carta. Se quita esa asignación en `config/Handy.jkr` (el izquierdo sigue seleccionando, también arrastrando).
- Probado en el juego con clics reales: con 3 cartas seleccionadas, el derecho (sobre una carta o en vacío) deja 0; el izquierdo selecciona carta a carta. Antes: el derecho pasaba de 3 a 4.
- `herramientas/empaquetar.sh`: ya no copia la lista negra de mods (`lovely/blacklist.txt`) del PC de quien empaqueta —con un pack aplicado habría desactivado mods a quien instalara el pack— y escribe siempre la lista limpia.
- Archivos: `config/Handy.jkr` (nuevo), `herramientas/empaquetar.sh`, `README.md`.

## v0.3 — 2026-10-02
- Incluye **Guía y Traducción ES v0.5**:
  - **Pantalla de error en español** que señala al mod culpable; con 1, 2 o 3 se desactiva ese mod (y sus dependientes) y el juego se reabre solo. Historial en `guiaes_cierres.log`.
  - **Comprobador de mods en Multiplayer**: compara todos los mods y versiones con el otro jugador, dice qué falta a cada uno y ofrece «Igualar a <amigo> y reabrir».
  - **Perfiles de packs con nombre** (hasta 6), p. ej. «Con Marcos» y «Yo solo».
  - **Reinicio fiable** en la pantalla de error y en el menú «Mods» (el interno de LÖVE fallaba con Multiplayer).
  - Herramienta `herramientas/revisar_traducciones.py` para mantener las traducciones al día (en la guía).
- **Probados por separado con el bot sin cierres: todos los packs** (Calidad de vida, Balatro ampliado, Kino, Pokémon, Isaac, Ortalab y Cryptid). Se quita el aviso de v0.2; solo queda por comprobar la reapertura automática en Windows.
- Archivos: `Mods/GuiaTraduccionES` (actualizado), `README.md`, `docs/mods/GuiaTraduccionES.md`.

## v0.2 — 2026-10-02
- Incluye **Guía y Traducción ES v0.4**:
  - **Packs de mods combinables** desde el menú principal (botón «PACKS DE MODS»): Calidad de vida, Balatro ampliado, Kino, Pokémon, Isaac, Ortalab y Cryptid, con descripción de la combinación y valoración (desnivelada, avisos, Multiplayer). El juego se reabre solo al aplicar y la partida a medias se aparta y se recupera.
  - **Menú principal centrado**: ya no se corta por la derecha ni choca con «Perfil».
  - 4 cierres más corregidos: desbloqueos y récords con Talisman (Paperback, Cartomancer), aviso de carta desbloqueada y baraja «Keeper» de Isaac.
- Packs probados con el bot: Juego base, Calidad de vida, + Balatro ampliado, + Kino y + Pokémon. Isaac, Ortalab y Cryptid por separado quedan pendientes de una ronda más de pruebas.
- Archivos: `Mods/GuiaTraduccionES` (actualizado), `README.md`, `docs/mods/GuiaTraduccionES.md`.

## v0.1 — 2026-10-02
- Primera versión del pack: 30 mods de Balatro traducidos al español y explicados (ficha de cada mod en `docs/mods/`).
- Base: Steamodded 26.829.0, Lovely 0.9.0 (Windows `version.dll` y Mac `liblovely.dylib`), Talisman 2.7, Multiplayer 0.5.5.
- Instaladores para **Windows** (`Instalar_Windows.bat` + PowerShell) y **Mac** (`Instalar_Mac.command`): copia de seguridad de los mods y ajustes anteriores, instalación limpia, ajustes compartidos y búsqueda automática del juego en las bibliotecas de Steam. En Mac crea el acceso directo «Balatro con mods» en el Escritorio.
- Ajustes compartidos (`config/`) para que los dos jugadores de Multiplayer tengan la misma configuración (TheOrder activado), sin datos personales.
- Incluye **Guía y Traducción ES v0.3**: rendimiento ~30 veces mayor al puntuar (adiós a «Calculando...») y más de 30 cierres del juego corregidos, probado con un bot durante horas de partidas.
- Retirados: Galdur (incompatible con el Steamodded actual) y Better Mouse and Gamepad (choca con Handy).
- Release con el pack completo para Windows, el pack completo para Mac y cada mod en un ZIP por separado.
