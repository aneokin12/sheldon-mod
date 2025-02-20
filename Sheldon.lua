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
			"gains {X:mult,C:white} X#1# {} Mult in return.",
			"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
		},
	},
	atlas = "SheldonJoker",
	pos = { x = 0, y = 0 },
	rarity = 4,
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
})
