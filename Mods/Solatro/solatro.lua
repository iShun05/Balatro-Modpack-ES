--SOLATRO - a fully functioning game of Klondike Solitaire played with Balatro's
--playing cards, card areas and UI. The main menu PLAY button launches Solitaire
--instead of a run. This file is self contained: it only wraps existing functions
--and never changes behaviour outside of the Solitaire state.

--Steamodded executes main_file and the Lovely patch requires this module, so
--both loaders may run this file in the same session; only load once
if G.STATES.SOLATRO then return end

G.STATES.SOLATRO = 900

--All layout/tuning numbers in one place (units are room tiles, same as G.CARD_W/H)
local S_CONF = {
    gap = 0.5,           --horizontal space between the 7 columns
    top_y = 0.4,         --y of the stock/waste/foundation row
    tab_gap = 0.5,       --space between top row and tableau row
    off_up = 0.55,       --fan offset for face up tableau cards
    off_down = 0.3,      --fan offset for face down tableau cards
    drop_margin = 0.3,   --extra grab area around piles for drag + drop
    select_off = 0.25,   --how far a picked up (selected) card slides out of its pile
}

local function solatro_active()
    return G.SOLATRO and G.STATE == G.STATES.SOLATRO
end

--Klondike rank: Ace low (Card.base.id has Ace = 14)
local function s_rank(card)
    return card.base.id == 14 and 1 or card.base.id
end

local function s_is_red(card)
    return card.base.suit == 'Hearts' or card.base.suit == 'Diamonds'
end

