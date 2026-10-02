--- STEAMODDED HEADER
--- MOD_NAME: BetterSpanishLocale
--- MOD_ID: BetterSpanishLocale
--- MOD_AUTHOR: [CuboManco]
--- MOD_DESCRIPTION: Fixes several mistakes and inconsistencies with the Spanish translations

--- PRIORITY: 0
--- DISPLAY_NAME: Better Spanish Locale
--- PREFIX: better_esp
--- VERSION: 1.0
----------------------------------------------
------------MOD CODE -------------------------

sendDebugMessage("Launching BetterSpanishLocale", "BetterSpanishLocale")

if SMODS then
    SMODS.Atlas({
        key = "modicon",
        path = "icon.png",
        px = 32,
        py = 32,
    })

    -- Shop sign (does not have Malverk support)
    SMODS.Atlas({
        key = "shop_sign",
        raw_key = true,
        path = {
            ["default"] = "ShopSignAnimation.png",
            ["es_ES"]   = "ShopSignAnimation_ES.png",
            ["es_419"]  = "ShopSignAnimation_ES.png",
        },
        px = 113,
        py = 57,
        atlas_table = "ANIMATION_ATLAS",
        frames = 4,
    })
end

-- Check if Malverk is loaded
if not AltTexture or not TexturePack then
    sendWarnMessage("Malverk not detected. Textures will not be replaced", "BetterSpanishLocale")
else
    -- Jokers (ES)
    AltTexture({
        key = "better_esp_joker_ES",
        set = "Joker",
        path = "Jokers_ES.png",
        keys = {
            "j_todo_list", -- Cover image
            "j_loyalty_card",
            "j_ride_the_bus",
            "j_hanging_chad",
            "j_drivers_license",
            "j_certificate",
            "j_gift",
            "j_reserved_parking",
        },
        original_sheet = true,
    })

    -- Jokers (MX)
    AltTexture({
        key = "better_esp_joker_MX",
        set = "Joker",
        path = "Jokers_MX.png",
        keys = {
            "j_hanging_chad", -- Cover image
            "j_loyalty_card",
            "j_ride_the_bus",
            "j_drivers_license",
            "j_certificate",
            "j_todo_list",
            "j_gift",
            "j_reserved_parking",
        },
        original_sheet = true,
    })

    -- Tarot cards
    AltTexture({
        key = "better_esp_tarot",
        set = "Tarot",
        path = "Tarots.png",
        original_sheet = true,
    })

    -- Planet cards
    AltTexture({
        key = "better_esp_planet",
        set = "Planet",
        path = "Tarots.png",
        original_sheet = true,
    })

    -- Spectral cards
    AltTexture({
        key = "better_esp_spectral",
        set = "Spectral",
        path = "Tarots.png",
        original_sheet = true,
    })

    -- Blinds
    AltTexture({
        key = "better_esp_blind",
        set = "Blind",
        textures = {
            "bl_big",
            "bl_small",
        },
        path = "BlindChips.png",
        original_sheet = true,
        frames = 21,
    })

    -- Vouchers
    AltTexture({
        key = "better_esp_voucher",
        set = "Voucher",
        path = "Vouchers.png",
        original_sheet = true,
    })

    -- Package setup (ES)
    TexturePack({
        key = "better_esp_pack_ES",
        textures = {
            "better_esp_joker_ES",
            "better_esp_tarot",
            "better_esp_planet",
            "better_esp_spectral",
            "better_esp_blind",
            "better_esp_voucher",
        },
        loc_txt = {
            name = "Better Spanish Locale (España)",
            text = {
                "Texturas de cartas, tienda y",
                "comodines traducidos al español"
            }
        }
    })

    -- Package setup (MX)
    TexturePack({
        key = "better_esp_pack_MX",
        textures = {
            "better_esp_joker_MX",
            "better_esp_tarot",
            "better_esp_planet",
            "better_esp_spectral",
            "better_esp_blind",
            "better_esp_voucher",
        },
        loc_txt = {
            name = "Better Spanish Locale (Latino)",
            text = {
                "Texturas de cartas, tienda y",
                "comodines en español neutro"
            }
        }
    })
end

sendDebugMessage("BetterSpanishLocale launched", "BetterSpanishLocale")

----------------------------------------------
------------MOD CODE END----------------------
