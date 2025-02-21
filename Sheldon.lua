--- SHELDON MOD SHELDON MOD SHELDON MOD ---
SMODS.Atlas({
	key = "SheldonJoker",
	path = "SheldonJoker.png",
	px = 71,
	py = 95,
})

SMODS.Joker({
	key = "sheldon",
	unlocked = true,
	discovered = true,
	loc_txt = {
		name = "SHELDON",
		text = {
			"When Blind is selected,",
			"Sheldon steals {C:money}$#1#{}, but",
			"gains {X:mult,C:white} X#1# {} Mult in return",
			"{s:0.8} Resets if money drops below {}{s:0.8,C:money}$0{}",
			"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
		},
	},
	atlas = "SheldonJoker",
	pos = { x = 0, y = 0 },
	rarity = 3,
	config = {
		extra = {
			initial = 2.24,
			curr_xmult = 1,
		},
	},
	loc_vars = function(self, info_queue, card)
		return { vars = {
			card.ability.extra.initial,
			card.ability.extra.curr_xmult,
		} }
	end,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			ease_dollars(-card.ability.extra.initial)
			card_eval_status_text(
				card,
				"jokers",
				nil,
				percent,
				nil,
				{ message = "-$" .. tostring(card.ability.extra.initial), colour = G.C.MONEY }
			)
			if G.GAME.dollars - card.ability.extra.initial < 0 then
				card.ability.extra.curr_xmult = 1
				card_eval_status_text(card, "jokers", nil, percent, nil, { message = "Reset!", colour = G.C.RED })
			else
				card.ability.extra.curr_xmult = card.ability.extra.curr_xmult + card.ability.extra.initial
				card_eval_status_text(card, "jokers", nil, percent, nil, { message = "Gimme!", colour = G.C.GREEN })
			end
			return {
				Xmult_mod = card.ability.extra.curr_xmult,
				card = card,
			}
		end
		if context.joker_main then
			return {
				message = "X" .. tostring(card.ability.extra.curr_xmult),
				colour = G.C.MULT,
				Xmult_mod = card.ability.extra.curr_xmult,
			}
		end
	end,
	set_badges = function(self, card, badges)
		badges[#badges + 1] = create_badge("Author: Aneokin", G.C.GREEN, G.C.WHITE, 1)
	end,
})

--- TODO: Recalculate (G.GAME.dollars - card.ability.extra.initial < 0) based on number of SHELDONs in hand
--- TODO: Add an in_pool parameter so that SHELDON can show up in the Shop
--- TODO: Add localization files (only if mod expands?)
--- TODO: Add README.md