local function pile_top(pile)
    return pile.cards[#pile.cards]
end

--Can `card` (with any cards stacked on it) be placed on tableau pile `pile`
local function can_place_tableau(card, pile)
    local top = pile_top(pile)
    if not top then
        return s_rank(card) == 13
    end
    return top.facing == 'front' and
        s_rank(card) == s_rank(top) - 1 and
        s_is_red(card) ~= s_is_red(top)
end

--Can single `card` be placed on foundation pile `pile`
local function can_place_foundation(card, pile)
    local top = pile_top(pile)
    if not top then
        return s_rank(card) == 1
    end
    return card.base.suit == top.base.suit and s_rank(card) == s_rank(top) + 1
end

--The group of cards that would move together if `card` is picked up,
--or nil if the card cannot be moved at all
local function movable_stack(card)
    local area = card.area
    if not (area and area.config and area.config.solatro) then return nil end
    local kind = area.config.solatro
    if kind == 'waste' or kind == 'foundation' then
        if pile_top(area) == card then return {card} end
        return nil
    end
    if kind == 'tableau' then
        if card.facing ~= 'front' then return nil end
        local idx = nil
        for i, c in ipairs(area.cards) do
            if c == card then idx = i; break end
        end
        if not idx then return nil end
        local stack = {}
        for i = idx, #area.cards do
            if area.cards[i].facing ~= 'front' then return nil end
            stack[#stack+1] = area.cards[i]
        end
        return stack
    end
    return nil
end

local function invalid_feedback(card)
    if card then card:juice_up(0.12, 0.12) end
    play_sound('cancel', 1, 0.5)
end

--------------------------------------------------------------------
--Pick-then-place selection: click a card/run to pick it up, click a
--destination pile to set it down. Selected cards slide out of their pile
--(see align_cards) until placed, deselected or dragged.
--------------------------------------------------------------------

local function clear_selection()
    local sel = G.SOLATRO and G.SOLATRO.selected
    if not sel then return end
    G.SOLATRO.selected = nil
    for _, c in ipairs(sel) do c.solatro_selected = nil end
end

local function select_stack(stack)
    clear_selection()
    G.SOLATRO.selected = stack
    for _, c in ipairs(stack) do c.solatro_selected = true end
    stack[1]:juice_up(0.08, 0.08)
    play_sound('cardSlide1', nil, 0.5)
end

--The current selection revalidated against the board (cards may have been
--dragged elsewhere since they were picked); nil if it no longer holds up
local function selection_stack()
    local sel = G.SOLATRO.selected
    if not sel or not sel[1] or sel[1].REMOVED then return nil end
    local stack = movable_stack(sel[1])
    if stack and #stack == #sel and stack[1] == sel[1] then return stack end
    return nil
end

local function snap_pile_home(pile)
    if not pile then return end
    pile:align_cards()
    for _, c in ipairs(pile.cards) do
        c.solatro_follower = nil
        c.solatro_run = nil
        c:hard_set_T()
    end
end

local function solatro_draggable(card)
    local area = card.area
    if not (area and area.config and area.config.solatro) then return false end
    local kind = area.config.solatro
    if kind == 'stock' then return false end
    if kind == 'tableau' then return card.facing == 'front' end
    return pile_top(area) == card
end

local function count_move()
    G.SOLATRO.moves = G.SOLATRO.moves + 1
    G.SOLATRO.ui.moves = tostring(G.SOLATRO.moves)
end

local function solatro_win()
    clear_selection()
    G.SOLATRO.won = true
    play_sound('polychrome1', 1, 0.7)
    play_sound('gong', 0.94, 0.4)
    ease_background_colour{new_colour = G.C.GOLD, special_colour = G.C.RED, contrast = 3}
    attention_text({
        scale = 1.6, text = 'YOU WIN!', hold = 20, align = 'cm',
        offset = {x = 0, y = -1.2},
        major = G.ROOM_ATTACH,
    })
    --the classic solitaire victory cascade: cards launch off the foundations one
    --by one and bounce across the table (see solatro_update_cascade)
    G.SOLATRO.cascade = {
        flying = {},
        next_launch = G.TIMERS.REAL + 0.9,
        foundation_i = 0,
    }
end

--Per frame physics for the victory cascade
local function solatro_update_cascade(dt)
    local cas = G.SOLATRO.cascade
    if not cas then return end
    local t = G.TIMERS.REAL

    --launch the next card off a foundation
    if t >= cas.next_launch then
        local launched = nil
        for i = 1, 4 do
            cas.foundation_i = (cas.foundation_i % 4) + 1
            local f = G.SOLATRO.foundations[cas.foundation_i]
            local c = pile_top(f)
            if c then
                f:remove_card(c)
                c.states.collide.can = false
                c.states.hover.can = false
                c.states.click.can = false
                c.states.drag.can = false
                c.solatro_cascade = {
                    vx = (math.random() < 0.5 and -1 or 1)*(2.5 + math.random()*5),
                    vy = -(1 + math.random()*5),
                }
                c.solatro_cascade.trail = Particles(0, 0, 0, 0, {
                    timer = 0.025, scale = 0.3, initialize = false, lifespan = 0.6,
                    speed = 0.1, padding = -0.5, attach = c, fill = true,
                    colours = {G.C.WHITE, G.C.GOLD, G.C.SUITS[c.base.suit] or G.C.RED},
                })
                cas.flying[#cas.flying+1] = c
                play_sound('cardFan2', 0.9 + math.random()*0.2, 0.35)
                launched = true
                break
            end
        end
        cas.next_launch = t + (launched and 0.22 or 999999)
    end

    --bounce the airborne cards along the bottom of the room
    local grav = 22
    local floor_y = G.TILE_H - G.CARD_H
    for i = #cas.flying, 1, -1 do
        local c = cas.flying[i]
        local p = c.solatro_cascade
        c.T.x = c.T.x + p.vx*dt
        c.T.y = c.T.y + p.vy*dt
        p.vy = p.vy + grav*dt
        if c.T.y > floor_y and p.vy > 0 then
            c.T.y = floor_y
            p.vy = -p.vy*0.82
            if math.abs(p.vy) > 3 then play_sound('card1', 0.8 + math.random()*0.4, 0.25) end
        end
        c.VT.x, c.VT.y = c.T.x, c.T.y
        if c.T.x < -3 or c.T.x > G.TILE_W + 3 then
            if p.trail and not p.trail.REMOVED then p.trail:remove() end
            c.solatro_cascade = nil
            c.states.visible = false
            table.remove(cas.flying, i)
        end
    end
end

local function check_win()
    if G.SOLATRO.won then return end
    for _, f in ipairs(G.SOLATRO.foundations) do
        if #f.cards < 13 then return end
    end
    solatro_win()
end

--Move a stack of cards to a target pile (already validated)
local function do_move(stack, target)
    local source = stack[1].area
    for _, c in ipairs(stack) do
        c.solatro_run = nil
        c.solatro_follower = nil
        source:remove_card(c)
        target:emplace(c, nil, true)
    end
    --reveal the newly exposed tableau card
    local newtop = pile_top(source)
    if source.config.solatro == 'tableau' and newtop and newtop.facing == 'back' then
        newtop:flip()
        play_sound('card1', 1.1, 0.6)
    end
    if target.config.solatro == 'foundation' then
        play_sound('gold_seal', 1.1, 0.8)
        stack[1]:juice_up(0.3, 0.2)
    else
        play_sound('cardSlide1', nil, 0.7)
    end
    count_move()
    source:align_cards()
    check_win()
end

--Try to place `stack` on `pile`, returns true on success
local function try_move(stack, pile)
    if pile.config.solatro == 'foundation' then
        if #stack == 1 and can_place_foundation(stack[1], pile) then
            do_move(stack, pile)
            return true
        end
    elseif pile.config.solatro == 'tableau' then
        if can_place_tableau(stack[1], pile) then
            do_move(stack, pile)
            return true
        end
    end
    return false
end

--Draw from the stock to the waste, or recycle the waste when the stock is empty
G.FUNCS.solatro_stock_click = function()
    if not solatro_active() or G.SOLATRO.dealing or G.SOLATRO.won then return end
    clear_selection()
    local stock, waste = G.SOLATRO.stock, G.SOLATRO.waste
    if #stock.cards > 0 then
        local c = pile_top(stock)
        stock:remove_card(c)
        waste:emplace(c, nil, true)
        if c.facing == 'back' then c:flip() end
        play_sound('card1', nil, 0.6)
        count_move()
    elseif #waste.cards > 0 then
        --flip the whole waste back over into the stock
        while #waste.cards > 0 do
            local c = pile_top(waste)
            waste:remove_card(c)
            if c.facing == 'front' then c:flip() end
            stock:emplace(c, nil, true)
        end
        play_sound('cardFan2', nil, 0.7)
        count_move()
    end
    stock:align_cards()
    waste:align_cards()
end

--Click on a card. First click picks up a card/run, a second click on a
--destination pile places it there if legal. Clicking the same card again puts
--it back down - unless it can go to a foundation, in which case the double
--click sends it there. Foundation moves are the ONLY automatic moves; every
--tableau move must be dragged or picked up and placed by hand.
G.FUNCS.solatro_card_click = function(card)
    if not solatro_active() or G.SOLATRO.dealing or G.SOLATRO.won then return end
    local area = card.area
    if not (area and area.config and area.config.solatro) then return end
    if area.config.solatro == 'stock' then
        G.FUNCS.solatro_stock_click()
        return
    end
    --a successful drag-drop can also register as a click; ignore the echo
    if card.solatro_dropped_at and G.TIMERS.REAL - card.solatro_dropped_at < 0.25 then return end

    if G.SOLATRO.selected then
        if card.solatro_selected then
            --second click on the card we picked up
            local stack = selection_stack()
            clear_selection()
            if stack and #stack == 1 and stack[1] == card and area.config.solatro ~= 'foundation' then
                --double click: send it to its foundation if it fits
                for _, f in ipairs(G.SOLATRO.foundations) do
                    if can_place_foundation(card, f) then
                        do_move(stack, f)
                        return
                    end
                end
            end
            play_sound('cardSlide2', nil, 0.3) --just set it back down
            return
        end
        --clicked somewhere else: try to place the selection on that pile
        local stack = selection_stack()
        clear_selection()
        if stack and try_move(stack, area) then return end
        --invalid drop target; if they clicked another movable card, pick
        --that one up instead (classic click-to-move solitaire behaviour)
        local switch = movable_stack(card)
        if switch then
            select_stack(switch)
        else
            invalid_feedback(card)
        end
        return
    end

    local stack = movable_stack(card)
    if not stack then
        if card.facing == 'front' then invalid_feedback(card) end
        return
    end
    select_stack(stack)
end

--Rectangle overlap helper for drop targeting
local function overlap_amt(card, pile)
    local m = S_CONF.drop_margin
    local px, py = pile.T.x - m, pile.T.y - m
    local pw, ph = pile.T.w + 2*m, pile.T.h + 2*m
    local ox = math.min(card.T.x + card.T.w, px + pw) - math.max(card.T.x, px)
    local oy = math.min(card.T.y + card.T.h, py + ph) - math.max(card.T.y, py)
    if ox <= 0 or oy <= 0 then return 0 end
    return ox*oy
end

--Called when a solatro card stops being dragged: find the pile under it and try the move
G.FUNCS.solatro_drop = function(card)
    if not solatro_active() then return end
    clear_selection() --dragging supersedes any picked up card
    local area = card.area
    if not (area and area.config and area.config.solatro) then return end
    if area.config.solatro == 'stock' then return end
    if G.SOLATRO.dealing or G.SOLATRO.won then
        snap_pile_home(area)
        return
    end

    local stack = movable_stack(card)
    local moved = false
    if stack then
        local candidates = {}
        for _, f in ipairs(G.SOLATRO.foundations) do candidates[#candidates+1] = f end
        for _, t in ipairs(G.SOLATRO.tableaus) do candidates[#candidates+1] = t end

        local best, best_ov = nil, 0.25*card.T.w*card.T.h
        for _, pile in ipairs(candidates) do
            if pile ~= area then
                local ov = overlap_amt(card, pile)
                if ov > best_ov then best, best_ov = pile, ov end
            end
        end

        if best and try_move(stack, best) then
            moved = true
            card.solatro_dropped_at = G.TIMERS.REAL
        elseif best then
            invalid_feedback(nil)
        end
    end

    if not moved then snap_pile_home(area) end
end

--------------------------------------------------------------------
--Stage setup: build the table and deal a fresh game
--------------------------------------------------------------------

local function solatro_slot_label(kind)
    return (kind == 'foundation' and 'A') or (kind == 'tableau' and 'K') or (kind == 'stock' and 'DRAW') or nil
end

local function make_pile(x, y, w, h, kind)
    local pile = CardArea(x, y, w, h, {card_limit = 52, type = 'solatro', solatro = kind, highlight_limit = 0})
    --piles take clicks themselves so a picked up card can be placed on an
    --empty column/foundation; cards draw over the pile and win the collision
    if kind == 'stock' or kind == 'tableau' or kind == 'foundation' then
        pile.states.collide.can = true
        pile.states.hover.can = true
        pile.states.click.can = true
    end
    return pile
end

function Game:solatro()
    self:prep_stage(G.STAGES.MAIN_MENU, G.STATES.SOLATRO, true)
    self.GAME.selected_back = Back(G.P_CENTERS.b_red)

    --deep felt green table
    ease_background_colour{new_colour = HEX('35a06c'), special_colour = HEX('356148'), tertiary_colour = HEX('1e3a2c'), contrast = 1}

    if G.SPLASH_FRONT then G.SPLASH_FRONT:remove(); G.SPLASH_FRONT = nil end
    if G.SPLASH_BACK then G.SPLASH_BACK:remove(); G.SPLASH_BACK = nil end
    G.SPLASH_BACK = Sprite(-30, -6, G.ROOM.T.w+60, G.ROOM.T.h+12, G.ASSET_ATLAS["ui_1"], {x = 2, y = 0})
    G.SPLASH_BACK:set_alignment({
        major = G.ROOM_ATTACH,
        type = 'cm',
        offset = {x=0,y=0}
    })
    G.ARGS.solatro_spin = G.ARGS.solatro_spin or {amount = 0}
    G.SPLASH_BACK:define_draw_steps({{
        shader = 'background',
        send = {
            {name = 'time', ref_table = G.TIMERS, ref_value = 'REAL_SHADER'},
            {name = 'spin_time', ref_table = G.TIMERS, ref_value = 'BACKGROUND'},
            {name = 'colour_1', ref_table = G.C.BACKGROUND, ref_value = 'C'},
            {name = 'colour_2', ref_table = G.C.BACKGROUND, ref_value = 'L'},
            {name = 'colour_3', ref_table = G.C.BACKGROUND, ref_value = 'D'},
            {name = 'contrast', ref_table = G.C.BACKGROUND, ref_value = 'contrast'},
            {name = 'spin_amount', ref_table = G.ARGS.solatro_spin, ref_value = 'amount'}
        }}})

    local CW, CH = G.CARD_W, G.CARD_H
    local step = CW + S_CONF.gap
    local left = (G.TILE_W - (7*CW + 6*S_CONF.gap))/2
    local top_y = S_CONF.top_y
    local tab_y = top_y + CH + S_CONF.tab_gap
    local tab_h = G.TILE_H - tab_y - 1.0 --keep clear of the HUD strip along the bottom
    local col_x = {}
    for i = 1, 7 do col_x[i] = left + (i-1)*step end

    G.SOLATRO = {
        moves = 0,
        won = false,
        dealing = true,
        start_time = G.TIMERS.REAL,
        ui = {moves = '0', time = '00:00'},
        foundations = {},
        tableaus = {},
    }

    G.SOLATRO.stock = make_pile(col_x[1], top_y, CW, CH, 'stock')
    G.SOLATRO.waste = make_pile(col_x[2], top_y, CW, CH, 'waste')
    for i = 1, 4 do
        G.SOLATRO.foundations[i] = make_pile(col_x[i+3], top_y, CW, CH, 'foundation')
    end
    for i = 1, 7 do
        G.SOLATRO.tableaus[i] = make_pile(col_x[i], tab_y, CW, tab_h, 'tableau')
    end

    --build and shuffle a standard 52 card deck out of the game's own playing cards
    local keys = {}
    for k, _ in pairs(G.P_CARDS) do keys[#keys+1] = k end
    table.sort(keys) --pairs() order is undefined; sort before shuffling for a fair mix
    for i = #keys, 2, -1 do
        local j = math.random(i)
        keys[i], keys[j] = keys[j], keys[i]
    end

    local stock = G.SOLATRO.stock
    for _, k in ipairs(keys) do
        local card = Card(stock.T.x, stock.T.y, CW, CH, G.P_CARDS[k], G.P_CENTERS.c_base)
        card.facing = 'back'
        card.sprite_facing = 'back'
        card.ambient_tilt = 0.05
        card.no_ui = true --suppress the '+chips' hover tooltip, it means nothing here
        stock:emplace(card, nil, true)
    end
    stock:align_cards()
    stock:hard_set_cards()

    --deal 1..7 cards to the tableau columns, last one face up, with a little cascade
    local deal_i = 0
    for col = 1, 7 do
        for row = 1, col do
            deal_i = deal_i + 1
            local pile = G.SOLATRO.tableaus[col]
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1 + deal_i*0.045,
                blockable = false,
                blocking = false,
                func = function()
                    local c = pile_top(G.SOLATRO.stock)
                    if c then
                        G.SOLATRO.stock:remove_card(c)
                        pile:emplace(c, nil, true)
                        if row == col and c.facing == 'back' then c:flip() end
                        play_sound('card1', 0.85 + deal_i*0.007, 0.35)
                    end
                    return true
                end
            }))
        end
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2 + (deal_i+1)*0.045,
        blockable = false,
        blocking = false,
        func = function()
            G.SOLATRO.dealing = false
            G.SOLATRO.start_time = G.TIMERS.REAL
            return true
        end
    }))

    --HUD strip in the bottom left corner
    G.SOLATRO.hud = UIBox{
        definition =
        {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR}, nodes={
            {n=G.UIT.R, config={align = 'cm', padding = 0.09, r = 0.1, emboss = 0.05, colour = G.C.L_BLACK}, nodes={
                {n=G.UIT.C, config={align = 'cm', padding = 0.03}, nodes={
                    {n=G.UIT.T, config={text = 'SOLATRO', scale = 0.42, colour = G.C.GOLD, shadow = true}},
                }},
                {n=G.UIT.C, config={align = 'cm', minw = 0.3}, nodes={}},
                {n=G.UIT.C, config={align = 'cm'}, nodes={
                    {n=G.UIT.T, config={text = 'Moves: ', scale = 0.3, colour = G.C.UI.TEXT_LIGHT}},
                    {n=G.UIT.T, config={ref_table = G.SOLATRO.ui, ref_value = 'moves', scale = 0.3, colour = G.C.WHITE, shadow = true}},
                    {n=G.UIT.T, config={text = '   ', scale = 0.3, colour = G.C.UI.TEXT_LIGHT}},
                    {n=G.UIT.T, config={ref_table = G.SOLATRO.ui, ref_value = 'time', scale = 0.3, colour = G.C.WHITE, shadow = true}},
                }},
                {n=G.UIT.C, config={align = 'cm', minw = 0.3}, nodes={}},
                UIBox_button{col = true, button = 'solatro_new_deal', label = {'NEW DEAL'}, colour = G.C.ORANGE, minw = 1.5, minh = 0.55, scale = 0.28},
                {n=G.UIT.C, config={align = 'cm', minw = 0.12}, nodes={}},
                UIBox_button{col = true, button = 'go_to_menu', label = {'MENU'}, colour = G.C.RED, minw = 0.95, minh = 0.55, scale = 0.28},
            }},
        }},
        config = {align = 'bli', offset = {x = 0.15, y = -0.12}, major = G.ROOM_ATTACH, bond = 'Weak'}
    }

    G.E_MANAGER:add_event(Event({func = function() G.CONTROLLER.lock_input = false; return true end}))
