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
		ID = "barbarians/barbarian_ritual_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_chain_scarf"
					],
					[
						1,
						"hood/legend_helmet_aventail"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_barb_ritual_helm"
					]
				],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_bull_horns"
					]
				]
			}
		]
	},
	{
		ID = "barbarians/bear_headpiece",
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
						"hood/legend_helmet_padded_cap"
					],
					[
						1,
						"hood/legend_helmet_chain_scarf"
					],
					[
						1,
						"hood/legend_helmet_aventail"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_bear_head"
					]
				]
			}
		]
	},
	{
		ID = "barbarians/beastmasters_headpiece",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_barb_open_chain"
					],
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
						"hood/legend_helmet_aventail"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_barb_metal_cap"
					]
				],
				Tops = [
					[
						5,
						""
					],
					[
						1,
						"top/legend_helmet_orc_leather_mask"
					],
					[
						1,
						"top/legend_helmet_orc_horn_mask"
					]
				],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_goat_horns"
					]
				]
			}
		]
	},
	{
		ID = "barbarians/closed_scrap_metal_helmet",
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
						"hood/legend_helmet_rotten_chain_scarf"
					],
					[
						1,
						"hood/legend_helmet_barb_open_chain"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_crude_cylinder_helm"
					]
				],
				Tops = [],
				Vanity = [
					[
						1,
						""
					],
					[
						1,
						"vanity/legend_helmet_bull_horns"
					],
					[
						1,
						"vanity/legend_helmet_ram_horns"
					],
					[
						2,
						"vanity/legend_helmet_antler"
					]
				]
			}
		]
	},
	{
		ID = "barbarians/crude_faceguard_helmet",
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
						"hood/legend_helmet_rotten_chain_scarf"
					],
					[
						1,
						"hood/legend_helmet_barb_open_chain"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_crude_metal_helm"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "barbarians/crude_metal_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_barb_leather_cap"
					],
					[
						1,
						"hood/legend_helmet_leather_cap"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_crude_metal_helm"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "barbarians/heavy_horned_plate_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_barb_chain_scarf"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_heavy_plate_helm"
					]
				],
				Tops = [
					[
						2,
						""
					],
					[
						1,
						"top/legend_helmet_leather_hood_barb"
					],
					[
						2,
						"top/legend_helmet_headband_side"
					],
					[
						2,
						"top/legend_helmet_headband_nose"
					]
				],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_antler"
					],
					[
						1,
						"vanity/legend_helmet_bear_head"
					],
					[
						5,
						"vanity/legend_helmet_bull_horns"
					],
					[
						1,
						"vanity/legend_helmet_goat_horns"
					],
					[
						1,
						"vanity/legend_helmet_ram_horns"
					],
					[
						1,
						""
					]
				]
			}
		]
	},
	{
		ID = "barbarians/leather_headband",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_barb_leather_cap"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_headband_side"
					],
					[
						1,
						"top/legend_helmet_headband_nose"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "barbarians/leather_helmet",
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
						"hood/legend_helmet_padded_cap"
					],
					[
						1,
						"hood/legend_helmet_chain_scarf"
					],
					[
						1,
						"hood/legend_helmet_aventail"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_barb_metal_cap"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_leather_hood_barb"
					]
				],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_bull_horns"
					],
					[
						1,
						"vanity/legend_helmet_ram_horns"
					],
					[
						1,
						"vanity/legend_helmet_ponytail"
					],
					[
						1,
						"vanity/legend_helmet_bear_head"
					],
					[
						10,
						""
					]
				]
			}
		]
	},
	{
		ID = "barbarians/unhold_helmet_heavy",
		Script = "scripts/items/legend_helmets/helmets/legend_unhold_helmet_heavy",
		Sets = []
	},
	{
		ID = "barbarians/unhold_helmet_light",
		Script = "scripts/items/legend_helmets/helmets/legend_unhold_helmet_light",
		Sets = []
	}
]);

