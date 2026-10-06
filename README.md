# Balatro · Pack de mods en español (Windows + Mac)

Pack de **30 mods de Balatro** traducidos y explicados en español, revisado para jugar **Multiplayer entre Windows y Mac sin cierres**. Incluye instaladores para los dos sistemas, los mods ya editados y corregidos, sus ajustes compartidos y una ficha en español de cada mod.

> [!NOTE]
> **Aún por comprobar:** que en **Windows** el juego se reabra solo al aplicar un pack o al desactivar un mod desde la pantalla de error (en Mac está probado). Si no se abre, ábrelo tú desde Steam: los cambios ya están aplicados. Todos los packs (Calidad de vida, Balatro ampliado, Kino, Pokémon, Isaac, Ortalab y Cryptid) se han probado ya por separado con el bot sin cierres. Si el juego se cierra, la pantalla de error dice qué mod falló y te deja desactivarlo con una tecla.

- **Versión actual del pack:** v0.5
- **Plataformas:** Windows 10/11 y macOS (Apple Silicon e Intel), Balatro de Steam
- **Base:** Steamodded 26.829.0 · Lovely 0.9.0 · Talisman 2.7 · Multiplayer 0.5.5

## Descargas

En la [última release](https://github.com/iShun05/Balatro-Modpack-ES/releases/latest):

| Archivo | Para quién |
|---|---|
| `Balatro_Pack_ES_Windows_vX.X.zip` | Pack completo + instalador de Windows |
| `Balatro_Pack_ES_Mac_vX.X.zip` | Pack completo + instalador de Mac |
| `mod_<Nombre>.zip` | Cada mod por separado (ya editado), para instalarlo o actualizarlo suelto |

## Instalación

> Los dos jugadores deben instalar **el mismo pack y la misma versión**. Los instaladores guardan una copia de seguridad de tus mods y ajustes anteriores (`Mods_respaldo_<fecha>` y `config_respaldo_<fecha>`); no borran nada.

### Windows
1. Cierra Balatro y descomprime `Balatro_Pack_ES_Windows_vX.X.zip` (entero, no lo abras desde dentro del ZIP).
2. Doble clic en **`Instalar_Windows.bat`**. Si Windows SmartScreen avisa: *Más información → Ejecutar de todas formas*.
3. El instalador copia los mods a `%APPDATA%\Balatro\Mods`, los ajustes a `%APPDATA%\Balatro\config` y el inyector **Lovely** (`version.dll`) junto a `Balatro.exe` (lo busca en todas tus bibliotecas de Steam).
4. Abre Balatro **desde Steam como siempre**. Si no encuentra el juego, copia `windows\version.dll` a mano en la carpeta de `Balatro.exe` (Steam → Balatro → Administrar → Ver archivos locales).

### Mac
1. Cierra Balatro y descomprime `Balatro_Pack_ES_Mac_vX.X.zip`.
2. Clic derecho en **`Instalar_Mac.command` → Abrir** (la primera vez macOS pide confirmación).
3. El instalador copia los mods a `~/Library/Application Support/Balatro/Mods`, los ajustes, y `liblovely.dylib` + `run_lovely_macos.sh` a la carpeta del juego. Además crea en el Escritorio **«Balatro con mods»**.
4. Para jugar con mods: abre Steam y haz doble clic en **«Balatro con mods»** del Escritorio.
   - O desde Steam: *Balatro → Propiedades → Opciones de lanzamiento* y pega la línea que muestra el instalador: `"<carpeta del juego>/run_lovely_macos.sh" %command%`.
   - En Mac, abrir Balatro desde Steam **sin** eso carga el juego sin mods.

### Idioma
En el juego: *Opciones → Idioma → Español (España)* y reinicia. Todo el pack (incluidos los mods) queda en español.

## Multijugador entre Windows y Mac (sin cierres)

1. **Mismo pack, misma versión** en los dos ordenadores, instalado con su instalador (instalación limpia: nada de mods viejos mezclados). Multiplayer compara la lista de mods y sus versiones; si no coinciden, no os deja jugar juntos o el juego se desincroniza.
2. **Mismos ajustes**: el pack trae los ajustes de todos los mods (`config/`), incluida la integración **TheOrder** de Multiplayer activada en ambos. No cambiéis ajustes de mods de contenido por separado (Cryptid, Pokermon, Kino...): cambian las cartas que salen y la partida se desincroniza.
3. **Balatro actualizado** en Steam en los dos.
4. **No activéis ni desactivéis mods** por separado. Si queréis jugar con menos mods, haced exactamente los mismos cambios los dos y reiniciad el juego.
5. **Comprobador de mods:** al entrar en la sala, el juego compara tus mods y versiones con los del otro jugador. Si no coinciden, un aviso en español dice qué te falta a ti, qué le falta a él y con qué packs juega, y el botón **«Igualar a <amigo> y reabrir»** pone tus packs como los suyos.
6. Crear partida: *Jugar en línea → Crear sala* (uno) y *Unirse* con el código (el otro). Las reglas **clasificatorias** exigen un perfil sin mods de contenido; usad las reglas normales o de práctica.
7. Tu nombre de usuario de Multiplayer no viene en el pack (cada uno pone el suyo la primera vez).

## Packs de mods (elige qué mods usar)

En el menú principal hay un botón **PACKS DE MODS** (también en *Mods → Guía y Traducción ES → Packs*). Marca uno o varios packs y pulsa **Aplicar y reabrir**: el juego se cierra y se vuelve a abrir solo con esos mods.

| Pack | Qué trae |
|---|---|
| Calidad de vida | JokerDisplay, Handy, buscador (T), deshacer tienda (U), modo oscuro, Talisman y Multiplayer |
| Balatro ampliado | Bunco, Paperback, Extra Credit, Bakery, Prism, Lost Edition, Six Suits, Joker Evolution y fundas: estilo y equilibrio del original |
| Cine (Kino) | Comodines de películas con géneros, golosinas y hechizos |
| Pokémon | Comodines Pokémon que evolucionan y tipos de energía |
| Binding of Isaac | Objetos, baratijas y personajes de The Binding of Isaac |
| Ortalab | Balatro alternativo: 150 comodines, maldiciones y zodiacos |
| Caos (Cryptid) | Puntuaciones absurdas y cartas rotas a propósito |

- Accesos rápidos: **Solo juego base** (sin mods, solo la traducción), **Solo calidad de vida** y **Marcar todo**.
- Debajo aparece **qué trae tu combinación** y una **valoración**: en rojo si está desnivelada (Cryptid con otros packs), en naranja si algo se diluye o da problemas (Ortalab mezclado, Kino + Pokémon, Isaac con otro temático, demasiados packs) y en verde las combinaciones buenas.
- **Partida a medias:** al cambiar de mods se guarda aparte y vuelve sola cuando eliges otra vez esos mismos packs (cargarla con mods distintos cerraría el juego).
- **Multiplayer:** los dos tenéis que marcar exactamente los mismos packs.

### Perfiles guardados
Marca una combinación, escribe un nombre (p. ej. «Con Marcos» o «Yo solo») y pulsa **GUARDAR COMBINACIÓN**. Los perfiles (hasta 6) aparecen arriba del selector: un clic los carga y la «x» los borra.

## Ratón: el botón derecho deselecciona las cartas
Handy trae por defecto «seleccionar rápido» con los dos botones del ratón, y con el cursor sobre una carta el botón derecho **seleccionaba** en vez de dejar todas las cartas sin seleccionar como en el Balatro normal. El pack lo deja como el juego original: **botón izquierdo = seleccionar (también arrastrando), botón derecho = deseleccionar todas**. Se aplica con `config/Handy.jkr`; si prefieres lo de Handy, cámbialo en Opciones → Handy.

## Si el juego se cierra
La pantalla de error empieza ahora con una explicación en español: **qué mod ha fallado**, en qué archivo, qué significa el error y qué otros mods aparecen. Pulsa **1, 2 o 3** para desactivar ese mod (y los que dependen de él) y el juego se reabre solo; tu partida a medias se aparta para no cerrarse al continuar. **R** reabre sin cambios. Cada cierre queda anotado en `guiaes_cierres.log` (carpeta de datos de Balatro). Si se repite, mándame la pantalla por Instagram.

## Rendimiento: adiós a «Calculando...»

Con todos los mods juntos, cada mano mostraba la pantalla **«Calculando...»** de Talisman durante 7-14 segundos (~8.000 recálculos por mano), incluso sin comodines. La causa: The Binding of Jimbo activa en Steamodded las *mejoras cuánticas*, que recalculan todo el juego cada vez que se consulta la mejora de una carta.

*Guía y Traducción ES v0.3* detecta automáticamente las 13 cartas que usan esa mecánica y solo hace ese cálculo cuando alguna está en juego. Medido con el bot: **0,2-0,5 s por mano, unas 30 veces más rápido**, con exactamente los mismos resultados.

## Revisión de estabilidad

Antes de publicar el pack se jugaron **partidas automáticas completas durante horas** con un bot de pruebas (velocidad x8, barajas, fundas y apuestas al azar, tienda, paquetes, consumibles, reglamentos de práctica de Multiplayer). Se encontraron y **corrigieron más de 30 cierres reales** del juego, todos dentro de *Guía y Traducción ES v0.3*, sin modificar los archivos de los mods originales (parches de Lovely y protecciones en Lua):

| Cierre | Cuándo pasaba | Arreglo |
|---|---|---|
| Cryptid · reverso de cartas | Al empezar partida (también desde Multiplayer) | Parche de prioridad de operadores en `card_draw.lua` |
| Kino + Card Sleeves 1.9.4 | Al empezar con las fundas Género / Kinoween / Películas A | Las fundas aceptan el formato nuevo de Card Sleeves |
| Kino / Bakery · zonas de cartas | Segunda partida seguida sin reiniciar (típico en Multiplayer) | Se ignoran zonas de la partida anterior ya destruidas |
| Bunco · descripción de ediciones | Al mostrar cualquier carta brillante, holográfica o policromada | Se recoloca un `end` que el parche de Bunco ponía mal |
| Talisman · números grandes | Al pulsar **Cambiar** en la tienda (Shop Undo), al acabar una mano, y con más de 20 cartas de The Binding of Jimbo, Paperback, Multiplayer, Bunco, Bakery, Kino, Joker Evolution, Lost Edition y Ortalab | Comparaciones seguras entre números grandes y normales |
| Multiplayer · TheOrder | Al puntuar, si una carta elige al azar entre una lista vacía (en línea, con TheOrder activo) | Se deja al juego base, que devuelve «nada» sin cerrarse |
| Desbloqueos y récords (Talisman) | Al desbloquear cartas (p. ej. «Copa de sake» de Paperback) o batir el récord de mano con Cartomancer | Se pasan los valores en el formato que espera cada mod |
| Aviso de desbloqueo | Al mostrar una carta desbloqueada (carta «bloqueada» inexistente) | Se ignoran mejoras de cartas que no existen |
| Baraja «Keeper» de Isaac | Al empezar una ciega con esa baraja | Cálculo de manos extra compatible con Talisman |
| Dinero (Talisman) en comodines | Al cobrar al final de una ronda con *Piggy Bank*, la baratija *Counterfeit Penny*, el comodín de gasto en tienda de Repentance (The Binding of Jimbo) o *Mint Condition* (Ortalab) | Comparación del importe compatible con números grandes |
| Cartas forzadas | Funda «Papel» de Paperback con reglamentos de Multiplayer; funda «Misterio» de Kino | Se deduce el tipo o se crea una carta del mismo tipo |
| Pokermon / The Binding of Jimbo · créditos | Al pasar el ratón por una etiqueta o sello de otro mod | Se ignoran los que no están registrados |
| Ortalab · insignia de ciega | Mientras se reconstruye el HUD | Comprobación de que el elemento existe |

**Resultado final:** tras los arreglos, dos rondas seguidas de 30 minutos **sin ningún cierre** (6 partidas completas, ~190 manos, hasta la apuesta 7, con y sin reglamentos de Multiplayer), y cada mano puntuada en menos de medio segundo.

> Ningún conjunto de 30 mods es perfecto: si algún día el juego se cierra, la pantalla de error de Steamodded indica el mod culpable. Mándamela por Instagram y lo corrijo en la siguiente versión.

## Mods incluidos

Cada nombre enlaza a su ficha en español (qué hace, autor, página original y notas del pack). En el juego, la pestaña **Guía** del mod *Guía y Traducción ES* muestra lo mismo, más las pestañas *Recomendados*, *Combina bien* y *Evita*.

| Mod | Categoría | Versión | Para qué sirve |
|---|---|---|---|
| [BetterSpanishLocale](docs/mods/BetterSpanishLocale.md) | Base | 1.0 | Corrige la traducción española del juego |
| [Guía y Traducción ES](docs/mods/GuiaTraduccionES.md) | Base | 0.6 | Esta guía y las traducciones al español |
| [Steamodded](docs/mods/smods.md) | Base | 26.829.0 | Cargador de mods: sin él no funciona ninguno |
| [Talisman](docs/mods/Talisman-2.7.md) | Base | 2.7 | Sin límite de puntuación y sin animaciones lentas |
| [Cartomancer](docs/mods/Cartomancer.md) | Calidad de vida | 4.17c | Comodidades: apilar cartas, ver tienda... |
| [Handy](docs/mods/Handy.md) | Calidad de vida | 2.0.6 | Atajos, velocidad y saltar animaciones |
| [Joker Run Info](docs/mods/JokerRunInfo.md) | Calidad de vida | 1.0.0 | Pestaña «Comodines» en la info de partida |
| [JokerDisplay](docs/mods/JokerDisplay.md) | Calidad de vida | 1.10.9 | Info en vivo bajo cada comodín |
| [Scrollable Descriptions](docs/mods/ScrollableDescriptions.md) | Calidad de vida | 1.1.0 | Mover descripciones largas con flechas |
| [Shop Undo](docs/mods/ShopUndo.md) | Calidad de vida | 1.0.0 | Deshacer cambios de tienda (tecla U) |
| [Too Many Jokers](docs/mods/TooManyJokers.md) | Calidad de vida | 4.9.7 | Buscador de cartas (tecla T) |
| [Bakery](docs/mods/Bakery.md) | Contenido | 3.8.3 | Amuletos, hombres lobo y manos nuevas |
| [Balatro: Lost Edition](docs/mods/lost_edition.md) | Contenido | 1.0.6 | Cartas «perdidas» y ediciones nuevas |
| [Bunco](docs/mods/Bunco.md) | Contenido | 5.1 | Comodines, tarots y ciegas de estilo oficial |
| [Card Sleeves (Fundas)](docs/mods/CardSleeves.md) | Contenido | 1.9.4 | Fundas que se combinan con tu baraja |
| [Extra Credit](docs/mods/ExtraCredit.md) | Contenido | 1.3.0 | 45 comodines de estilo original |
| [Joker Evolution](docs/mods/Joker-Evolution.md) | Contenido | 1.2.3c | Evoluciona comodines a versiones fuertes |
| [Paperback](docs/mods/Paperback.md) | Contenido | 0.8.1 | Expansión: arcanos menores, clips... |
| [Prism](docs/mods/Prism.md) | Contenido | 1.10.0 | Cartas Mito y fundas a juego |
| [Six Suits (Seis palos)](docs/mods/SixSuits.md) | Contenido | 1.2.1 | Palos estrellas y lunas, mano Espectro |
| [Cryptid](docs/mods/Cryptid-0.5.15.md) | Contenido (caos) | 0.5.15a | Contenido enorme y roto a propósito |
| [Balatro Goes Kino](docs/mods/Kino.md) | Contenido temático | 0.14.1 | Comodines de películas con sinergias |
| [Ortalab](docs/mods/Ortalab.md) | Contenido temático | 1.0.1c | Balatro alternativo: 150 comodines nuevos |
| [Pokermon](docs/mods/Pokermon.md) | Contenido temático | 3.8.1-0901b | Comodines Pokémon que evolucionan |
| [The Binding of Jimbo](docs/mods/TheBindingOfJimbo.md) | Contenido temático | 1.4.0 | Contenido de The Binding of Isaac |
| [Balatro Dark Mode (extras)](docs/mods/BalatroDarkModeExtras.md) | Estética | 1.2.0 | Colores y fondo oscuros |
| [Balatro Dark Mode (texturas)](docs/mods/BalatroDarkMode.md) | Estética | 1.2.0 | Cartas en modo oscuro (vía Malverk) |
| [Malverk](docs/mods/Malverk.md) | Estética | 1.1.5 | Gestor de texturas (Opciones > Texturas) |
| [Solatro](docs/mods/Solatro.md) | Extra | 1.0.0 | Solitario en el menú principal |
| [Multiplayer](docs/mods/BalatroMultiplayer.md) | Multijugador | 0.5.5 | Partidas en línea contra amigos (PvP) |

### Recomendaciones rápidas
- **Imprescindibles:** JokerDisplay, Handy, Cartomancer, Joker Run Info, Too Many Jokers (tecla T), Shop Undo (tecla U), Scrollable Descriptions.
- **Combinan bien:** Bunco + Paperback + Extra Credit + Bakery + Prism + Lost Edition + Six Suits (Balatro ampliado y equilibrado). Kino, Pokermon, The Binding of Jimbo u Ortalab para partidas temáticas.
- **Evita:** Cryptid junto a mods equilibrados (lo hace todo trivial); dos «saltar animaciones» a la vez (usa el de Handy).
- **Retirados del pack:** Galdur (Steamodded ya trae ese menú y Galdur se autodesactiva) y Better Mouse and Gamepad (choca con Handy).

## Traducción
Todo lo que estaba en inglés está traducido al español por **Guía y Traducción ES**: 4.615 textos de más de 20 mods y ~140 textos fijos de interfaz, sin tocar los archivos de los mods (las traducciones sobreviven a sus actualizaciones). Código fuente de la traducción: [iShun05/GuiaTraduccionES-Balatro](https://github.com/iShun05/GuiaTraduccionES-Balatro).

## Estructura
```
Balatro_Pack_ES/
├── Instalar_Windows.bat      # instalador de Windows (lanza windows/Instalar_Windows.ps1)
├── Instalar_Mac.command      # instalador de Mac
├── Mods/                     # los 30 mods ya editados (+ lovely/blacklist.txt)
├── config/                   # ajustes compartidos de los mods (.jkr); Handy.jkr = botón derecho deselecciona
├── windows/                  # Instalar_Windows.ps1 + version.dll (Lovely 0.9.0)
├── mac/                      # liblovely.dylib (Lovely 0.9.0) + run_lovely_macos.sh
├── docs/mods/                # ficha en español de cada mod
├── herramientas/             # empaquetar.sh (genera los ZIP de la release)
├── CHANGELOG.md
└── README.md
```

## Desinstalar o volver atrás
Borra la carpeta `Mods` (Windows: `%APPDATA%\Balatro\Mods`; Mac: `~/Library/Application Support/Balatro/Mods`) y renombra `Mods_respaldo_<fecha>` a `Mods`. Para quitar Lovely: borra `version.dll` (Windows) o `liblovely.dylib` (Mac) de la carpeta del juego.

## Versiones y código fuente
| Versión | Fecha | Cambios | Código |
|---|---|---|---|
| [`v0.5`](https://github.com/iShun05/Balatro-Modpack-ES/releases/tag/v0.5) **(actual)** | 2026-10-06 | Corrige el cierre al cobrar con Piggy Bank (Talisman) y la pantalla de error que nombraba mal el mod (Guía v0.6) | [Ver código](https://github.com/iShun05/Balatro-Modpack-ES/tree/v0.5) · [ZIP](https://github.com/iShun05/Balatro-Modpack-ES/archive/refs/tags/v0.5.zip) |
| [`v0.4`](https://github.com/iShun05/Balatro-Modpack-ES/releases/tag/v0.4) | 2026-10-03 | El botón derecho del ratón vuelve a deseleccionar las cartas (ajuste de Handy) | [Ver código](https://github.com/iShun05/Balatro-Modpack-ES/tree/v0.4) · [ZIP](https://github.com/iShun05/Balatro-Modpack-ES/archive/refs/tags/v0.4.zip) |
| [`v0.3`](https://github.com/iShun05/Balatro-Modpack-ES/releases/tag/v0.3) | 2026-10-02 | Pantalla de error con el mod culpable, comprobador de mods en Multiplayer, perfiles de packs y todos los packs probados (Guía v0.5) | [Ver código](https://github.com/iShun05/Balatro-Modpack-ES/tree/v0.3) · [ZIP](https://github.com/iShun05/Balatro-Modpack-ES/archive/refs/tags/v0.3.zip) |
| [`v0.2`](https://github.com/iShun05/Balatro-Modpack-ES/releases/tag/v0.2) | 2026-10-02 | Packs de mods combinables, menú principal centrado y más cierres corregidos (Guía v0.4) | [Ver código](https://github.com/iShun05/Balatro-Modpack-ES/tree/v0.2) · [ZIP](https://github.com/iShun05/Balatro-Modpack-ES/archive/refs/tags/v0.2.zip) |
| [`v0.1`](https://github.com/iShun05/Balatro-Modpack-ES/releases/tag/v0.1) | 2026-10-02 | Primera versión: 30 mods en español, instaladores Windows/Mac, 6 cierres corregidos | [Ver código](https://github.com/iShun05/Balatro-Modpack-ES/tree/v0.1) · [ZIP](https://github.com/iShun05/Balatro-Modpack-ES/archive/refs/tags/v0.1.zip) |

Para volver a una versión: `git checkout v0.5`.

## Créditos
Cada mod pertenece a sus autores (ver su ficha en `docs/mods/`). Este pack solo los reúne, traduce y corrige su compatibilidad.

## Contacto
Instagram: [@_shun._05](https://www.instagram.com/_shun._05/)