end

--------------------------------------------------------------------
--Menu button + state transitions
--------------------------------------------------------------------

local function solatro_transition(and_then)
    G.SETTINGS.paused = true
    G.E_MANAGER:clear_queue()
    G.FUNCS.wipe_on()
    G.E_MANAGER:add_event(Event({
        no_delete = true,
        func = function()
            G:delete_run()
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        no_delete = true,
        blockable = true,
        blocking = false,
        func = function()
            and_then()
            return true
        end
    }))
    G.FUNCS.wipe_off()
end

G.FUNCS.solatro_start = function(e)
    solatro_transition(function() G:solatro() end)
end

G.FUNCS.solatro_new_deal = function(e)
    solatro_transition(function() G:solatro() end)
end

local ref_create_UIBox_main_menu_buttons = create_UIBox_main_menu_buttons
function create_UIBox_main_menu_buttons()
    local t = ref_create_UIBox_main_menu_buttons()
    --the first column of the root row holds the PLAY/OPTIONS/COLLECTION button row
    local button_col = t.nodes[1] and t.nodes[1].nodes
    local button_row = button_col and button_col[1] and button_col[1].nodes
    if button_row and button_row[1] then
        --keep the vanilla 'main_menu_play' id so the controller cursor still snaps to it
        button_row[1] = UIBox_button{
            id = 'main_menu_play', button = 'solatro_start', colour = G.C.GOLD,
            minw = 3.65, minh = 1.55, label = {'PLAY'}, scale = 0.45*2, col = true,
        }
        --mod credit line under the menu buttons
        button_col[#button_col+1] = {n=G.UIT.R, config={align = 'cm', padding = 0.08}, nodes={
            {n=G.UIT.T, config={text = 'solatro mod by bryanthaboi / bois club games',
                scale = 0.3, colour = G.C.UI.TEXT_LIGHT, shadow = true}},
        }}
    end
    return t
