local gt = this.getroottable();
local et = gt.Const.EntityType;
gt.Const.PerkPurchasePower <- {
	VeryLow = 2,
	Low = 4,
	Medium = 5,
	High = 7,
	VeryHigh = 9,
	ExtraHigh = 11
};
gt.Const.RandomizedCharacterInfo <- {};
gt.Const.RandomizedCharacterInfo.Default <- {
	Outfits = [
		[
			1,
			"low_tier_unit_catchall_outfit_01"
		]
	],
	ClassPerkList = [],
	DefensePerkList = [
		this.Const.Perks.HeavyArmorTree,
		this.Const.Perks.MediumArmorTree,
		this.Const.Perks.LightArmorTree
	],
	TraitsPerkList = [
		this.Const.Perks.AgileTree,
		this.Const.Perks.IndestructibleTree,
		this.Const.Perks.MartyrTree,
		this.Const.Perks.ViciousTree,
		this.Const.Perks.CalmTree,
		this.Const.Perks.FastTree,
		this.Const.Perks.LargeTree,
		this.Const.Perks.OrganisedTree,
		this.Const.Perks.SturdyTree,
		this.Const.Perks.FitTree,
		this.Const.Perks.TrainedTree
	],
	GuaranteedPerks = [],
	LegendaryPerks = [],
	WeaponsAndTrees = [
		[
			"scripts/items/weapons/knife",
			100,
			75
		]
	],
	LevelRange = [
		3,
		3
	],
	PerkPower = gt.Const.PerkPurchasePower.Low
};
gt.Const.RandomizedCharacterInfo[gt.Const.EntityType.Peasant] <- {
	Outfits = [
		[
			1,
			"peasant_outfit_00"
		]
	],
	WeaponsAndTrees = [
		[
			2,
			[
				"scripts/items/weapons/knife",
				100,
				80
			]
		],
		[
			2,
			[
				"scripts/items/weapons/pitchfork",
				100,
				60
			]
		],
		[
			2,
			[
				"scripts/items/weapons/wooden_stick",
				100,
				65
			]
		],
		[
			1,
			[
				"scripts/items/weapons/pickaxe",
				100,
				45
			]
		],
		[
			2,
			[
				"scripts/items/weapons/legend_hammer",
				100,
				60
			]
		],
		[
			2,
			[
				"scripts/items/weapons/legend_sickle",
				100,
				80
			]
		],
		[
			2,
			[
				"scripts/items/weapons/legend_wooden_pitchfork",
				100,
				65
			]
		],
		[
			2,
			[
				"scripts/items/weapons/legend_scythe",
				100,
				75
			]
		],
		[
			2,
			[
				"scripts/items/weapons/legend_hoe",
				100
			]
		],
		[
			2,
			[
				"scripts/items/weapons/legend_shiv",
				100,
				75
			]
		],
		[
			2,
			[
				"scripts/items/weapons/legend_shovel",
				100,
				80
			]
		],
		[
			2,
			[
				"scripts/items/weapons/legend_staff",
				100
			]
		],
		[
			1,
			[
				"scripts/items/weapons/butchers_cleaver",
				100,
				45
			]
		],
		[
			2,
			[
				"scripts/items/weapons/legend_wooden_spear",
				100,
				80
			]
		]
	],
	LegendaryPerks = [
		"scripts/skills/perks/perk_nimble",
		"scripts/skills/traits/fearless_trait"
	],
	LevelRange = [
		1,
		3
	],
	PerkPower = gt.Const.PerkPurchasePower.VeryLow
};
gt.Const.RandomizedCharacterInfo[gt.Const.EntityType.CaravanHand] <- {
	Outfits = [
		[
			1,
			"caravan_hand_outfit_00"
		]
	],
	WeaponsAndTrees = [
		[
			1,
			[
				"scripts/items/weapons/dagger",
				100,
				75
			]
		],
		[
			1,
			[
				"scripts/items/weapons/knife",
				100,
				75
			]
		],
		[
			1,
			[
				"scripts/items/weapons/wooden_stick",
				100,
				75
			]
		],
		[
			2,
			[
				"scripts/items/weapons/hatchet",
				100
			]
		],
		[
			2,
			[
				"scripts/items/weapons/bludgeon",
				100
			]
		],
		[
			3,
			[
				"scripts/items/weapons/militia_spear",
				100,
				75
			]
		],
		[
			1,
			[
				"scripts/items/weapons/scramasax",
				100
			]
		],
		[
			2,
			[
				"scripts/items/weapons/shortsword",
				100
			]
		],
		[
			2,
			[
				"scripts/items/weapons/legend_militia_glaive",
				100
			]
		]
	],
	Shields = [
		[
			1,
			"scripts/items/shields/buckler_shield"
		],
		[
			2,
			""
		]
	],
	GuaranteedPerks = [
		"scripts/skills/perks/perk_recover"
	],
	LegendaryPerks = [
		"scripts/skills/perks/perk_shield_bash",
		"scripts/skills/perks/perk_pathfinder",
		"scripts/skills/perks/perk_underdog",
		"scripts/skills/perks/perk_legend_alert",
		"scripts/skills/perks/perk_crippling_strikes",
		"scripts/skills/traits/fearless_trait"
	],
	LevelRange = [
		3,
		5
	],
	PerkPower = gt.Const.PerkPurchasePower.Low
};
gt.Const.RandomizedCharacterInfo[gt.Const.EntityType.CaravanGuard] <- {
	Outfits = [
		[
			1,
			"caravan_guard_outfit_00"
		]
	],
	DefensePerkList = [
		this.Const.Perks.HeavyArmorTree,
		this.Const.Perks.MediumArmorTree,
		this.Const.Perks.LightArmorTree,
		this.Const.Perks.ClothArmorTree
	],
	WeaponsAndTrees = [
		[
			1,
			[
				"scripts/items/weapons/hand_axe",
				100
			]
		],
		[
			1,
			[
				"scripts/items/weapons/boar_spear",
				100
			]
		],
		[
			2,
			[
				"scripts/items/weapons/falchion",
				100
			]
		],
		[
			2,
			[
				"scripts/items/weapons/shortsword",
				100
			]
		],
		[
			1,
			[
				"scripts/items/weapons/arming_sword",
				100
			]
		],
		[
			2,
			[
				"scripts/items/weapons/legend_glaive",
				100
			]
		]
	],
	GuaranteedPerks = [
		"scripts/skills/perks/perk_recover",
		"scripts/skills/perks/perk_shield_expert"
	],
	LegendaryPerks = [
		"scripts/skills/perks/perk_legend_specialist_shield_skill",
		"scripts/skills/perks/perk_legend_specialist_shield_push",
		"scripts/skills/perks/perk_shield_bash",
		"scripts/skills/perks/perk_hold_out",
		"scripts/skills/perks/perk_underdog",
		"scripts/skills/perks/perk_rotation",
		"scripts/skills/perks/perk_legend_alert",
		"scripts/skills/perks/perk_crippling_strikes",
		"scripts/skills/traits/fearless_trait"
	],
	Shields = [
		[
			1,
			"scripts/items/shields/wooden_shield"
		]
	],
	LevelRange = [
		4,
		7
	],
	PerkPower = gt.Const.PerkPurchasePower.Medium
};
gt.Const.RandomizedCharacterInfo[gt.Const.EntityType.BanditRabble] <- {
	Outfits = [
		[
			1,
			"bandit_rabble_outfit_00"
		]
	],
	TraitsPerkList = [
		this.Const.Perks.AgileTree,
		this.Const.Perks.IndestructibleTree,
		this.Const.Perks.MartyrTree,
		this.Const.Perks.ViciousTree,
		this.Const.Perks.CalmTree,
		this.Const.Perks.FastTree,
		this.Const.Perks.LargeTree,
		this.Const.Perks.SturdyTree,
		this.Const.Perks.FitTree,
		this.Const.Perks.TrainedTree
	],
	WeaponsAndTrees = [
		[
			1,
			[
				"scripts/items/weapons/legend_wooden_pitchfork",
				35
			],
			[
				"scripts/skills/perks/perk_coup_de_grace",
				"scripts/skills/perks/perk_legend_specialist_pitchfork_skill",
				"scripts/skills/perks/perk_legend_specialist_pitchfork_damage"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/legend_wooden_spear",
				35
			],
			[
				"scripts/skills/perks/perk_legend_specialist_militia_skill",
				"scripts/skills/perks/perk_legend_specialist_militia_damage"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/legend_sickle",
				35
			],
			[
				"scripts/skills/perks/perk_legend_specialist_sickle_skill",
				"scripts/skills/perks/perk_legend_specialist_sickle_damage"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/legend_staff",
				35
			],
			[
				"scripts/skills/perks/perk_legend_specialist_staff_skill",
				"scripts/skills/perks/perk_legend_mastery_staff_stun",
				"scripts/skills/perks/perk_fortified_mind"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/legend_shovel",
				35
			],
			[
				"scripts/skills/perks/perk_legend_specialist_shovel_skill",
				"scripts/skills/perks/perk_legend_specialist_shovel_damage"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/wooden_stick",
				35
			],
			[
				"scripts/skills/perks/perk_legend_onslaught",
				"scripts/skills/perks/perk_overwhelm",
				"scripts/skills/perks/perk_colossus",
				"scripts/skills/perks/perk_recover",
				"scripts/skills/perks/perk_rebound"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/legend_hammer",
				35
			],
			[
				"scripts/skills/perks/perk_legend_specialist_hammer_skill",
				"scripts/skills/perks/perk_legend_specialist_hammer_damage",
				"scripts/skills/perks/perk_colossus"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/legend_shiv",
				35
			],
			[
				"scripts/skills/perks/perk_legend_specialist_knife_skill",
				"scripts/skills/perks/perk_legend_specialist_knife_damage",
				"scripts/skills/perks/perk_duelist"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/lute",
				35
			],
			[
				"scripts/skills/perks/perk_legend_specialist_lute_damage",
				"scripts/skills/perks/perk_legend_mind_over_body",
				"scripts/skills/perks/perk_recover"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/butchers_cleaver",
				35
			],
			[
				"scripts/skills/perks/perk_legend_bloodbath",
				"scripts/skills/perks/perk_legend_specialist_butcher_skill",
				"scripts/skills/perks/perk_legend_specialist_butcher_damage"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/legend_saw",
				35
			],
			[
				"scripts/skills/perks/perk_legend_smashing_shields",
				"scripts/skills/perks/perk_legend_specialist_woodaxe_skill",
				"scripts/skills/perks/perk_legend_specialist_woodaxe_damage"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/legend_hoe",
				35
			],
			[
				"scripts/skills/perks/perk_legend_smackdown",
				"scripts/skills/perks/perk_legend_specialist_pitchfork_skill",
				"scripts/skills/perks/perk_legend_specialist_pitchfork_damage"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/wooden_flail",
				35
			],
			[
				"scripts/skills/perks/perk_head_hunter",
				"scripts/skills/perks/perk_battle_flow",
				"scripts/skills/perks/perk_legend_specialist_pitchfork_skill",
				"scripts/skills/perks/perk_legend_specialist_pitchfork_damage"
			]
		]
	],
	Shields = [
		[
			1,
			"scripts/items/shields/buckler_shield"
		],
		[
			14,
			""
		]
	],
	LegendaryPerks = [
		"scripts/skills/perks/perk_dodge",
		"scripts/skills/perks/perk_backstabber",
		"scripts/skills/traits/fearless_trait"
	],
	LevelRange = [
		1,
		3
	],
	PerkPower = gt.Const.PerkPurchasePower.VeryLow
};
gt.Const.RandomizedCharacterInfo[gt.Const.EntityType.BanditRabblePoacher] <- {
	Outfits = [
		[
			1,
			"bandit_rabble_poacher_outfit_00"
		]
	],
	TraitsPerkList = [
		this.Const.Perks.AgileTree,
		this.Const.Perks.MartyrTree,
		this.Const.Perks.ViciousTree,
		this.Const.Perks.CalmTree,
		this.Const.Perks.FastTree,
		this.Const.Perks.LargeTree,
		this.Const.Perks.SturdyTree,
		this.Const.Perks.FitTree,
		this.Const.Perks.TrainedTree
	],
	WeaponsAndTrees = [
		[
			1,
			[
				"scripts/items/weapons/short_bow",
				50
			]
		],
		[
			2,
			[
				"scripts/items/weapons/legend_sling",
				50
			]
		]
	],
	LegendaryPerks = [
		"scripts/skills/perks/perk_dodge",
		"scripts/skills/perks/perk_backstabber",
		"scripts/skills/traits/fearless_trait",
		"scripts/skills/traits/determined_trait"
	],
	LevelRange = [
		1,
		3
	],
	PerkPower = gt.Const.PerkPurchasePower.VeryLow
};
gt.Const.RandomizedCharacterInfo[gt.Const.EntityType.BanditThug] <- {
	Outfits = [
		[
			1,
			"bandit_thug_outfit_00"
		]
	],
	WeaponsAndTrees = [
		[
			1,
			[
				"scripts/items/weapons/woodcutters_axe",
				70
			],
			[
				"scripts/skills/perks/perk_legend_smashing_shields"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/goedendag",
				70
			],
			[
				"scripts/skills/perks/perk_legend_onslaught"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/pitchfork",
				70
			],
			[
				"scripts/skills/perks/perk_coup_de_grace"
			]
		],
		[
			3,
			[
				"scripts/items/weapons/shortsword",
				70
			],
			[
				"scripts/skills/perks/perk_duelist"
			]
		],
		[
			3,
			[
				"scripts/items/weapons/hatchet",
				70
			],
			[
				"scripts/skills/perks/perk_legend_smashing_shields"
			]
		],
		[
			3,
			[
				"scripts/items/weapons/bludgeon",
				70
			],
			[
				"scripts/skills/perks/perk_legend_onslaught"
			]
		],
		[
			3,
			[
				"scripts/items/weapons/militia_spear",
				70
			],
			[
				"scripts/skills/perks/perk_overwhelm"
			]
		],
		[
			3,
			[
				"scripts/items/weapons/pickaxe",
				70
			],
			[
				"scripts/skills/perks/perk_legend_smackdown"
			]
		],
		[
			3,
			[
				"scripts/items/weapons/reinforced_wooden_flail",
				70
			],
			[
				"scripts/skills/perks/perk_head_hunter"
			]
		],
		[
			3,
			[
				"scripts/items/weapons/wooden_flail",
				70
			],
			[
				"scripts/skills/perks/perk_head_hunter"
			]
		],
		[
			3,
			[
				"scripts/items/weapons/butchers_cleaver",
				70
			],
			[
				"scripts/skills/perks/perk_legend_bloodbath"
			]
		],
		[
			3,
			[
				"scripts/items/weapons/dagger",
				70
			],
			[
				"scripts/skills/perks/perk_duelist"
			]
		],
		[
			3,
			[
				"scripts/items/weapons/legend_scythe",
				70
			],
			[
				"scripts/skills/perks/perk_coup_de_grace"
			]
		],
		[
			3,
			[
				"scripts/items/weapons/legend_tipstaff",
				70
			],
			[
				"scripts/skills/perks/perk_return_favor"
			]
		],
		[
			3,
			[
				"scripts/items/weapons/legend_militia_glaive",
				70
			],
			[
				"scripts/skills/perks/perk_killing_frenzy"
			]
		],
		[
			3,
			[
				"scripts/items/weapons/legend_tipstaff",
				70
			],
			[
				"scripts/skills/perks/perk_killing_frenzy"
			]
		],
		[
			3,
			[
				"scripts/items/weapons/legend_ranged_wooden_flail",
				70
			],
			[
				"scripts/skills/perks/perk_killing_frenzy"
			]
		]
	],
	Shields = [
		[
			1,
			"scripts/items/shields/wooden_shield"
		],
		[
			1,
			"scripts/items/shields/buckler_shield"
		],
		[
			6,
			""
		]
	],
	TraitsPerkList = [
		this.Const.Perks.AgileTree,
		this.Const.Perks.IndestructibleTree,
		this.Const.Perks.MartyrTree,
		this.Const.Perks.ViciousTree,
		this.Const.Perks.CalmTree,
		this.Const.Perks.FastTree,
		this.Const.Perks.LargeTree,
		this.Const.Perks.SturdyTree,
		this.Const.Perks.FitTree,
		this.Const.Perks.TrainedTree
	],
	LegendaryPerks = [
		"scripts/skills/perks/perk_relentless",
		"scripts/skills/perks/perk_dodge",
		"scripts/skills/perks/perk_backstabber",
		"scripts/skills/perks/perk_underdog",
		"scripts/skills/traits/fearless_trait"
	],
	LevelRange = [
		2,
		4
	],
	PerkPower = gt.Const.PerkPurchasePower.Low
};
gt.Const.RandomizedCharacterInfo[gt.Const.EntityType.BanditPoacher] <- {
	Outfits = [
		[
			1,
			"bandit_poacher_outfit_00"
		]
	],
	WeaponsAndTrees = [
		[
			2,
			[
				"scripts/items/weapons/short_bow",
				65
			]
		],
		[
			1,
			[
				"scripts/items/weapons/legend_sling",
				65
			]
		]
	],
	TraitsPerkList = [
		this.Const.Perks.AgileTree,
		this.Const.Perks.MartyrTree,
		this.Const.Perks.ViciousTree,
		this.Const.Perks.CalmTree,
		this.Const.Perks.FastTree,
		this.Const.Perks.LargeTree,
		this.Const.Perks.SturdyTree,
		this.Const.Perks.FitTree,
		this.Const.Perks.TrainedTree
	],
	LegendaryPerks = [
		"scripts/skills/perks/perk_dodge",
		"scripts/skills/perks/perk_backstabber",
		"scripts/skills/traits/fearless_trait"
	],
	LevelRange = [
		2,
		4
	],
	GuaranteedPerks = [
		"scripts/skills/perks/perk_rotation",
		"scripts/skills/perks/perk_recover"
	],
	PerkPower = gt.Const.PerkPurchasePower.Low
};
gt.Const.RandomizedCharacterInfo[gt.Const.EntityType.BanditRaider] <- {
	Outfits = [
		[
			1,
			"dark_southern_outfit_00"
		],
		[
			19,
			"bandit_raider_outfit_00"
		]
	],
	DefensePerkList = [
		this.Const.Perks.HeavyArmorTree,
		this.Const.Perks.MediumArmorTree,
		this.Const.Perks.LightArmorTree
	],
	WeaponsAndTrees = [
		[
			1,
			[
				"scripts/items/weapons/legend_infantry_axe",
				70
			],
			[
				"scripts/skills/perks/perk_legend_smashing_shields"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/hooked_blade",
				70
			],
			[
				"scripts/skills/perks/perk_crippling_strikes"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/pike",
				70
			],
			[
				"scripts/skills/perks/perk_reach_advantage"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/warbrand",
				70
			],
			[
				"scripts/skills/perks/perk_bloody_harvest"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/longaxe",
				70
			],
			[
				"scripts/skills/perks/perk_killing_frenzy"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/two_handed_wooden_hammer",
				70
			],
			[
				"scripts/skills/perks/perk_sundering_strikes"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/two_handed_wooden_flail",
				70
			],
			[
				"scripts/skills/perks/perk_head_hunter"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/legend_ranged_flail",
				70
			],
			[
				"scripts/skills/perks/perk_colossus"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/legend_reinforced_flail",
				70
			],
			[
				"scripts/skills/perks/perk_vengeance"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/two_handed_mace",
				70
			],
			[
				"scripts/skills/perks/perk_legend_forceful_swing"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/longsword",
				70
			],
			[
				"scripts/skills/perks/perk_colossus"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/legend_longsword",
				70
			],
			[
				"scripts/skills/perks/perk_duelist"
			]
		],
		[
			1,
			[
				"scripts/items/weapons/legend_two_handed_club",
				70
			],
			[
				"scripts/skills/perks/perk_legend_smashing_shields"
			]
		],
		[
			5,
			[
				"scripts/items/weapons/shortsword",
				70,
				30
			],
			[
				"scripts/skills/perks/perk_overwhelm"
			]
		],
		[
			5,
			[
				"scripts/items/weapons/hand_axe",
				70
			],
			[
				"scripts/skills/perks/perk_legend_onslaught"
			]
		],
		[
			5,
			[
				"scripts/items/weapons/boar_spear",
				70
			],
			[
				"scripts/skills/perks/perk_duelist"
			]
		],
		[
			5,
			[
				"scripts/items/weapons/morning_star",
				70
			],
			[
				"scripts/skills/perks/perk_feint"
			]
		],
		[
			5,
			[
				"scripts/items/weapons/falchion",
				70
			],
			[
				"scripts/skills/perks/perk_feint"
			]
		],
		[
			5,
			[
				"scripts/items/weapons/arming_sword",
				70
			],
			[
				"scripts/skills/perks/perk_legend_bloodbath"
			]
		],
		[
			5,
			[
				"scripts/items/weapons/flail",
				70
			],
			[
				"scripts/skills/perks/perk_head_hunter"
			]
		],
		[
			5,
			[
				"scripts/items/weapons/scramasax",
				70
			],
			[
				"scripts/skills/perks/perk_killing_frenzy"
			]
		],
		[
			5,
			[
				"scripts/items/weapons/military_pick",
				70
			],
			[
				"scripts/skills/perks/perk_legend_smackdown"
			]
		],
		[
			5,
			[
				"scripts/items/weapons/legend_glaive",
				70
			],
			[
				"scripts/skills/perks/perk_killing_frenzy"
			]
		]
	],
	Shields = [
		[
			3,
			""
		],
		[
			4,
			"scripts/items/shields/wooden_shield"
		],
		[
			2,
			"scripts/items/shields/kite_shield"
		]
	],
	TraitsPerkList = [
		this.Const.Perks.AgileTree,
		this.Const.Perks.IndestructibleTree,
		this.Const.Perks.MartyrTree,
		this.Const.Perks.ViciousTree,
		this.Const.Perks.CalmTree,
		this.Const.Perks.FastTree,
		this.Const.Perks.LargeTree,
		this.Const.Perks.SturdyTree,
		this.Const.Perks.FitTree,
		this.Const.Perks.TrainedTree
	],
	LegendaryPerks = [
		"scripts/skills/perks/perk_relentless",
		"scripts/skills/perks/perk_dodge",
		"scripts/skills/perks/perk_backstabber",
		"scripts/skills/perks/perk_underdog",
		"scripts/skills/traits/fearless_trait"
	],
	GuaranteedPerks = [
		"scripts/skills/perks/perk_bullseye",
		"scripts/skills/perks/perk_rotation",
		"scripts/skills/perks/perk_recover"
	],
	LevelRange = [
		3,
		4
	],
	PerkPower = gt.Const.PerkPurchasePower.Low
};
gt.Const.RandomizedCharacterInfo.BanditRaiderLow <- {
	Outfits = [
		[
			1,
			"bandit_raider_low_outfit_00"
		]
	],
	WeaponsAndTrees = [
		[
			1,
			[
				"scripts/items/weapons/woodcutters_axe",
				70
			]
		],
		[
			1,
			[
				"scripts/items/weapons/hooked_blade",
				70
			]
		],
		[
			1,
			[
				"scripts/items/weapons/pike",
				70
			]
		],
		[
			1,
			[
				"scripts/items/weapons/two_handed_wooden_hammer",
				70
			]
		],
		[
			1,
			[
				"scripts/items/weapons/shortsword",
				70
			]
		],
		[
			1,
			[
				"scripts/items/weapons/hand_axe",
				70
			]
		],
		[
			1,
			[
				"scripts/items/weapons/boar_spear",
				70
			]
		],
		[
			1,
			[
				"scripts/items/weapons/morning_star",
				70
			]
		],
		[
			1,
			[
				"scripts/items/weapons/falchion",
				70
			]
		],
		[
			1,
			[
				"scripts/items/weapons/flail",
				70
			]
		]
	],
	Shields = [
		[
			1,
			""
		],
		[
			2,
			"scripts/items/shields/buckler_shield"
		],
		[
			1,
			"scripts/items/shields/wooden_shield"
		]
	]
};
gt.Const.RandomizedCharacterInfo[gt.Const.EntityType.LegendCaravanPolearm] <- {
	Outfits = [
		[
			1,
			"legend_caravan_polearm_outfit_00"
		]
	],
	WeaponsAndTrees = [
		[
			5,
			[
				"scripts/items/weapons/legend_ranged_wooden_flail",
				75,
				35
			]
		],
		[
			5,
			[
				"scripts/items/weapons/legend_staff",
				75,
				65
			]
		],
		[
			4,
			[
				"scripts/items/weapons/legend_tipstaff",
				75,
				65
			]
		],
		[
			5,
			[
				"scripts/items/weapons/pitchfork",
				50,
				35
			]
		],
		[
			1,
			[
				"scripts/items/weapons/warfork",
				50,
				0
			]
		]
	],
	TraitsPerkList = [
		this.Const.Perks.AgileTree,
		this.Const.Perks.CalmTree,
		this.Const.Perks.FastTree,
		this.Const.Perks.LargeTree,
		this.Const.Perks.OrganisedTree,
		this.Const.Perks.SturdyTree,
		this.Const.Perks.FitTree
	],
	DefensePerkList = [
		this.Const.Perks.LightArmorTree,
		this.Const.Perks.MediumArmorTree
	],
	GuaranteedPerks = [
		"scripts/skills/perks/perk_bags_and_belts"
	],
	LegendaryPerks = [
		"scripts/skills/perks/perk_pathfinder",
		"scripts/skills/perks/perk_crippling_strikes",
		"scripts/skills/perks/perk_overwhelm",
		"scripts/skills/traits/fearless_trait"
	],
	LevelRange = [
		3,
		4
	],
	PerkPower = gt.Const.PerkPurchasePower.Low
};
gt.Const.RandomizedMalus <- {
	Hitpoints = [
		0,
		0
	],
	Bravery = [
		0,
		0
	],
	Stamina = [
		0,
		0
	],
	MeleeSkill = [
		-4,
		-6
	],
	RangedSkill = [
		-4,
		-7
	],
	MeleeDefense = [
		0,
		0
	],
	RangedDefense = [
		0,
		0
	],
	Initiative = [
		0,
		0
	]
};
gt.Const.GetWeaponAndTree <- function ( _array )
{
	local candidates = [];
	local totalWeight = 0;

	foreach( weapon in _array )
	{
		if (weapon[0] == 0)
		{
			continue;
		}

		candidates.push(weapon);
		totalWeight = totalWeight + weapon[0];
	}

	local r = this.Math.rand(0, totalWeight);

	foreach( weapon in candidates )
	{
		r = r - weapon[0];

		if (r > 0)
		{
			continue;
		}

		if (weapon.len() >= 3)
		{
			return [
				weapon[1],
				weapon[2]
			];
		}

		return [
			weapon[1]
		];
	}
};
gt.Const.GetWeaponClassTree <- function ( _item )
{
	switch(true)
	{
	case _item.getID() == "weapon.legend_shovel" || _item.getID() == "weapon.legend_named_shovel":
		return this.Const.Perks.ShovelClassTree;

	case _item.getID() == "weapon.sickle" || _item.getID() == "weapon.goblin_notched_blade" || _item.getID() == "weapon.legend_named_sickle":
		return this.Const.Perks.SickleClassTree;

	case _item.getID() == "weapon.woodcutters_axe" || _item.getID() == "weapon.legend_saw":
		return this.Const.Perks.WoodaxeClassTree;

	case _item.getID() == "weapon.legend_hammer" || _item.getID() == "weapon.legend_named_blacksmith_hammer":
		return this.Const.Perks.HammerClassTree;

	case _item.getID() == "weapon.pickaxe":
		return this.Const.Perks.PickaxeClassTree;

	case _item.getID() == "weapon.butchers_cleaver" || _item.getID() == "weapon.legend_named_butchers_cleaver":
		return this.Const.Perks.ButcherClassTree;

	case _item.getID() == "weapon.legend_cat_o_nine_tails":
		return this.Const.Perks.NinetailsClassTree;

	case _item.getID() == "weapon.knife" || _item.getID() == "weapon.legend_shiv":
		return this.Const.Perks.KnifeClassTree;

	case _item.getID() == "weapon.legend_grisly_scythe" || _item.getID() == "weapon.legend_scythe" || _item.getID() == "weapon.warscythe" || _item.getID() == "weapon.named_warscythe":
		return this.Const.Perks.ScytheClassTree;

	case _item.isItemType(this.Const.Items.ItemType.Pitchfork):
		return this.Const.Perks.PitchforkClassTree;

	case _item.isWeaponType(this.Const.Items.WeaponType.Musical):
		return this.Const.Perks.BardClassTree;

	case _item.isItemType(this.Const.Items.ItemType.Shortbow):
		return this.Const.Perks.ShortbowClassTree;

	case _item.isItemType(this.Const.Items.ItemType.Net):
		return this.Const.Perks.BeastClassTree;

	case _item.getID() == "weapon.militia_spear" || _item.getID() == "weapon.legend_wooden_spear" || _item.getID() == "weapon.ancient_spear":
		return this.Const.Perks.MilitiaClassTree;
	}

	return null;
};
gt.Const.GetWeaponPerkTree <- function ( _item )
{
	if (_item.isWeaponType(this.Const.Items.WeaponType.Sword) && _item.isItemType(this.Const.Items.ItemType.TwoHanded))
	{
		return [
			this.Const.Perks.GreatSwordTree
		];
	}

	local ret = [];
	local weaponToPerkMap = {
		Axe = this.Const.Perks.AxeTree,
		Bow = this.Const.Perks.BowTree,
		Cleaver = this.Const.Perks.CleaverTree,
		Crossbow = this.Const.Perks.CrossbowTree,
		Dagger = this.Const.Perks.DaggerTree,
		Firearm = this.Const.Perks.CrossbowTree,
		Flail = this.Const.Perks.FlailTree,
		Hammer = this.Const.Perks.HammerTree,
		Mace = this.Const.Perks.MaceTree,
		Polearm = this.Const.Perks.PolearmTree,
		Sling = this.Const.Perks.SlingTree,
		Spear = this.Const.Perks.SpearTree,
		Sword = this.Const.Perks.SwordTree,
		Staff = this.Const.Perks.StaffTree,
		Throwing = this.Const.Perks.ThrowingTree
	};

	foreach( weapon, tree in weaponToPerkMap )
	{
		if (_item.isWeaponType(this.Const.Items.WeaponType[weapon]))
		{
			ret.push(tree);
		}
	}

	return ret;
};

