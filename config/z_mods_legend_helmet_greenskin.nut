local gt = this.getroottable();

if (!("LegendMod" in gt.Const))
{
	gt.Const.LegendMod <- {};
}

if (!("HelmObjs" in gt.Const.LegendMod))
{
	gt.Const.LegendMod.HelmObjs <- [];
}

gt.Const.LegendMod.HelmObjs.extend([
	{
		ID = "greenskins/goblin_heavy_helmet",
		Script = "scripts/items/legend_helmets/helmets/legend_goblin_heavy_helmet",
		Sets = []
	},
	{
		ID = "legend_goblin_heavy_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_cap"
					],
					[
						1,
						"hood/legend_helmet_goblin_scarf"
					],
					[
						1,
						"hood/legend_helmet_cloth_scarf"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_goblin_chain_helm"
					]
				],
				Vanity = [
					[
						1,
						""
					],
					[
						4,
						"vanity/legend_helmet_ponytail"
					]
				]
			}
		]
	},
	{
		ID = "greenskins/goblin_leader_helmet",
		Script = "scripts/items/legend_helmets/helmets/legend_goblin_leader_helmet",
		Sets = []
	},
	{
		ID = "greenskins/goblin_light_helmet",
		Script = "scripts/items/legend_helmets/helmets/legend_goblin_light_helmet",
		Sets = []
	},
	{
		ID = "legend_goblin_light_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_cap"
					],
					[
						1,
						"hood/legend_helmet_goblin_scarf"
					],
					[
						1,
						"hood/legend_helmet_cloth_scarf"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_goblin_leather_mask"
					],
					[
						1,
						"top/legend_helmet_goblin_leather_helm"
					]
				],
				Vanity = [
					[
						1,
						""
					],
					[
						1,
						"vanity_lower/legend_helmet_goblin_tail"
					]
				]
			}
		]
	},
	{
		ID = "greenskins/goblin_shaman_helmet",
		Script = "scripts/items/legend_helmets/helmets/legend_goblin_shaman_helmet",
		Sets = []
	},
	{
		ID = "greenskins/goblin_skirmisher_helmet",
		Script = "scripts/items/legend_helmets/helmets/legend_goblin_skirmisher_helmet",
		Sets = []
	},
	{
		ID = "legend_goblin_skirmisher_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_cap"
					],
					[
						1,
						"hood/legend_helmet_goblin_scarf"
					],
					[
						1,
						"hood/legend_helmet_cloth_scarf"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_goblin_leaves"
					],
					[
						1,
						"top/legend_helmet_goblin_leaf_helm"
					],
					[
						1,
						"top/legend_helmet_goblin_gillie"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "greenskins/legend_orc_behemoth_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_leather_cap"
					],
					[
						1,
						"hood/legend_helmet_barb_chain_scarf"
					],
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					],
					[
						1,
						"hood/legend_helmet_rotten_chain_scarf"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_orc_behemoth_helmet"
					]
				],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_orc_great_horns"
					]
				]
			}
		]
	},
	{
		ID = "greenskins/orc_berserker_helmet",
		Script = "scripts/items/legend_helmets/helmets/legend_orc_berserker_helmet",
		Sets = []
	},
	{
		ID = "greenskins/orc_elite_heavy_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_barb_chain_scarf"
					],
					[
						1,
						"hood/legend_helmet_chain_scarf"
					],
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					],
					[
						1,
						"hood/legend_helmet_chain_hood_full"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_orc_elite_double_helm"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "greenskins/orc_warlord_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_barb_chain_scarf"
					],
					[
						1,
						"hood/legend_helmet_chain_scarf"
					],
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					],
					[
						1,
						"hood/legend_helmet_chain_hood_full"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_orc_great_helm"
					]
				],
				Tops = [],
				Vanity = [
					[
						2,
						"vanity_lower/legend_helmet_orc_tail"
					],
					[
						1,
						"vanity_lower/legend_helmet_knotted_tail"
					]
				]
			}
		]
	},
	{
		ID = "greenskins/orc_warrior_heavy_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_barb_chain_scarf"
					],
					[
						1,
						"hood/legend_helmet_chain_scarf"
					],
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_orc_scale_helm"
					]
				],
				Tops = [],
				Vanity = [
					[
						3,
						""
					],
					[
						1,
						"vanity_lower/legend_helmet_knotted_tail"
					]
				]
			}
		]
	},
	{
		ID = "greenskins/orc_warrior_light_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						4,
						"hood/legend_helmet_leather_cap"
					],
					[
						2,
						"hood/legend_helmet_padded_cap"
					],
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_orc_strapped_helm"
					]
				],
				Tops = [],
				Vanity = [
					[
						2,
						""
					],
					[
						1,
						"vanity/legend_helmet_impaled_head"
					]
				]
			}
		]
	},
	{
		ID = "greenskins/orc_warrior_medium_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						4,
						"hood/legend_helmet_leather_cap"
					],
					[
						2,
						"hood/legend_helmet_padded_cap"
					],
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_orc_double_helm"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "greenskins/orc_young_heavy_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						4,
						"hood/legend_helmet_leather_cap"
					],
					[
						2,
						"hood/legend_helmet_padded_cap"
					],
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_orc_metal_mask"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "greenskins/orc_young_light_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						4,
						"hood/legend_helmet_cloth_cap"
					],
					[
						2,
						"hood/legend_helmet_leather_cap"
					],
					[
						1,
						"hood/legend_helmet_padded_cap"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_orc_leather_mask"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "greenskins/orc_young_medium_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_cap"
					],
					[
						2,
						"hood/legend_helmet_leather_cap"
					],
					[
						1,
						"hood/legend_helmet_padded_cap"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_orc_horn_mask"
					]
				],
				Vanity = []
			}
		]
	}
]);