end

--------------------------------------------------------------------
--CardArea behaviour for solitaire piles
--------------------------------------------------------------------

local ref_cardarea_align = CardArea.align_cards
function CardArea:align_cards()
    if not (self.config and self.config.solatro) then return ref_cardarea_align(self) end
    local kind = self.config.solatro
    if kind == 'tableau' then
        --fan the pile downwards; compress the fan when the pile gets tall
        local down, up = S_CONF.off_down, S_CONF.off_up
        local total = 0
        for k, card in ipairs(self.cards) do
            if k > 1 then total = total + (self.cards[k-1].facing == 'back' and down or up) end
        end
        local avail = self.T.h - G.CARD_H
        local squish = (total > avail and total > 0) and avail/total or 1
        local y = self.T.y
        local drag_card, drag_y = nil, 0
        for k, card in ipairs(self.cards) do
            if card.states.drag.is then
                drag_card, drag_y = card, y
                card.solatro_follower = nil
            elseif drag_card then
                --cards stacked on a dragged card trail along with it
                card.solatro_follower = true
                card.T.x = drag_card.T.x
                card.T.y = drag_card.T.y + (y - drag_y)
                card.T.r = 0
            else
                card.solatro_follower = nil
                card.T.x = self.T.x + 0.5*(self.T.w - card.T.w)
                --a selected run slides down, away from the pile, so it reads as picked up
                card.T.y = y + (card.solatro_selected and S_CONF.select_off or 0)
                card.T.r = 0
            end
            y = y + (card.facing == 'back' and down or up)*squish
        end
        if drag_card then
            drag_card.solatro_run = {}
            for k, card in ipairs(self.cards) do
                if card.solatro_follower then table.insert(drag_card.solatro_run, card) end
            end
        else
            for k, card in ipairs(self.cards) do card.solatro_run = nil end
        end
    else
        --stock, waste and foundations are simple stacks with a hint of depth
        for k, card in ipairs(self.cards) do
            if not card.states.drag.is then
                card.T.x = self.T.x + 0.5*(self.T.w - card.T.w)
                card.T.y = self.T.y + 0.5*(self.T.h - card.T.h) - math.min(k-1, 12)*0.012
                    - (card.solatro_selected and S_CONF.select_off or 0)
                card.T.r = 0
            end
        end
    end
    for k, card in ipairs(self.cards) do
        card.rank = k
    end
