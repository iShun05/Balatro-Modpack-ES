return {
    descriptions={
        -- Malverk descriptions
        alt_texture = {
            alt_tex_better_esp_joker_ES = {
                name = "{C:attention}Comodines{}",
            },
            alt_tex_better_esp_joker_MX = {
                name = "{C:attention}Comodines{}",
            },
            alt_tex_better_esp_tarot = {
                name = "Cartas de {C:tarot}tarot{}",
            },
            alt_tex_better_esp_planet = {
                name = "Cartas de {C:planet}planeta{}",
            },
            alt_tex_better_esp_spectral = {
                name = "Cartas {C:spectral}espectrales{}",
            },
            alt_tex_better_esp_blind = {
                name = "Ciegas",
            },
            alt_tex_better_esp_voucher = {
                name = "Vales",
            },
            alt_tex_better_esp_shop = {
                name = "Cartel de la tienda",
            },
        },
        texture_packs = {
            texpack_better_esp_pack_ES = {
                name = "Better Spanish Locale (España)",
                text = {"Traducción de texturas", "en español de España"}
            },
            texpack_better_esp_pack_MX = {
                name = "Better Spanish Locale (México)",
                text = {"Traducción de texturas", "en español de México"}
            },
        },

        Back={
            -- Consistency: 1
            b_anaglyph={
                name="Baraja anaglifo",
                text={
                    "Después de derrotar a cada",
                    "{C:attention}ciega jefe{}, gana una",
                    "{C:attention,T:tag_double}#1#",
                },
            },
            -- ranura(s) -> ranura
            b_black={
                name="Baraja negra",
                text={
                    "{C:attention}+#1#{} ranura de comodín",
                    "",
                    "{C:blue}-#2#{} mano",
                    "en cada ronda",
                },
            },
            -- Consistency: $
            b_green={
                name="Baraja verde",
                text={
                    "Al final de cada ronda:",
                    "{C:money}#1#····${}{s:0.85} por cada {C:blue}mano restante",
                    "{C:money}#2#····${}{s:0.85} por cada {C:red}descarte restante",
                    "No ganas {C:attention}interés",
                },
            },
            -- Consistency: $
            b_yellow={
                name="Baraja amarilla",
                text={
                    "Comienza con",
                    "{C:money}#1#····${} extra",
                },
            }
        },
        Blind={
            -- Consistency: $
            bl_ox={
                name="El buey",
                text={
                    "Si se juega 1 #1#,",
                    "deja el dinero en 0····$",
                },
            },
            -- Consistency: $
            bl_tooth={
                name="El diente",
                text={
                    "Pierde 1····$",
                    "por carta jugada",
                },
            },
            -- Mistake: Wording
            bl_final_bell={
                name="Campana cerúlea",
                text={
                    "Fuerza que 1 carta",
                    "esté siempre seleccionada",
                },
            },
            -- Name changed to preserve alliteration
            bl_final_vessel={
                name="Vaso violeta",
                text={
                    "Ciega muy grande",
                },
            },
            -- Consistency: entre
            bl_wheel={
                name="La rueda",
                text={
                    " entre 7 cartas se saca",
                    "boca abajo",
                },
            },
        },
        Enhanced={
            -- Consistency: $
            m_gold={
                name="Carta de oro",
                text={
                    "{C:money}3····${} si esta",
                    "carta está en tu mano",
                    "al final de la ronda",
                },
            },
            -- Consistency: $, entre
            m_lucky={
                name="Carta de la suerte",
                text={
                    "Probabilidad de {C:green}#1# entre #3#{}",
                    "de {C:mult}+#2#{} multi",
                    "Probabilidad de {C:green}#1# entre #5#{}",
                    "de ganar {C:money}#4#····${}",
                },
            },
        },
        Joker={
            -- Consistency: entre
            j_8_ball={
                name="Bola 8",
                text={
                    "Probabilidad de {C:green}#1# entre #2#{} por cada",
                    "{C:attention}8{} jugado de crear una carta",
                    "de {C:tarot}tarot{} cuando anota",
                    "{C:inactive}(Debe haber espacio)",
                },
            },
            -- Mistake: Unlock message
            j_arrowhead={
                name="Punta de flecha",
                text={
                    "{C:chips}+#1#{} fichas por cada",
                    "carta jugada con el palo",
                    "de {C:spades}picas{} cuando anota",
                },
                unlock={
                    "Debes tener al menos {E:1,C:attention}#1#",
                    "cartas con el palo de {E:1,C:attention}#2#",
                    "en tu baraja",
                },
            },
            -- Mistake: Added missing space on unlock condition
            j_astronomer={
                name="Astrónomo",
                text={
                    "Todas las cartas de {C:planet}planeta{} y",
                    "{C:planet}paquetes celestiales{C:attention} en",
                    "la tienda son {C:attention}gratis",
                },
                unlock={
                    "Descubre todas",
                    "las cartas de {E:1,C:planet}planeta{}",
                },
            },
            -- Mistake: Unlock message
            -- Consistency: entre
            j_bloodstone={
                name="Heliotropo",
                text={
                    "Probabilidad de {C:green}#1# entre #2#{} de que",
                    "las cartas jugadas con el palo",
                    "de {C:hearts}corazones{} otorguen",
                    "multi {X:mult,C:white} X#3# {} cuando anotan",
                },
                unlock={
                    "Debes tener al menos {E:1,C:attention}#1#",
                    "cartas con el palo de {E:1,C:attention}#2#",
                    "en tu baraja",
                },
            },
            -- Consistency: Actual
            j_blue_joker={
                name="Comodín azul",
                text={
                    "{C:chips}+#1#{} fichas por cada",
                    "carta restante en la {C:attention}baraja",
                    "{C:inactive}(Actual: {C:chips}+#2#{C:inactive} fichas)",
                },
            },
            -- Consistency: $
            j_bootstraps={
                name="Botas",
                text={
                    "{C:mult}+#1#{} de multi por cada",
                    "{C:money}#2#····${} que tengas",
                    "{C:inactive}(Actual: {C:mult}+#3#{C:inactive} de multi)",
                },
                unlock={
                    "Debes tener al menos {E:1,C:attention}#1#",
                    "comodines {C:dark_edition}polícromos{}",
                },
            },
            -- Consistency: Capitalization
            j_brainstorm={
                name="Lluvia de ideas",
                text={
                    "Copia la habilidad del",
                    "{C:attention}comodín del extremo izquierdo",
                },
                unlock={
                    "Descarta una",
                    "{E:1,C:attention}escalera real",
                },
            },
            -- Consistency: $
            j_bull={
                name="Toro",
                text={
                    "{C:chips}+#1#{} fichas",
                    "por cada {C:money}1····${} que tengas",
                    "{C:inactive}(Actual: {C:chips}+#2#{C:inactive} fichas)",
                },
            },
            -- Consistency: $, entre
            j_business={
                name="Tarjeta de presentación",
                text={
                    "Las cartas de {C:attention}figuras{} tienen",
                    "una probabilidad de {C:green}#1# entre #2#{}",
                    "de otorgar {C:money}2····${} cuando anotan",
                },
            },
            -- Consistency: Actual, Xmult
            j_caino={
                name="Canio",
                text={
                    "Este comodín consigue un multi {X:mult,C:white}X#1#{}",
                    "cuando una carta de {C:attention}figura{}",
                    "queda destruida",
                    "{C:inactive}(Actual: multi {X:mult,C:white}X#2# {C:inactive})",
                },
                unlock={
                    "{E:1,s:1.3}¿?",
                },
            },
            -- Consistency: Actual
            j_campfire={
                name="Fogata",
                text={
                    "Este comodín gana multi {X:mult,C:white}X#1#{}",
                    "por cada carta {C:attention}vendida{}, se restablece",
                    "cuando se derrota a la {C:attention}ciega jefe{}",
                    "{C:inactive}(Actual: multi {X:mult,C:white} X#2# {C:inactive})",
                },
            },
            -- Mistake: Name changed
            j_card_sharp={
                name="Fullero",
                text={
                    "{X:mult,C:white} X#1#{} multi si",
                    "se jugó la {C:attention}mano de póker{}",
                    "en esta ronda",
                },
            },
            -- Mistake: remove trailing ",", cada carta -> todas las cartas
            j_cartomancer={
                name="Cartomante",
                text={
                    "Genera una carta de {C:tarot}tarot{}",
                    "cuando se selecciona la {C:attention}ciega{}",
                    "{C:inactive}(Debe haber espacio)",
                },
                unlock={
                    "Descubre todas las",
                    "cartas de {E:1,C:tarot}tarot{}",
                },
            },
            -- gana -> consigue
            j_castle={
                name="Castillo",
                text={
                    "Este comodín consigue {C:chips}+#1#{} fichas",
                    "por cada {V:1}#2#{} que se descarte,",
                    "el palo cambia en cada ronda",
                    "{C:inactive}(Actual: {C:chips}+#3#{C:inactive} fichas)",
                },
            },
            -- Consistency: entre
            j_cavendish={
                name="Cavendish",
                text={
                    "{X:mult,C:white} X#1# {} multi",
                    "Probabilidad de {C:green}#2# entre #3#{}",
                    "de que la carta se destruya",
                    "al final de la ronda",
                },
            },
            -- Consistency: Actual
            j_ceremonial={
                name="Daga ceremonial",
                text={
                    "Cuando se selecciona la {C:attention}ciega{},",
                    "destruye al comodín de la derecha",
                    "y agrega para siempre el {C:attention}doble",
                    "de valor de venta a este {C:red}multi",
                    "{C:inactive}(Actual: {C:mult}+#1#{C:inactive} multi)",
                },
            },
            -- Consistency: Capitalization
            j_certificate={
                name="Certificado",
                text={
                    "Al comienzo de la ronda,",
                    "añade una {C:attention}carta{}",
                    "{C:attention}de juego{} al azar con",
                    "un {C:attention}sello{} al azar a tu mano",
                },
                unlock={
                    "Debes tener una carta",
                    "de oro",
                    "con un {C:attention,E:1}sello de oro",
                },
            },
            -- Consistency: Renovar
            j_chaos={
                name="Caos el payaso",
                text={
                    "{C:attention}#1#{} {C:green}renovación{} gratuita",
                    "por tienda",
                },
            },
            -- Consistency: 1
            j_clever={
                name="Comodín astuto",
                text={
                    "{C:chips}+#1#{} fichas",
                    "si la mano jugada contiene",
                    "una {C:attention}#2#",
                },
            },
            -- Name changed. Reasoning:
                -- Original Spanish name was "La 9º puerta" ("The 9th Gate"), possibly a reference to the movie The Ninth Gate
                -- Closest idiom to "Cloud nine" in Spanish is "en el séptimo cielo" ("in seventh heaven")
                -- Dutch has a similar idiom, but doesn't use it here
                -- Russian has a similar idiom, changes the 7 to a 9
                -- Decided to simply leave it as "En las nubes" ("on a cloud") to represent happiness
            -- Consistency: $
            j_cloud_9={
                name="En las nubes",
                text={
                    "Gana {C:money}#1#····${} por cada",
                    "{C:attention}9{} en tu {C:attention}baraja completa",
                    "al final de la ronda",
                    "{C:inactive}(Actual: {C:money}#2#····${}{C:inactive})",
                },
            },
            -- Consistency: Xmult
            j_constellation={
                name="Constelación",
                text={
                    "Este comodín consigue",
                    "un multi {X:mult,C:white}X#1#{} cada vez",
                    "que se use una carta de {C:planet}planeta{}",
                    "{C:inactive}(Actual: multi {X:mult,C:white}X#2# {C:inactive})",
                },
            },
            -- Consistency: 1
            j_crafty={
                name="Comodín mañoso",
                text={
                    "{C:chips}+#1#{} fichas",
                    "si la mano jugada contiene",
                    "un {C:attention}#2#",
                },
            },
            -- Consistency: 1
            j_crazy={
                name="Comodín loco",
                text={
                    "{C:red,s:1.1}+#1#{} multi",
                    "si la mano contiene",
                    "una {C:attention}#2#",
                },
            },
            -- Consistency: $
            j_credit_card={
                name="Tarjeta de crédito",
                text={
                    "Adquiere hasta",
                    "{C:red}-#1#····${} de deuda",
                },
            },
            -- Consistency: $
            j_delayed_grat={
                name="Satisfacción retrasada",
                text={
                    "Gana {C:money}#1#····${} por {C:attention}descarte{}",
                    "si no se usó ninguno",
                    "al final de la ronda",
                },
            },
            -- Consistency: 1
            j_devious={
                name="Comodín ladino",
                text={
                    "{C:chips}+#1#{} fichas",
                    "si la mano jugada contiene",
                    "una {C:attention}#2#",
                },
            },
            -- Mistake: azucar -> azúcar
            -- Consistency: 1
            j_diet_cola={
                name="Cola sin azúcar",
                text={
                    "Vende esta carta para",
                    "crear una {C:attention}#1#",
                    "gratis",
                },
            },
            -- Consistency: Actual
            j_drivers_license={
                name="Permiso de conducir",
                text={
                    "{X:mult,C:white} X#1# {} multi si",
                    "tienes al menos {C:attention}16",
                    "cartas mejoradas",
                    "{C:inactive}(Actual: {C:attention}#2#{C:inactive})",
                },
                unlock={
                    "Mejora {E:1,C:attention}#1#{} cartas",
                    "en tu baraja",
                },
            },
            -- Consistency: 1
            j_droll={
                name="Comodín gracioso",
                text={
                    "{C:red,s:1.1}+#1#{} multi",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                },
            },
            -- Consistency: 1
            j_duo={
                name="El dúo",
                text={
                    "{X:mult,C:white} X#1#{} multi",
                    "si la mano contiene",
                    "una {C:attention}#2#",
                },
                unlock={
                    "Gana una partida",
                    "sin jugar",
                    "una {E:1,C:attention}#1#",
                },
            },
            -- Mistake: cartas de puntos --> cartas jugadas
            j_dusk={
                name="Atardecer",
                text={
                    "Reactiva todas las",
                    "cartas jugadas en la {C:attention}última",
                    "{C:attention}mano{} de la ronda",
                },
            },
            -- Mistake: Wording
            -- Consistency: $
            j_egg={
                name="Huevo",
                text={
                    "Aumenta en {C:money}#1#····${}",
                    "su {C:attention}valor de venta{}",
                    "al final de la ronda",
                },
            },
            -- Consistency: $
            j_faceless={
                name="Comodín sin cara",
                text={
                    "Gana {C:money}#1#····${} si {C:attention}#2#{}",
                    "o más {C:attention}cartas de figuras{}",
                    "se descartan",
                    "al mismo tiempo",
                },
            },
            -- Consistency: 1
            j_family={
                name="La familia",
                text={
                    "{X:mult,C:white} X#1#{} multi",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                },
                unlock={
                    "Gana una partida",
                    "sin jugar",
                    "un {E:1,C:attention}#1#",
                },
            },
            -- Mistake: Name changed
                -- Previously it was "Carta sorpresa" ("Surprise card")
                -- Now it's "Tarjeta didáctica" ("Educational card")
            j_flash={
                name="Tarjeta didáctica",
                text={
                    "Este comodín consigue {C:mult}+#1#{} de multi",
                    "por cada {C:attention}renovación{} de la tienda",
                    "{C:inactive}(Actual: {C:mult}+#2#{C:inactive} de multi)",
                },
            },
            -- Consistency: Xmult
            j_flower_pot={
                name="Florero",
                text={
                    "Multi {X:mult,C:white}X#1#{} si la mano",
                    "de póker contiene una carta",
                    "de {C:diamonds}diamantes{}, de {C:clubs}tréboles{},",
                    "de {C:hearts}corazones{} y de {C:spades}picas{}",
                },
                unlock={
                    "Llega a la apuesta inicial",
                    "nivel {E:1,C:attention}#1#",
                },
            },
            -- Consistency: Actual
            j_fortune_teller={
                name="Adivino",
                text={
                    "{C:red}+#1#{} multi por cada",
                    "carta de {C:purple}tarot{} usada",
                    "{C:inactive}(Actual: {C:red}+#2#{C:inactive})",
                },
            },
            -- Mistake: Name changed
            -- Mistake: de -> al
            -- Consistency: $
            j_gift={
                name="Tarjeta de regalo",
                text={
                    "Agrega {C:money}#1#····${} al {C:attention}valor de venta",
                    "a cada {C:attention}comodín{} y",
                    "carta {C:attention}consumible{}",
                    "al final de la ronda",
                },
            },
            -- Mistake:
                -- In the unlock condition, "Glass card" cannot be pluralized correctly if it's injected
                -- Thus, it was replaced by the literal string
            -- Consistency: Xmult
            j_glass={
                name="Comodín de vidrio",
                text={
                    "Este comodín consigue un multi {X:mult,C:white}X#1#{}",
                    "por cada {C:attention}carta de vidrio",
                    "que se destruya",
                    "{C:inactive}(Actual: multi {X:mult,C:white}X#2# {C:inactive})",
                },
                unlock={
                    "Debes tener al menos {E:1,C:attention}#1#",
                    "{E:1,C:attention}cartas de vidrio{} en",
                    "tu baraja",
                },
            },
            -- Consistency: $
            j_golden={
                name="Comodín dorado",
                text={
                    "Gana {C:money}#1#····${}",
                    "al final de la ronda",
                },
            },
            -- Consistency: Actual
            j_green_joker={
                name="Comodín verde",
                text={
                    "{C:mult}+#1#{} multi por mano jugada",
                    "{C:mult}-#2#{} multi por descarte",
                    "{C:inactive}(Actual: {C:mult}+#3#{C:inactive} multi)",
                },
            },
            -- Name changed from "Banano" ("Banana") to "Gros Michel"
            -- Consistency: entre
            j_gros_michel={
                name="Gros Michel",
                text={
                    "{C:mult}+#1#{} multi",
                    "Probabilidad de {C:green}#2# entre #3#{}",
                    "de que la carta se destruya",
                    "al final de la ronda",
                },
            },
            -- Name changed from "Comediante" ("Comedian") to "Comediante mediocre" ("Mediocre comedian")
            j_hack={
                name="Comediante mediocre",
                text={
                    "Reactiva todas las cartas",
                    "{C:attention}2{}, {C:attention}3{}, {C:attention}4{} y {C:attention}5{} cuando se juegan",
                },
            },
            -- Consistency: entre
            j_hallucination={
                name="Alucinación",
                text={
                    "Probabilidad de {C:green}#1# entre #2#{} de crear",
                    "una carta de {C:tarot}tarot{} cuando se abre",
                    "cualquier {C:attention}paquete potenciador{}",
                    "{C:inactive}(Debe haber espacio)",
                },
            },
            -- Name changed to "A la carretera"
            -- Consistency: Xmult
            j_hit_the_road={
                name="A la carretera",
                text={
                    "Este comodín consigue un multi {X:mult,C:white}X#1#{}",
                    "por cada {C:attention}jota{}",
                    "que se descarte en esta ronda",
                    "{C:inactive}(Actual: {X:mult,C:white}X#2# {C:inactive} multi)",
                },
                unlock={
                    "Descarta {E:1,C:attention}5",
                    "{E:1,C:attention}jotas{}",
                    "al mismo tiempo",
                },
            },
            -- Mistake: Wording
            -- Consistency: 1
            j_hanging_chad={
                name="Papel perforado",
                text={
                    "Reactiva la {C:attention}primera{} carta",
                    "jugada que se use en la puntuación",
                    "{C:attention}#1#{} veces más",
                },
                unlock={
                    "Derrota a una ciega jefe",
                    "con una {E:1,C:attention}#1#",
                },
            },
            -- Name changed
            -- Consistency: Xmult
            j_hit_the_road={
                name="A la carretera",
                text={
                    "Este comodín consigue un multi {X:mult,C:white}X#1#{}",
                    "por cada {C:attention}jota{}",
                    "que se descarte en esta ronda",
                    "{C:inactive}(Actual: multi {X:mult,C:white}X#2# {C:inactive})",
                },
                unlock={
                    "Descarta {E:1,C:attention}5",
                    "{E:1,C:attention}jotas{}",
                    "al mismo tiempo",
                },
            },
            -- Consistency: Xmult
            j_hologram={
                name="Holograma",
                text={
                    "Este comodín consigue un multi {X:mult,C:white}X#1#{} cada vez",
                    "que se añada una {C:attention}carta de juego{}",
                    "a tu baraja",
                    "{C:inactive}(Actual: multi {X:mult,C:white}X#2# {C:inactive})",
                },
            },
            -- Mistake: Fix sizing, remove trailing ",", remove "+" from unlock condition
            j_idol={
                name="El ídolo",
                text={
                    "{X:mult,C:white} X#1# {} multi por cada",
                    "{C:attention}#2# de {V:1}#3#{}",
                    "cuando anota",
                    "{s:0.8}La carta cambia en cada ronda",
                },
                unlock={
                    "En una mano,",
                    "gana al menos",
                    "{E:1,C:attention}#1#{} fichas",
                },
            },
            -- Consistency: Actual
            j_invisible={
                name="Comodín invisible",
                text={
                    "Después de {C:attention}#1#{} rondas,",
                    "vende esta carta para",
                    "{C:attention}duplicar{} un comodín aleatorio",
                    "{C:inactive}(Actual: {C:attention}#2#{C:inactive}/#1#)",
                },
                unlock={
                    "Gana una partida sin",
                    "haber tenido más de",
                    "{E:1,C:attention}4 comodines{}",
                },
            },
            -- Consistency: 1
            j_jolly={
                name="Comodín contento",
                text={
                    "{C:red,s:1.1}+#1#{} multi",
                    "si la mano contiene",
                    "una {C:attention}#2#",
                },
            },
            -- Consistency: Xmult
            j_lucky_cat={
                name="Gato de la suerte",
                text={
                    "Este comodín consigue un multi {X:mult,C:white}X#1#{} cada vez",
                    "que se active una carta de la {C:attention}suerte{}",
                    "{C:green}con éxito{}",
                    "{C:inactive}(Actual: multi {X:mult,C:white}X#2# {C:inactive})",
                },
            },
            -- Consistency: 1
            j_mad={
                name="Comodín demente",
                text={
                    "{C:red,s:1.1}+#1#{} multi",
                    "si la mano contiene",
                    "una {C:attention}#2#",
                },
            },
            -- consigues -> consigue
            -- Consistency: Xmult
            j_madness={
                name="Locura",
                text={
                    "Al seleccionar una {C:attention}ciega pequeña{} o",
                    "{C:attention}grande{}, consigue un multi {X:mult,C:white}X#1#{}",
                    "y {C:attention}destruye{} un comodín al azar",
                    "{C:inactive}(Actual: multi {X:mult,C:white}X#2# {C:inactive})",
                },
            },
            -- Consistency: $
            j_mail={
                name="Reembolso por correo",
                text={
                    "Gana {C:money}#1#····${} por cada",
                    "{C:attention}#2#{} que descartes, la categoría",
                    "cambia en cada ronda",
                },
            },
            -- Consistency: $
            j_matador={
                name="Torero",
                text={
                    "Gana {C:money}#1#····${} si la mano",
                    "jugada activa la",
                    "habilidad de la {C:attention}ciega jefe{}",
                },
                unlock={
                    "Derrota a una ciega jefe",
                    "en {E:1,C:attention}1 mano{} sin usar",
                    "ningún descarte",
                },
            },
            -- Improved line breaks
            j_mime={
                name="Mimo",
                text={
                    "Reactiva todas las",
                    "habilidades de las cartas",
                    "{C:attention}en {C:attention}la mano{}",
                },
            },
            -- Replaced non-breaking space by regular space (font does not render them)
            j_mr_bones={
                name="Sr. Huesos",
                text={
                    "Evita la muerte",
                    "si las fichas obtenidas son",
                    "al menos un {C:attention}25 %",
                    "de lo requerido,",
                    "se {S:1.1,C:red,E:2}autodestruye{}",
                },
                unlock={
                    "Pierde {C:attention,E:1}#1#{} partidas",
                    "{C:inactive}(#2#)",
                },
            },
            -- Mistake: Removed "+" before discards
            j_mystic_summit={
                name="Cumbre mística",
                text={
                    "{C:mult}+#1#{} multi cuando hay",
                    "{C:attention}#2#{} descartes",
                    "restantes",
                },
            },
            -- Mistake: El -> Este
            -- Consistency: Xmult
            j_obelisk={
                name="Obelisco",
                text={
                    "Este comodín consigue un multi {X:mult,C:white}X#1#{}",
                    "por cada mano {C:attention}consecutiva{} jugada",
                    "sin usar tu {C:attention}mano de póker",
                    "que hayas jugado más",
                    "{C:inactive}(Actual: multi {X:mult,C:white}X#2# {C:inactive})",
                },
            },
            -- Mistake: Unlock message
            j_onyx_agate={
                name="Ágata ónix",
                text={
                    "{C:mult}+#1#{} multi por cada",
                    "carta jugada con el palo",
                    "de {C:clubs}tréboles{} cuando anota",
                },
                unlock={
                    "Debes tener al menos {E:1,C:attention}#1#",
                    "cartas con el palo de {E:1,C:attention}#2#",
                    "en tu baraja",
                },
            },
            -- Mistake: "listed" was translated as "list", removed "+" from unlock condition
            -- Consistency: entre, ej
            j_oops={
                name="Solo seises",
                text={
                    "Duplica todas las {C:green,E:1,S:1.1}probabilidades",
                    "{C:attention}mostradas",
                    "{C:inactive}(ej: {C:green}1 entre 3{C:inactive} -> {C:green}2 entre 3{C:inactive})",
                },
                unlock={
                    "En una mano,",
                    "gana al menos",
                    "{E:1,C:attention}#1#{} fichas",
                },
            },
            -- Consistency: 1
            j_order={
                name="La orden",
                text={
                    "{X:mult,C:white} X#1#{} multi",
                    "si la mano contiene",
                    "una {C:attention}#2#",
                },
                unlock={
                    "Gana una partida",
                    "sin jugar",
                    "una {E:1,C:attention}#1#",
                },
            },
            -- Consistency: $, entre
            j_reserved_parking={
                name="Estacionamiento reservado",
                text={
                    "Cada carta de {C:attention}figura{}",
                    "en tu mano tiene",
                    "una probabilidad de {C:green}#2# entre #3#{}",
                    "de otorgar {C:money}#1#····${}",
                },
            },
            -- Mistake: Extra space
            -- Consistency: Debe haber espacio
            j_riff_raff={
                name="Gentuza",
                text={
                    "Cuando se selecciona la {C:attention}ciega{},",
                    "crea {C:attention}#1# comodines {C:blue}comunes",
                    "{C:inactive}(Debe haber espacio)",
                },
            },
            -- Mistake: Name changed. Translation refers to "Ring Master"
            j_ring_master={
                name="Hombre espectáculo",
                text={
                    "Las cartas de {C:attention}comodines{}, {C:tarot}tarot{}, {C:planet}planetas{}",
                    "y {C:spectral}espectrales{} pueden aparecen",
                    "varias veces",
                },
                unlock={
                    "Llega a la apuesta inicial",
                    "nivel {E:1,C:attention}#1#",
                },
            },
            -- Mistake: Space between "$" and "al"
            -- Consistency: $
            j_rocket={
                name="Cohete",
                text={
                    "Gana {C:money}#1#····${} al final de la ronda",
                    "El pago aumenta en {C:money}#2#····${}",
                    "al derrotar a la {C:attention}ciega jefe{}",
                },
            },
            -- Mistake: Unlock message
            -- Consistency: $
            j_rough_gem={
                name="Gema en bruto",
                text={
                    "{C:money}#1#····${} por cada",
                    "carta jugada con el palo",
                    "de {C:diamonds}diamantes{} cuando anota",
                },
                unlock={
                    "Debes tener al menos {E:1,C:attention}#1#",
                    "cartas con el palo de {E:1,C:attention}#2#",
                    "en tu baraja",
                },
            },
            -- Consistency: Actual
            j_runner={
                name="Corredor",
                text={
                    "{C:chips}+#2#{} fichas",
                    "si la mano jugada",
                    "contiene una {C:attention}escalera{}",
                    "{C:inactive}(Actual: {C:chips}+#1#{C:inactive} fichas)",
                },
            },
            -- Consistency: $, Actual
            j_satellite={
                name="Satélite",
                text={
                    "Gana {C:money}#1#····${} al final de",
                    "la ronda por cada carta de {C:planet}planeta",
                    "única usada en esta partida",
                    "{C:inactive}(Actual: {C:money}#2#····${}{C:inactive})",
                },
                unlock={
                    "Debes tener {E:1,C:money}#1#····${}",
                    "o más",
                },
            },
            -- Consistency: Debe haber espacio
            j_seance={
                name="Espiritismo",
                text={
                    "Si {C:attention}la mano de póker{} es una",
                    "{C:attention}#1#{}, genera una",
                    "carta {C:spectral}espectral{} al azar",
                    "{C:inactive}(Debe haber espacio)",
                },
            },
            -- Consistency: 1
            j_sly={
                name="Comodín artero",
                text={
                    "{C:chips}+#1#{} fichas",
                    "si la mano jugada contiene",
                    "una {C:attention}#2#",
                },
            },
            -- Mistake: Capitalization, trailing ",", substituted
            -- In the unlock condition, "Wild card" cannot be pluralized correctly if it's injected
            -- Thus, it was replaced by the literal string
            j_smeared={
                name="Comodín borroso",
                text={
                    "{C:hearts}Corazones{} y {C:diamonds}diamantes",
                    "cuentan como un mismo palo,",
                    "{C:spades}picas{} y {C:clubs}tréboles",
                    "cuentan como un mismo palo",
                },
                unlock={
                    "Debes tener al menos {C:attention}#1#",
                    "{E:1,C:attention}cartas versátiles{} en",
                    "tu baraja",
                },
            },
            -- aumento -> aumentar
            -- Consistency: entre
            j_space={
                name="Comodín espacial",
                text={
                    "Probabilidad de {C:green}#1# entre #2#{}",
                    "de aumentar el nivel",
                    "de la {C:attention}mano de póker{} jugada",
                },
            },
            -- Consistency: Xmult
            j_steel_joker={
                name="Comodín de acero",
                text={
                    "Otorga un multi {X:mult,C:white}X#1#{}",
                    "por cada {C:attention}carta de acero",
                    "en la {C:attention}baraja completa",
                    "{C:inactive}(Actual: multi {X:mult,C:white}X#2# {C:inactive})",
                },
            },
            -- Consistency: Actual
            j_stencil={
                name="Plantilla de comodín",
                text={
                    "{X:red,C:white} X1 {} multi por cada",
                    "ranura de {C:attention}comodín{} vacía",
                    "{s:0.8}Plantilla de comodín incluida",
                    "{C:inactive}(Actual: {X:red,C:white} X#1# {C:inactive})",
                },
            },
            -- tamaño -> de tamaño
            j_stuntman={
                name="Doble de riesgo",
                text={
                    "{C:chips}+#1#{} fichas,",
                    "{C:attention}-#2#{} de tamaño de mano",
                },
                unlock={
                    "En una mano,",
                    "gana al menos",
                    "{E:1,C:attention}#1#{} fichas",
                },
            },
            -- una -> la
            j_supernova={
                name="Supernova",
                text={
                    "Añade al multi el número de veces",
                    "que se haya jugado la {C:attention}mano de póker{}",
                    "en esta partida",
                },
            },
            -- Consistency: Actual
            j_throwback={
                name="Retro",
                text={
                    "Gana {X:mult,C:white} X#1# {} multi por cada",
                    "{C:attention}ciega{} omitida en esta partida",
                    "{C:inactive}(Actual: {X:mult,C:white} X#2# {C:inactive} multi)",
                },
                unlock={
                    "Continúa una partida guardada",
                    "del menú principal",
                },
            },
            -- Consistency: $
            j_ticket={
                name="Billete dorado",
                text={
                    "Las cartas de {C:attention}oro{} jugadas",
                    "ganan {C:money}#1#····${} cuando anotan",
                },
                unlock={
                    "Juega una mano de 5 cartas",
                    "que contiene solo",
                    "cartas de {C:attention,E:1}oro{}",
                },
            },
            -- Consistency: $
            j_to_the_moon={
                name="Hasta la luna",
                text={
                    "Gana {C:money}#1#····${} extra",
                    "de {C:attention}interés{} por cada {C:money}5····${}",
                    "que tengas al final de la ronda",
                },
            },
            -- . -> ,
            j_todo_list={
                name="Lista de tareas",
                text={
                    "Gana {C:money}#1#····${} si la {C:attention}mano de póker{}",
                    "es 1 {C:attention}#2#{},",
                    "la mano de póker cambia",
                    "al final de la ronda",
                },
            },
            -- Consistency: $
            j_trading={
                name="Carta de colección",
                text={
                    "Si el {C:attention}primer descarte{} de la ronda",
                    "tiene solo {C:attention}1{} carta, destrúyela",
                    "y gana {C:money}#1#····${}",
                },
            },
            -- Consistency: 1
            j_tribe={
                name="La tribu",
                text={
                    "{X:mult,C:white} X#1#{} multi",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                },
                unlock={
                    "Gana una partida",
                    "sin jugar",
                    "un {E:1,C:attention}#1#",
                },
            },
            -- Mistake: Trailing ","
            j_triboulet={
                name="Triboulet",
                text={
                    "Los {C:attention}reyes{} y las",
                    "{C:attention}reinas{} jugados otorgan",
                    "multi {X:mult,C:white} X#1# {} cuando anotan",
                },
                unlock={
                    "{E:1,s:1.3}¿?",
                },
            },
            -- Consistency: 1
            j_trio={
                name="El trío",
                text={
                    "{X:mult,C:white} X#1#{} multi",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                },
                unlock={
                    "Gana una partida",
                    "sin jugar",
                    "un {E:1,C:attention}#1#",
                },
            },
            -- Mistake: de mano -> mano
            -- al jugar -> jugando
            j_troubadour={
                name="Trovador",
                text={
                    "Sujeta {C:attention}+#1#{} cartas en la mano,",
                    "{C:blue}-#2#{} mano en cada ronda",
                },
                unlock={
                    "Gana {C:attention,E:1}#1#{} rondas",
                    "consecutivas jugando",
                    "1 sola mano",
                },
            },
            -- Mistake: Missing "una"
            j_trousers={
                name="Pantalones de repuesto",
                text={
                    "Este comodín consigue {C:mult}+#1#{} de multi",
                    "si la mano jugada contiene",
                    "una {C:attention}#2#",
                    "{C:inactive}(Actual: {C:red}+#3#{C:inactive} de multi)",
                },
            },
            -- Consistency: $
            j_vagabond={
                name="Vagabundo",
                text={
                    "Crea una carta de {C:purple}tarot{}",
                    "si se juega una mano",
                    "con {C:money}#1#····${} o menos",
                },
            },
            -- Mistake: Missing space, rephrasing
            -- Consistency: Xmult
            j_vampire={
                name="Vampiro",
                text={
                    "Este comodín consigue un multi {X:mult,C:white}X#1#{}",
                    "por cada {C:attention}carta mejorada{} que anote",
                    "y elimina la {C:attention}mejora de la carta",
                    "{C:inactive}(Actual: multi {X:mult,C:white}X#2# {C:inactive})",
                },
            },
            -- Mistake: Description was wrong
            -- Consistency: Actual
            j_wee={
                name="Comodín pequeño",
                text={
                    "Este comodín consigue",
                    "{C:chips}+#2#{} fichas cada vez",
                    "que un {C:attention}2{} jugado anota",
                    "{C:inactive}(Actual: {C:chips}+#1#{C:inactive} fichas)",
                },
                unlock={
                    "Gana una partida en {E:1,C:attention}#1#",
                    "rondas o menos",
                },
            },
            -- Consistency: 1
            j_wily={
                name="Comodín taimado",
                text={
                    "{C:chips}+#1#{} fichas",
                    "si la mano jugada contiene",
                    "un {C:attention}#2#",
                },
            },
            -- Mistake: Missing space
            -- Consistency: Xmult
            j_yorick={
                name="Yorick",
                text={
                    "Este comodín consigue",
                    "un multi {X:mult,C:white}X#1#{} por cada",
                    "{C:attention}#2#{C:inactive} [#3#]{} cartas que descartes",
                    "{C:inactive}(Actual: multi {X:mult,C:white}X#4# {C:inactive})",
                },
                unlock={
                    "{E:1,s:1.3}¿?",
                },
            },
            -- Consistency: 1
            j_zany={
                name="Comodín chiflado",
                text={
                    "{C:red,s:1.1}+#1#{} multi",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                },
            },
        },
        Other={
            -- Consistency: Pegatina
            black_sticker={
                name="Pegatina negra",
                text={
                    "Usaste este comodín",
                    "para ganar en la dificultad",
                    "{C:attention}Pozo negro{}",
                },
            },
            -- Consistency: Pegatina
            blue_sticker={
                name="Pegatina azul",
                text={
                    "Usaste este comodín",
                    "para ganar en la dificultad",
                    "{C:attention}Pozo azul{}",
                },
            },
            -- gana -> puntúa
            debuffed_playing_card={
                name="Debilitada",
                text={
                    "No puntúa ninguna ficha",
                    "y todas las habilidades",
                    "están inhabilitadas",
                },
            },
            -- Consistency: $
            gold_seal={
                name="Sello de oro",
                text={
                    "Gana {C:money}3····${} cuando",
                    "se juega esta carta",
                    "y anota",
                },
            },
            -- Consistency: Pegatina
            gold_sticker={
                name="Pegatina de oro",
                text={
                    "Usaste este comodín",
                    "para ganar en la dificultad",
                    "{C:attention}Pozo de oro{}",
                },
            },
            -- Consistency: Pegatina
            green_sticker={
                name="Pegatina verde",
                text={
                    "Usaste este comodín",
                    "para ganar en la dificultad",
                    "{C:attention}Pozo verde{}",
                },
            },
            -- Consistency: Pegatina
            orange_sticker={
                name="Pegatina naranja",
                text={
                    "Usaste este comodín",
                    "para ganar en la dificultad",
                    "{C:attention}Pozo naranja{}",
                },
            },
            -- Consistency: Jumbo
            p_arcana_jumbo={
                name="Paquete arcano enorme",
                text={
                    "Elige {C:attention}#1#{} de hasta",
                    "{C:attention}#2# cartas de {C:tarot}tarot{}",
                    "para usar de inmediato",
                },
            },
            -- Mistake: parausar -> para usar
            p_arcana_mega={
                name="Paquete arcano mega",
                text={
                    "Elige {C:attention}#1#{} de hasta",
                    "{C:attention}#2# cartas de {C:tarot}tarot{}",
                    "para usar de inmediato",
                },
            },
            -- Consistency: Jumbo
            p_buffoon_jumbo={
                name="Paquete de bufón enorme",
                text={
                    "Elige {C:attention}#1#{} de hasta",
                    "{C:attention}#2# cartas de {C:joker}comodín{}",
                },
            },
            -- Consistency: Jumbo
            p_celestial_jumbo={
                name="Paquete celestial enorme",
                text={
                    "Elige {C:attention}#1#{} de hasta",
                    "{C:attention}#2# cartas de {C:planet}planeta{}",
                    "para usar de inmediato",
                },
            },
            -- Consistency: Jumbo
            p_spectral_jumbo={
                name="Paquete espectral enorme",
                text={
                    "Elige {C:attention}#1#{} de hasta",
                    "{C:attention}#2# cartas {C:spectral}espectrales{}",
                    "para usar de inmediato",
                },
            },
            -- Consistency: Jumbo
            p_standard_jumbo={
                name="Paquete estándar enorme",
                text={
                    "Elige {C:attention}#1#{} de hasta",
                    "{C:attention}#2# cartas {C:attention}de juego{}",
                    "para agregar a tu baraja",
                },
            },
            -- Se agota -> Debilitado
            -- Removed trailing space
            perishable={
                name="Perecedero",
                text={
                    "Debilitado al cabo de",
                    "{C:attention}#1#{} rondas",
                    "{C:inactive}({C:attention}#2#{C:inactive} restantes)",
                },
            },
            -- Mistake: negro -> morado ; Para -> para
            -- Consistency: Pegatina
            purple_sticker={
                name="Pegatina morada",
                text={
                    "Usaste este comodín",
                    "para ganar en la dificultad",
                    "{C:attention}Pozo morado{}",
                },
            },
            -- Consistency: Pegatina
            red_sticker={
                name="Pegatina roja",
                text={
                    "Usaste este comodín",
                    "para ganar en la dificultad",
                    "{C:attention}Pozo rojo{}",
                },
            },
            -- Consistency: $
            rental={
                name="De alquiler",
                text={
                    "Pierdes {C:money}#1#····${}",
                    "al final de la ronda",
                },
            },
            -- Consistency: Pegatina
            white_sticker={
                name="Pegatina blanco",
                text={
                    "Usaste este comodín",
                    "para ganar en la dificultad",
                    "{C:attention}Pozo blanco{}",
                },
            },
        },
        Planet={
            -- Consistency: Aumenta
            c_ceres={
                name="Ceres",
                text={
                    "{S:0.8}({S:0.8,V:1}nvl. #1#{S:0.8}){} Aumenta de nivel",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} multi y",
                    "{C:chips}+#4#{} fichas",
                },
            },
            -- Consistency: Aumenta
            c_earth={
                name="Tierra",
                text={
                    "{S:0.8}({S:0.8,V:1}nvl. #1#{S:0.8}){} Aumenta de nivel",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} multi y",
                    "{C:chips}+#4#{} fichas",
                },
            },
            -- Mistake: lvl. moved to front
            -- Consistency: Aumenta
            c_eris={
                name="Eris",
                text={
                    "{S:0.8}({S:0.8,V:1}nvl. #1#{S:0.8}){} Aumenta de nivel",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} multi y",
                    "y {C:chips}+#4#{} fichas",
                },
            },
            -- Consistency: Aumenta
            c_jupiter={
                name="Júpiter",
                text={
                    "{S:0.8}({S:0.8,V:1}nvl. #1#{S:0.8}){} Aumenta de nivel",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} multi y",
                    "{C:chips}+#4#{} fichas",
                },
            },
            -- Consistency: Aumenta
            c_mars={
                name="Marte",
                text={
                    "{S:0.8}({S:0.8,V:1}nvl. #1#{S:0.8}){} Aumenta de nivel",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} multi y",
                    "{C:chips}+#4#{} fichas",
                },
            },
            -- Consistency: Aumenta
            c_mercury={
                name="Mercurio",
                text={
                    "{S:0.8}({S:0.8,V:1}nvl. #1#{S:0.8}){} Aumenta de nivel",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} multi y",
                    "{C:chips}+#4#{} fichas",
                },
            },
            -- Consistency: Aumenta
            c_neptune={
                name="Neptuno",
                text={
                    "{S:0.8}({S:0.8,V:1}nvl. #1#{S:0.8}){} Aumenta de nivel",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} multi y",
                    "{C:chips}+#4#{} fichas",
                },
            },
            -- Consistency: Aumenta
            c_planet_x={
                name="Planeta X",
                text={
                    "{S:0.8}({S:0.8,V:1}nvl. #1#{S:0.8}){} Aumenta de nivel",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} multi y",
                    "{C:chips}+#4#{} fichas",
                },
            },
            -- Consistency: Aumenta
            c_pluto={
                name="Plutón",
                text={
                    "{S:0.8}({S:0.8,V:1}nvl. #1#{S:0.8}){} Aumenta de nivel",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} multi y",
                    "{C:chips}+#4#{} fichas",
                },
            },
            -- Consistency: Aumenta
            c_saturn={
                name="Saturno",
                text={
                    "{S:0.8}({S:0.8,V:1}nvl. #1#{S:0.8}){} Aumenta de nivel",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} multi y",
                    "{C:chips}+#4#{} fichas",
                },
            },
            -- Consistency: Aumenta
            c_uranus={
                name="Urano",
                text={
                    "{S:0.8}({S:0.8,V:1}nvl. #1#{S:0.8}){} Aumenta de nivel",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} multi y",
                    "{C:chips}+#4#{} fichas",
                },
            },
            -- Consistency: Aumenta
            c_venus={
                name="Venus",
                text={
                    "{S:0.8}({S:0.8,V:1}nvl. #1#{S:0.8}){} Aumenta de nivel",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} multi y",
                    "{C:chips}+#4#{} fichas",
                },
            },
        },
        Spectral={
            -- Mistake: efectos -> un efecto
            c_aura={
                name="Aura",
                text={
                    "Agrega un efecto de {C:dark_edition}laminado{}, {C:dark_edition}holográfico{}",
                    "o {C:dark_edition}polícromo{} a",
                    "{C:attention}1{} carta de tu mano seleccionada",
                },
            },
            -- Mistake: Remove "al azar"
            c_deja_vu={
                name="Déjà vu",
                text={
                    "Agrega un {C:red}sello rojo{}",
                    "a {C:attention}1{} carta seleccionada",
                    "de tu mano",
                },
            },
            -- Mistake: Missing ","
            c_ectoplasm={
                name="Ectoplasma",
                text={
                    "Agrega {C:dark_edition}negativo{}",
                    "a un {C:attention}comodín al azar,",
                    "{C:red}-1{} de tamaño de mano",
                },
            },
            -- Consistency: $
            c_immolate={
                name="Inmolación",
                text={
                    "Destruye {C:attention}#1#{} cartas",
                    "de tu mano al azar,",
                    "gana {C:money}#2#····${}",
                },
            },
            -- Mistake: Remove "al azar"
            c_medium={
                name="Médium",
                text={
                    "Agrega un {C:purple}sello morado{}",
                    "a {C:attention}1{} carta seleccionada",
                    "de tu mano",
                },
            },
            -- Consistency: Capitalization
            c_talisman={
                name="Talismán",
                text={
                    "Agrega un {C:attention}sello de oro{}",
                    "a {C:attention}1{} carta seleccionada",
                    "de tu mano",
                },
            },
            -- Mistake: Remove "al azar"
            c_trance={
                name="Trance",
                text={
                    "Agrega un {C:blue}sello azul{}",
                    "a {C:attention}1{} carta seleccionada",
                    "de tu mano al azar",
                },
            },
            -- Consistency: $
            c_wraith={
                name="Espectro",
                text={
                    "Genera una carta",
                    "de {C:attention}comodín{} {C:red}rara{} al azar,",
                    "deja el dinero en {C:money}0····${}",
                },
            },
        },
        Stake={
            -- Mistake: Applies all previous Stakes
            stake_black={
                name="Pozo negro",
                text={
                    "La tienda puede tener comodines {C:attention}eternos{}",
                    "{C:inactive,s:0.8}(No se pueden vender ni destruir)",
                    "{s:0.8}Se aplican todos los pozos anteriores",
                },
            },
            stake_blue={
                name="Pozo azul",
                text={
                    "{C:red}-1{} descarte",
                    "{s:0.8}Se aplican todos los pozos anteriores",
                },
            },
            stake_gold={
                name="Pozo de oro",
                text={
                    "En la tienda puede haber comodines {C:attention}de alquiler{}",
                    "{C:inactive,s:0.8}(Cuestan {C:money,s:0.8}3····${}{C:inactive,s:0.8} por ronda)",
                    "{s:0.8}Se aplican todos los pozos anteriores",
                },
            },
            stake_green={
                name="Pozo verde",
                text={
                    "Escalas de puntos requeridas más rápidas",
                    "para cada {C:attention}apuesta inicial",
                    "{s:0.8}Se aplican todos los pozos anteriores",
                },
            },
            stake_orange={
                name="Pozo naranja",
                text={
                    "En la tienda puede haber comodines {C:attention}perecederos{}",
                    "{C:inactive,s:0.8}(Debilitados al cabo de 5 rondas)",
                    "{s:0.8}Se aplican todos los pozos anteriores",
                },
            },
            stake_purple={
                name="Pozo morado",
                text={
                    "Escalas de puntos requeridas más rápidas",
                    "para cada {C:attention}apuesta inicial",
                    "{s:0.8}Se aplican todos los pozos anteriores",
                },
            },
            stake_red={
                name="Pozo rojo",
                text={
                    "La {C:attention}ciega pequeña{} no otorga",
                    "ninguna recompensa monetaria",
                    "{s:0.8}Se aplican todos los pozos anteriores",
                },
            },
        },
        Tag={
            -- Consistency: $
            tag_d_six={
                name="Etiqueta D6",
                text={
                    "Las renovaciones en la tienda siguiente",
                    "comienzan en {C:money}0····${}",
                },
            },
            -- Mistake: Missing space, wording
            tag_foil={
                name="Etiqueta laminada",
                text={
                    "El siguiente comodín de edición base",
                    "de la tienda es gratuito",
                    "y se convierte en {C:dark_edition}laminado",
                },
            },
            -- Consistency: $
            tag_garbage={
                name="Etiqueta de basura",
                text={
                    "Otorga {C:money}#1#····${} por cada",
                    "{C:red}descarte{} sin usar en esta partida",
                    "{C:inactive}(Otorgará {C:money}#2#····${}{C:inactive})",
                },
            },
            -- Consistency: $
            tag_handy={
                name="Etiqueta manual",
                text={
                    "Otorga {C:money}#1#····${} por cada",
                    "{C:blue}mano{} en esta partida",
                    "{C:inactive}(Otorgará {C:money}#2#····${}{C:inactive})",
                },
            },
            -- Mistake: Missing space, wording
            tag_holo={
                name="Etiqueta holográfica",
                text={
                    "El siguiente comodín de edición base",
                    "de la tienda es gratuito",
                    "y se convierte en {C:dark_edition}holográfico",
                },
            },
            -- Consistency: $
            tag_investment={
                name="Etiqueta de inversión",
                text={
                    "Después de derrotar",
                    "a la ciega jefe,",
                    "gana {C:money}#1#····${}",
                },
            },
            -- Mistake: Missing space, wording
            tag_negative={
                name="Etiqueta negativa",
                text={
                    "El siguiente comodín de edición base",
                    "de la tienda es gratuito",
                    "y se convierte en {C:dark_edition}negativo",
                },
            },
            -- Mistake: Missing space, wording
            tag_polychrome={
                name="Etiqueta polícroma",
                text={
                    "El siguiente comodín de edición base",
                    "de la tienda es gratuito",
                    "y se convierte en {C:dark_edition}polícromo",
                },
            },
            -- Mistake: and it's free
            tag_rare={
                name="Etiqueta rara",
                text={
                    "En la tienda hay",
                    "un {C:red}comodín raro{} gratuito",
                },
            },
            -- Consistency: $
            tag_skip={
                name="Etiqueta de velocidad",
                text={
                    "Otorga {C:money}#1#····${} por ciega",
                    "omitida en esta partida",
                    "{C:inactive}(Otorgará {C:money}#2#····${}{C:inactive})",
                },
            },
            -- Mistake: and it's free
            tag_uncommon={
                name="Etiqueta inusual",
                text={
                    "En la tienda hay",
                    "un {C:green}comodín inusual{} gratuito",
                },
            },
        },
        Tarot={
            -- acomodar -> reordenar
            c_death={
                name="La muerte",
                text={
                    "Selecciona {C:attention}#1#{} cartas,",
                    "convierte la carta {C:attention}izquierda{}",
                    "en la carta {C:attention}derecha{}",
                    "{C:inactive}(Arrastra para reordenar)",
                },
            },
            -- Consistency: formatting
            c_empress={
                name="La emperatriz",
                text={
                    "Mejora {C:attention}#1#{} cartas",
                    "seleccionadas a",
                    "{C:attention}#2#s",
                },
            },
            -- Consistency: formatting
            c_heirophant={
                name="El hierofante",
                text={
                    "Mejora {C:attention}#1#{} cartas",
                    "seleccionadas a",
                    "{C:attention}#2#",
                },
            },
            -- Consistency: $
            c_hermit={
                name="El ermitaño",
                text={
                    "Duplica el dinero",
                    "{C:inactive}(Máx. de {C:money}#1#····${}{C:inactive})",
                },
            },
            -- Consistency: formatting
            c_magician={
                name="El mago",
                text={
                    "Mejora {C:attention}#1#{} cartas",
                    "seleccionadas a",
                    "{C:attention}#2#",
                },
            },
            -- Consistency: $, Actual
            c_temperance={
                name="La templanza",
                text={
                    "Otorga el valor total de venta",
                    "de todos los comodines",
                    "actuales {C:inactive}(Máx. de {C:money}#1#····${}{C:inactive})",
                    "{C:inactive}(Actual: {C:money}#2#····${}{C:inactive})",
                },
            },
            -- Mistake: General phrasing
            -- Consistency: entre
            c_wheel_of_fortune={
                name="La rueda de la fortuna",
                text={
                    "Probabilidad de {C:green}#1# entre #2#{} de agregar",
                    "un efecto de {C:dark_edition}laminado{}, {C:dark_edition}holográfico{} o",
                    "{C:dark_edition}polícromo{}",
                    "a un {C:attention}comodín al azar",
                },
            },
        },
        Voucher={
            -- Replaced non-breaking space by regular space (font does not render them)
            v_clearance_sale={
                name="Rebajas",
                text={
                    "Todas las cartas y paquetes",
                    "en la tienda a {C:attention}#1# %{} menos",
                },
            },
            -- Consistency: $
            v_directors_cut={
                name="Versión del director",
                text={
                    "Renueva la ciega jefe",
                    "{C:attention}1{} vez por apuesta inicial,",
                    "{C:money}#1#····${} por cambio",
                },
            },
            -- Mistake: times more often
            v_glow_up={
                name="Brillo",
                text={
                    "Las cartas {C:dark_edition}laminadas{}, {C:dark_edition}holográficas{}",
                    "y {C:dark_edition}polícromas{}",
                    "aparecen {C:attention}#1# X{} más a menudo",
                },
                unlock={
                    "Debes tener al menos {C:attention}#1#",
                    "cartas de {C:attention}comodín{}",
                    "que sean {C:dark_edition}laminadas{}, {C:dark_edition}holográficas{} o",
                    "{C:dark_edition}polícromas{}",
                },
            },
            -- mano(s) -> mano
            v_grabber={
                name="Acaparador",
                text={
                    "Gana para siempre",
                    "{C:blue}+#1#{} mano",
                    "en cada ronda",
                },
            },
            -- Mistake: de mano -> mano
            v_hieroglyph={
                name="Jeroglífico",
                text={
                    "Rebaja {C:attention}-#1#{} la apuesta inicial,",
                    "{C:blue}-#1#{} mano",
                    "en cada ronda",
                },
            },
            -- Mistake: times more often
            v_hone={
                name="Perfección",
                text={
                    "Las cartas {C:dark_edition}laminadas{}, {C:dark_edition}holográficas{}",
                    "y {C:dark_edition}polícromas{}",
                    "aparecen {C:attention}#1# X{} más a menudo",
                },
            },
            -- Replaced non-breaking space by regular space (font does not render them)
            v_liquidation={
                name="Liquidación",
                text={
                    "Todas las cartas y paquetes",
                    "en la tienda a {C:attention}#1# %{} menos",
                },
                unlock={
                    "Canjea al menos",
                    "{C:attention}#1# cartas de{C:voucher} vale{}",
                    "en una partida",
                },
            },
            -- Consistency: $
            v_money_tree={
                name="Árbol del dinero",
                text={
                    "Aumenta el límite",
                    "del interés obtenido en cada ronda",
                    "hasta {C:money}#1#····${}",
                },
                unlock={
                    "Maximiza la ganancia",
                    "de interés por ronda durante",
                    "{C:attention}#1# rondas{} consecutivas",
                    "{C:inactive}(#2#)",
                },
            },
            -- mano(s) -> mano; por -> en cada
            v_nacho_tong={
                name="Pinza para nachos",
                text={
                    "Gana para siempre",
                    "{C:blue}+#1#{} mano",
                    "en cada ronda",
                },
                unlock={
                    "Juega un total",
                    "de {C:attention}#1#{} cartas",
                    "{C:inactive}(#2#)",
                },
            },
            -- Consistency: $
            v_overstock_plus={
                name="Excedente plus",
                text={
                    "{C:attention}+1{} ranura de carta",
                    "disponible en la tienda",
                },
                unlock={
                    "Gasta un total",
                    "de {C:money}#1#····${} en la tienda",
                    "{C:inactive}(#2#····$)",
                },
            },
            -- Mistake: added "de"
            v_paint_brush={
                name="Brocha",
                text={
                    "{C:attention}+#1#{} de tamaño de mano",
                },
            },
            -- Mistake: added "de"
            v_palette={
                name="Paleta",
                text={
                    "{C:attention}+#1#{} de tamaño de mano",
                },
                unlock={
                    "Reduce el tamaño",
                    "de mano a {C:attention}#1#{} cartas",
                },
            },
            -- Mistake: times more often
            v_planet_merchant={
                name="Mercader de planetas",
                text={
                    "Las cartas de {C:planet}planeta{} aparecen",
                    "{C:attention}#1# X{} más a menudo",
                    "en la tienda",
                },
            },
            -- Mistake: times more often
            v_planet_tycoon={
                name="Magnate de planetas",
                text={
                    "Las cartas de {C:planet}planeta{} aparecen",
                    "{C:attention}#1# X{} más a menudo",
                    "en la tienda",
                },
                unlock={
                    "Compra un total",
                    "{C:attention}#1# cartas de {C:planet}planeta{}",
                    "en la tienda",
                    "{C:inactive}(#2#)",
                },
            },
            -- Mistake: descartes -> descarte
            v_recyclomancy={
                name="Reciclomancia",
                text={
                    "Consigue {C:red}+#1#{}",
                    "descarte en cada ronda",
                    "de forma permanente",
                },
                unlock={
                    "Descarta un total",
                    "de {C:attention}#1#{} cartas",
                    "{C:inactive}(#2#)",
                },
            },
            -- Consistency: $
            v_reroll_glut={
                name="Gula de renovaciones",
                text={
                    "Las renovaciones cuestan",
                    "{C:money}#1#····${} menos",
                },
                unlock={
                    "Renueva la tienda",
                    "un total de {C:attention}#1#{} veces",
                    "{C:inactive}(#2#)",
                },
            },
            -- Consistency: $
            v_reroll_surplus={
                name="Excedente de renovaciones",
                text={
                    "Las renovaciones cuestan",
                    "{C:money}#1#····${} menos",
                },
            },
            -- Consistency: $
            v_retcon={
                name="Retrocontinuidad",
                text={
                    "Renueva la ciega jefe",
                    "de forma {C:attention}ilimitada{},",
                    "{C:money}#1#····${} por cambio",
                },
                unlock={
                    "Descubre",
                    "{C:attention}#1#{} ciegas",
                },
            },
            -- Consistency: $
            v_seed_money={
                name="Capital inicial",
                text={
                    "Aumenta el límite",
                    "del interés obtenido en cada ronda",
                    "hasta {C:money}#1#····${}",
                },
            },
            -- Mistake: times more often
            v_tarot_merchant={
                name="Mercader de tarot",
                text={
                    "Las cartas de {C:tarot}tarot{} aparecen",
                    "{C:attention}#1# X{} más a menudo",
                    "en la tienda",
                },
            },
            -- Mistake: times more often
            v_tarot_tycoon={
                name="Magnate del tarot",
                text={
                    "Las cartas de {C:tarot}tarot{} aparecen",
                    "{C:attention}#1# X{} más a menudo",
                    "en la tienda",
                },
                unlock={
                    "Compra un total",
                    "de {C:attention}#1# cartas de{C:tarot} tarot{}",
                    "en la tienda",
                    "{C:inactive}(#2#)",
                },
            },
            -- Mistake: descartes -> descarte
            v_wasteful={
                name="Derrochador",
                text={
                    "Consigue {C:red}+#1#{}",
                    "descarte en cada ronda",
                    "de forma permanente",
                },
            },
        },
    },
    misc={
        achievement_descriptions={
            -- Replaced non-breaking space by regular space (font does not render them)
            _100000k="Consigue 100 000 000 de fichas en una sola mano",
            _1000k="Consigue 1 000 000 de fichas en una sola mano",
            _10k="Consigue 10 000 fichas en una sola mano",
            completionist="Descubre 100 % de tu colección",

            -- Consistency: Pegatina
            completionist_plus_plus="Gana una pegatina de oro en cada comodín",
            -- Consistency: $
            nest_egg="Consigue 400 $ o más en una sola partida",
            -- Mistake: para -> antes de superar
            roi="Compra 5 vales antes de superar la apuesta inicial 4",
        },
        achievement_names={
            -- Replaced non-breaking space by regular space (font does not render them)
            _100000k="100 000 K",
            -- Mistake: Missing space
            _10k="10 K",
            -- Mistake: Aumentador -> Gran aumento
            ante_upper="¡Gran aumento de apuesta inicial!",
            -- Reworded
            tiny_hands="Reduce tu baraja a 20 cartas o menos",
        },
        dictionary={
            -- Mod config
            better_esp_use_malverk="Usar Malverk",

            -- Mistake: "de baraja" -> "con barajas"
            k_deck_stake_wins="Victorias de pozo con barajas",

            -- Mistake: "Round score" are two different lines, where "Round" is regular k_round.
            -- A Lovely patch to replace k_round with k_upper_round so it can be translated separately 
            k_upper_round="Puntuación",
            k_lower_score="de ronda",

            -- Lovely patch: Custom thousands separator
            thousands_sep="··",

            -- Mistake: Accent
            b_set_video="Vídeo",
            -- Mistake: Wording
            b_wishlist="Añade a tu lista de deseados en Steam",
            -- Consistency: Pegatina
            k_joker_stickers="Pegatinas de comodín",
            -- Consistency: Renovar
            k_reroll="Renovar",
            -- Mistake: The X here is after a number
            k_x_base="X Base",
            -- Consistency: Pegatina
            ph_display_stickers="Mostrar pegatinas de pozo durante la partida",
            -- Mistake: Untranslated
            -- TODO: Doesn't seem to be used in The Ox for the collection
            ph_most_played="(mano más jugada)",
            -- Consistency: $
            remaining_discard_money="Descartes restantes (#1# $ cada uno)",
            -- Consistency: $
            remaining_hand_money="Manos restantes (#1# $ cada una)",

            -- Mistake: Aumentar -> Aumenta
            ph_up_ante_1="Aumenta apuesta inicial",
            ph_up_ante_2="Aumenta todas las ciegas",
            ph_up_ante_3="Actualiza las ciegas",
        },
        poker_hands={
            -- Consistency: Poker
            ["Flush Five"]="Repóker de color",
            -- Consistency: Poker
            ["Five of a Kind"]="Repóker",
        },
        v_text={
            -- Consistency: $
            ch_c_discard_cost={
                "Cada descarte cuesta {C:money}#1#····${}",
            },
            -- Consistency: $
            ch_c_inflation={
                "Eleva los precios en {C:money}1····${} para cada compra de forma permanente",
            },
            -- Consistency: $
            ch_c_minus_hand_size_per_X_dollar={
                "Tienes {C:red}-1{} cartas en la mano por cada {C:money}#1#····${} que tengas",
            },
            -- Consistency: $
            ch_m_dollars={
                "Empieza con {C:money}#1#····$",
            },
        },
    },
}