return {
	["misc"] = {
		["dictionary"] = {
			["k_exoplanet"] = "Exoplaneta",
			["k_glass"] = "¡Cristal!",
		},
		["suits_plural"] = {
			["six_Moons"] = "Lunas",
			["six_Stars"] = "Estrellas",
		},
		["poker_hands"] = {
			["six_Spectrum House"] = "Full Espectro",
			["six_Straight Spectrum"] = "Escalera Espectro",
			["six_Spectrum"] = "Espectro",
			["six_Straight Spectrum_2"] = "Espectro Real",
			["six_Spectrum Five"] = "Repóker Espectro",
		},
		["poker_hand_descriptions"] = {
			["six_Spectrum Five"] = {
				"5 cartas del mismo valor,",
				"cada una de un palo diferente",
			},
			["six_Spectrum"] = {
				"5 cartas de palos diferentes",
			},
			["six_Straight Spectrum"] = {
				"5 cartas consecutivas con",
				"cada carta de un palo diferente",
			},
			["six_Spectrum House"] = {
				"Un Trío y una Pareja con",
				"cada carta de un palo diferente",
			},
		},
		["suits_singular"] = {
			["six_Moons"] = "Luna",
			["six_Stars"] = "Estrella",
		},
	},
	["descriptions"] = {
		["Blind"] = {
			["bl_six_void"] = {
				["name"] = "El Vacío",
				["text"] = {
					"Todas las cartas de Luna",
					"quedan debilitadas",
				},
			},
			["bl_six_eclipse"] = {
				["name"] = "El Eclipse",
				["text"] = {
					"Todas las cartas de Estrella",
					"quedan debilitadas",
				},
			},
		},
		["Back"] = {
			['b_six_night'] = {
				["name"] = "Baraja Nocturna",
				["text"] = {
					"Empieza la partida solo con cartas",
					"de {C:six_moons,E:1,S:1.1}Lunas{} y {C:six_stars,E:1,S:1.1}Estrellas{}.",
				},
			},
			['b_six_colourful'] = {
				["name"] = "Baraja Colorida",
				["text"] = {
					"{X:mult,C:white} X#1# {} Mult si la mano jugada", 
					"contiene un {C:attention}Espectro{}",
					"{C:green,E:1}#3# de #4#{} de probabilidad de cambiar",
					"el palo de cada carta de",
					"{C:six_moons}Luna{} o {C:six_stars}Estrella{} jugada",
					"y ganar {X:mult,C:white} X#2# {} Mult"
				},
			},
		},
		["Sleeve"] = {
			["sleeve_six_colourful"] = {
				["name"] = "Funda Colorida",
				["text"] = {
					"{X:mult,C:white} X#1# {} Mult si la mano jugada", 
					"contiene un {C:attention}Espectro{}",
					"{C:green,E:1}#3# de #4#{} de probabilidad de cambiar",
					"el palo de cada carta de",
					"{C:six_moons}Luna{} o {C:six_stars}Estrella{} jugada",
					"y ganar {X:mult,C:white} X#2# {} Mult"
				},
				["unlock"] = {
					"Gana una partida tras jugar",
					"un {C:attention}Espectro{} al menos",
					"{C:attention}#1# veces{} en una partida"
				}
			},
			["sleeve_six_colourful_alt"] = {
				["name"] = "Funda Colorida Alt",
				["text"] = {
					"{C:attention}Reactiva{} todas las cartas jugadas",
					"si la mano jugada",
					"contiene un {C:attention}Espectro"
				}
			}
		},
		["Tarot"] = {
			["c_six_star_q"] = {
				["name"] = "¿La Estrella?",
				["text"] = {
					"Convierte hasta",
					"{C:attention}#1#{} cartas seleccionadas",
					"en {V:1}#2#{}",
				},
			},
			["c_six_moon_q"] = {
				["name"] = "¿La Luna?",
				["text"] = {
					"Convierte hasta",
					"{C:attention}#1#{} cartas seleccionadas",
					"en {V:1}#2#{}",
				},
			},
		},
		["Planet"] = {
			["c_six_gj_273_c"] = {
				["name"] = "GJ 273 c",
				["text"] = {
					"{S:0.8}({S:0.8,V:1}Niv.#1#{S:0.8}){} Mejora",
					"{C:attention}#2#",
					"{C:mult}+#3#{} Mult y",
					"{C:chips}+#4#{} Fichas",
				},
			},
			["c_six_trappist"] = {
				["name"] = "Trappist",
				["text"] = {
					"{S:0.8}({S:0.8,V:1}Niv.#1#{S:0.8}){} Mejora",
					"{C:attention}#2#",
					"{C:mult}+#3#{} Mult y",
					"{C:chips}+#4#{} Fichas",
				},
			},
			["c_six_proxima"] = {
				["name"] = "Próxima",
				["text"] = {
					"{S:0.8}({S:0.8,V:1}Niv.#1#{S:0.8}){} Mejora",
					"{C:attention}#2#",
					"{C:mult}+#3#{} Mult y",
					"{C:chips}+#4#{} Fichas",
				},
			},
			["c_six_kepler"] = {
				["name"] = "Kepler",
				["text"] = {
					"{S:0.8}({S:0.8,V:1}Niv.#1#{S:0.8}){} Mejora",
					"{C:attention}#2#",
					"{C:mult}+#3#{} Mult y",
					"{C:chips}+#4#{} Fichas",
				},
			},
		},
		["Joker"] = {
			["j_six_moonstone"] = {
				["name"] = "Piedra Lunar Arcoíris",
				["text"] = {
					"{C:green}#1# de #2#{} de probabilidad de que",
					"las cartas jugadas de palo {C:six_moons}Luna{}",
					"se conviertan en cartas de {C:attention}Cristal{}",
				},
			},
			["j_six_clan"] = {
				["name"] = "El Clan",
				["text"] = {
					"{X:mult,C:white} X#1# {} Mult si la mano",
					"jugada contiene",
					"un {C:attention}#2#",
				},
			},
			["j_six_star_ruby"] = {
				["name"] = "Rubí Estrella",
				["text"] = {
					"{C:green}#1# de #2#{} de probabilidad de que",
					"las cartas jugadas de palo {C:six_stars}Estrella{}",
					"creen una carta {C:spectral}Espectral{} aleatoria",
					"al puntuar",
				},
			},
			["j_six_slothful_joker"] = {
				["name"] = "Comodín Perezoso",
				["text"] = {
					"Las cartas jugadas de palo",
					"{C:six_moons}#2#{} otorgan",
					"{C:mult}+#1#{} Mult al puntuar",
				},
			},
			["j_six_manic_joker"] = {
				["name"] = "Comodín Maníaco",
				["text"] = {
					"{C:red}+#1#{} Mult si la mano",
					"jugada contiene",
					"un {C:attention}#2#",
				},
			},
			["j_six_wicked_joker"] = {
				["name"] = "Comodín Malvado",
				["text"] = {
					"{C:chips}+#1#{} Fichas si la mano",
					"jugada contiene",
					"un {C:attention}#2#",
				},
			},
			["j_six_envious_joker"] = {
				["name"] = "Comodín Envidioso",
				["text"] = {
					"Las cartas jugadas de palo",
					"{C:stars}#2#{} otorgan",
					"{C:mult}+#1#{} Mult al puntuar",
				},
			},
		},
		["Spectral"] = {
			["c_six_fool_q"] = {
				["name"] = "¿El Loco?",
				["text"] = {
					"Crea la última carta",
					"{C:spectral}Espectral{} usada",
					"en esta partida",
					"{s:0.8,C:spectral}¿El Loco?{s:0.8} excluido",
				},
			},
		},
		["Mod"] = {
			["SixSuits"] = {
				["name"] = "Six Suits",
				["text"] = {
					"Este mod añade la mano {E:1,C:dark_edition}Espectro{},",
					"diseñada para dos palos nuevos: {C:six_stars,T:c_six_star_q}Estrellas{} y {C:six_moons,T:c_six_moon_q}Lunas{}.",
					"Arte por {E:1,C:attention}Crimson Heart{} y {E:1,C:attention}PeachFroggg{}."
				}
			}
		}
	},
}