end

local ref_cardarea_set_ranks = CardArea.set_ranks
function CardArea:set_ranks()
    if not (self.config and self.config.solatro) then return ref_cardarea_set_ranks(self) end
    local kind = self.config.solatro
    for k, card in ipairs(self.cards) do
        card.rank = k
        card.states.hover.can = true
        card.states.click.can = true
        if kind == 'tableau' then
            card.states.collide.can = true
            card.states.drag.can = solatro_draggable(card)
        elseif kind == 'stock' then
            card.states.collide.can = k == #self.cards
            card.states.drag.can = false
        else --waste, foundation
            card.states.collide.can = k == #self.cards
            card.states.drag.can = solatro_draggable(card)
        end
    end
end

local ref_cardarea_draw = CardArea.draw
function CardArea:draw()
    if not (self.config and self.config.solatro) then return ref_cardarea_draw(self) end
    if not self.states.visible then return end

    if not self.children.area_uibox then
        local label = solatro_slot_label(self.config.solatro)
        self.children.area_uibox = UIBox{
            definition =
                {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR}, nodes={
                    {n=G.UIT.R, config={minw = self.T.w, minh = G.CARD_H, align = 'cm', padding = 0.1, r = 0.1, colour = {0, 0, 0, 0.14}}, nodes={
                        label and {n=G.UIT.T, config={text = label, scale = self.config.solatro == 'stock' and 0.35 or 0.7, colour = {1, 1, 1, 0.2}}} or nil,
                    }},
                }},
            config = {align = self.config.solatro == 'tableau' and 'tmi' or 'cm',
                offset = {x = 0, y = 0},
                major = self, parent = self}
        }
        self.children.area_uibox.states.collide.can = false
    end
    self.children.area_uibox:draw()

    self:draw_boundingrect()
    add_to_drawhash(self)

    for _, layer in ipairs({'shadow', 'card'}) do
        for i = 1, #self.cards do
            local card = self.cards[i]
            if card ~= G.CONTROLLER.dragging.target and card ~= G.CONTROLLER.focused.target
            and not card.solatro_follower then
                card:draw(layer)
            end
        end
    end
end

local ref_cardarea_click = CardArea.click
function CardArea:click()
    if self.config and self.config.solatro then
        if self.config.solatro == 'stock' then
            G.FUNCS.solatro_stock_click()
        elseif solatro_active() and not G.SOLATRO.dealing and not G.SOLATRO.won
        and G.SOLATRO.selected then
            --place the picked up card/run on this (possibly empty) pile
            local stack = selection_stack()
            clear_selection()
            if not (stack and try_move(stack, self)) then
                invalid_feedback(nil)
            end
        end
        return
    end
    return ref_cardarea_click(self)
end

--------------------------------------------------------------------
--Card behaviour while in a solitaire pile
--------------------------------------------------------------------

local ref_card_click = Card.click
function Card:click()
    if solatro_active() and self.area and self.area.config and self.area.config.solatro then
        G.FUNCS.solatro_card_click(self)
        return
    end
    return ref_card_click(self)
end

function Card:can_drag()
    if solatro_active() and solatro_draggable(self) then return self end
    return self.states.drag.can and self or nil
end

--set_ranks caches states.drag.can, and the controller only starts a drag from
--that cached flag - but emplace/remove_card call set_ranks BEFORE a card gets
--flipped, so a freshly revealed card stayed undraggable until its pile changed
--again. Refresh the pile's ranks whenever a card in a solitaire pile flips.
local ref_card_flip = Card.flip
function Card:flip()
    ref_card_flip(self)
    if self.area and self.area.config and self.area.config.solatro then
        self.area:set_ranks()
    end
end

local ref_card_stop_drag = Card.stop_drag
function Card:stop_drag()
    ref_card_stop_drag(self)
    if solatro_active() and self.area and self.area.config and self.area.config.solatro then
        G.FUNCS.solatro_drop(self)
    end
end

--the card being dragged is drawn on top by the controller; draw any cards
--riding along with it right after so a moving run stays visually intact
local ref_card_draw = Card.draw
function Card:draw(layer)
    ref_card_draw(self, layer)
    if not layer and self.solatro_run and G.CONTROLLER.dragging.target == self then
        for _, c in ipairs(self.solatro_run) do
            if not c.REMOVED then ref_card_draw(c) end
        end
    end
end

--------------------------------------------------------------------
--Game loop hooks
--------------------------------------------------------------------

--Music: Solatro plays its own track (music69, see modulate_sound below). The
--game's sound thread only scans resources/sounds/ - but love.filesystem merges
--the save directory with the game source, so the packaged mod self-installs
--the track there on first run and the vanilla loader picks it up like any
--other music file. The source-patched build has it baked in already, in which
--case the destination exists and this is a no-op. Runs at require time, which
--is before Game:start_up launches the sound thread.
do
    local src = 'Mods/Solatro/assets/sounds/music69.ogg'
    local dst = 'resources/sounds/music69.ogg'
    if love.filesystem.getInfo(src) and not love.filesystem.getInfo(dst) then
        local data = love.filesystem.read(src)
        if data then
            love.filesystem.createDirectory('resources/sounds')
            love.filesystem.write(dst, data)
        end
    end
end

--When running as a Lovely/Steamodded mod the game still ships the vanilla
--BALATRO title logo, so swap in the renamed SOLATRO logos from the mod folder
--(Mods/Solatro/assets, resolved inside the game's save directory). The source
--patched build has these baked into resources/textures, so the pcall quietly
--no-ops when the mod folder isn't there.
local ref_set_render_settings = Game.set_render_settings
function Game:set_render_settings()
    ref_set_render_settings(self)
    local scale = self.SETTINGS.GRAPHICS.texture_scaling or 2
    for atlas, file in pairs({balatro = 'solatro.png', balatro_alt = 'solatro_alt.png'}) do
        if self.ASSET_ATLAS[atlas] then
            local ok, img = pcall(love.graphics.newImage,
                'Mods/Solatro/assets/'..scale..'x/'..file,
                {mipmaps = true, dpiscale = scale})
            if ok and img then self.ASSET_ATLAS[atlas].image = img end
        end
    end
end

--Solatro's track plays on the main menu (normal pitch) and during solitaire
--itself, muffled at pitch 0.5 - Balatro's game-over/low-pass music treatment
local ref_modulate_sound = modulate_sound
function modulate_sound(dt)
    local solatro_menu = G.STAGE == G.STAGES.MAIN_MENU and G.STATE == G.STATES.MENU
    if solatro_active() or solatro_menu then
        G.SPLASH_VOL = 2*dt*(G.STATE == G.STATES.SPLASH and 1 or 0) + (G.SPLASH_VOL or 1)*(1-2*dt)
        G.PITCH_MOD = (G.PITCH_MOD or 1)*(1 - dt) + dt*(solatro_menu and 1 or 0.5)
        G.ARGS.push = G.ARGS.push or {}
        G.ARGS.push.type = 'modulate'
        G.ARGS.push.pitch_mod = G.PITCH_MOD
        G.ARGS.push.state = G.STATE
        G.ARGS.push.time = G.TIMERS.REAL
        G.ARGS.push.dt = dt
        G.ARGS.push.desired_track = 'music69'
        G.ARGS.push.sound_settings = G.SETTINGS.SOUND
        G.ARGS.push.splash_vol = G.SPLASH_VOL
        G.ARGS.push.overlay_menu = not (not G.OVERLAY_MENU)
        G.ARGS.push.ambient_control = G.SETTINGS.ambient_control or {}
        if G.F_SOUND_THREAD then
            G.SOUND_MANAGER.channel:push(G.ARGS.push)
        else
            MODULATE(G.ARGS.push)
        end
        return
    end
    ref_modulate_sound(dt)
end

local ref_game_update = Game.update
function Game:update(dt)
    ref_game_update(self, dt)
    if solatro_active() then
        if not G.SOLATRO.won and not G.SOLATRO.dealing then
            local t = math.max(0, math.floor(G.TIMERS.REAL - (G.SOLATRO.start_time or G.TIMERS.REAL)))
            G.SOLATRO.ui.time = string.format('%02d:%02d', math.floor(t/60), t%60)
        end
        if G.SOLATRO.won then
            solatro_update_cascade(G.real_dt)
        end
    end
end

local ref_game_delete_run = Game.delete_run
function Game:delete_run()
    if G.SOLATRO then
        if G.SOLATRO.hud and not G.SOLATRO.hud.REMOVED then G.SOLATRO.hud:remove() end
        G.SOLATRO = nil
    end
    ref_game_delete_run(self)
end
