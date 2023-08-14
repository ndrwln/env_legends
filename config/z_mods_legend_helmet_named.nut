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
		ID = "named/death_jesters_helm",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_heavy_plate_helm_named"
					]
				],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_jester_hat"
					]
				]
			}
		]
	},
	{
		ID = "named/gold_and_black_turban",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_southern_niqaab"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_southern_named_conic"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "named/golden_feathers_helmet",
		Script = "",
		SScript = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_tailed_conic"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "named/heraldic_mail_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_chain_hood"
					],
					[
						1,
						"hood/legend_helmet_chain_hood_full"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_faceplate_raised"
					]
				],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_side_feather"
					],
					[
						1,
						"vanity/legend_helmet_top_feather"
					],
					[
						1,
						"vanity_lower/legend_helmet_back_crest"
					],
					[
						1,
						"vanity_lower/legend_helmet_top_plume"
					]
				]
			}
		]
	},
	{
		ID = "named/jugglers_hat",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_padded_cap"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_jester_hat"
					]
				]
			}
		]
	},
	{
		ID = "named/jugglers_padded_hat",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_padded_hood"
					],
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_jester_hat"
					]
				]
			}
		]
	},
	{
		ID = "named/legend_frogmouth_helm_crested_painted",
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
						"hood/legend_helmet_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_legend_frogmouth_close"
					]
				],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_side_feather"
					],
					[
						1,
						"vanity/legend_helmet_top_feather"
					],
					[
						1,
						"vanity_lower/legend_helmet_back_crest"
					],
					[
						1,
						"vanity_lower/legend_helmet_top_plume"
					]
				]
			}
		]
	},
	{
		ID = "named/legend_frogmouth_helm_decorated",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						4,
						"hood/legend_helmet_leather_hood"
					],
					[
						5,
						"hood/legend_helmet_padded_hood"
					],
					[
						1,
						"hood/legend_helmet_chain_scarf"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_legend_frogmouth_close"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "named/legend_mountain_helmet_named",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_chain_scarf"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_great_helm"
					]
				],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_mountain_helm"
					]
				]
			}
		]
	},
	{
		ID = "named/legend_named_warlock_hood",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_chain_hood"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_warlock_skull"
					]
				],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_warlock_hood"
					]
				]
			}
		]
	},
	{
		ID = "named/lindwurm_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_chain_scarf"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_great_helm"
					]
				],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_lindwurm_helm"
					]
				]
			}
		]
	},
	{
		ID = "named/named_conic_helmet_with_faceguard",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_crude_skull_helm"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_facemask"
					]
				],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_headband"
					],
					[
						1,
						"vanity/legend_helmet_plait"
					]
				]
			}
		]
	},
	{
		ID = "named/named_metal_bull_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_bronze_chain"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_heavy_plate_helm_named"
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
		ID = "named/named_metal_nose_horn_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_heavy_spiked_helm"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "named/named_metal_skull_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						2,
						"hood/legend_helmet_barb_chain_scarf"
					],
					[
						2,
						"hood/legend_helmet_chain_scarf"
					],
					[
						1,
						"hood/legend_helmet_bronze_chain"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_crude_skull_helm"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "named/named_nordic_helmet_with_closed_mail",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						2,
						"hood/legend_helmet_chain_scarf"
					],
					[
						6,
						"hood/legend_helmet_chain_hood"
					],
					[
						2,
						"hood/legend_helmet_chain_hood_full"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_nordic_helm"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "named/named_steppe_helmet_with_mail",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_tailed_conic"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "named/nasal_feather_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_tailed_conic"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "named/norse_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_viking_helm"
					]
				],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_antler"
					],
					[
						1,
						"vanity/legend_helmet_beret"
					],
					[
						1,
						"vanity/legend_helmet_bull_horns"
					],
					[
						1,
						"vanity/legend_helmet_feather_band"
					],
					[
						1,
						"vanity/legend_helmet_feathered_hat"
					],
					[
						1,
						"vanity/legend_helmet_headband"
					],
					[
						1,
						"vanity/legend_helmet_plait"
					],
					[
						1,
						"vanity/legend_helmet_ponytail"
					]
				]
			}
		]
	},
	{
		ID = "named/red_and_gold_band_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_tailed_conic"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "named/sallet_green_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_sallet"
					]
				],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_headband"
					],
					[
						1,
						"vanity/legend_helmet_plait"
					]
				]
			}
		]
	},
	{
		ID = "named/witchhunter_helm",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_padded_hood"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_witchhunter_helm"
					]
				]
			}
		]
	},
	{
		ID = "named/wolf_helmet",
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
						"hood/legend_helmet_chain_hood"
					],
					[
						1,
						"hood/legend_helmet_chain_hood_full"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_wallace_sallet_named"
					]
				],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_wolf_helm"
					]
				]
			}
		]
	},
	{
		ID = "named/wallace_sallet_named",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_padded_hood"
					],
					[
						1,
						"hood/legend_helmet_chain_hood_full"
					],
					[
						1,
						"hood/legend_helmet_southern_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_wallace_sallet_named"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_wallace_sallet_visor_named"
					]
				],
				Vanity = [
					[
						10,
						""
					],
					[
						1,
						"vanity/legend_helmet_noble_feather"
					],
					[
						1,
						"vanity/legend_helmet_side_feather"
					],
					[
						1,
						"vanity/legend_helmet_plait"
					],
					[
						1,
						"vanity/legend_helmet_noble_feather"
					],
					[
						1,
						"vanity/legend_helmet_top_feather"
					]
				]
			}
		]
	},
	{
		ID = "named/kettle_helm_named",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_padded_hood"
					],
					[
						1,
						"hood/legend_helmet_chain_hood_full"
					],
					[
						1,
						"hood/legend_helmet_southern_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_kettle_helm_named"
					]
				],
				Tops = [],
				Vanity = [
					[
						10,
						""
					],
					[
						1,
						"vanity/legend_helmet_noble_feather"
					],
					[
						1,
						"vanity/legend_helmet_side_feather"
					],
					[
						1,
						"vanity/legend_helmet_plait"
					],
					[
						1,
						"vanity/legend_helmet_noble_feather"
					],
					[
						1,
						"vanity/legend_helmet_top_feather"
					]
				]
			}
		]
	},
	{
		ID = "named/bascinet_named",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_aventail"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_bascinet_named"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_bascinet_visor_named"
					]
				],
				Vanity = [
					[
						10,
						""
					],
					[
						1,
						"vanity/legend_helmet_noble_feather"
					],
					[
						1,
						"vanity/legend_helmet_side_feather"
					],
					[
						1,
						"vanity/legend_helmet_plait"
					],
					[
						1,
						"vanity/legend_helmet_noble_feather"
					],
					[
						1,
						"vanity/legend_helmet_top_feather"
					]
				]
			}
		]
	},
	{
		ID = "named/barbute_named",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_padded_hood"
					],
					[
						1,
						"hood/legend_helmet_chain_hood_full"
					],
					[
						1,
						"hood/legend_helmet_southern_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_barbute_named"
					]
				],
				Tops = [],
				Vanity = [
					[
						10,
						""
					],
					[
						1,
						"vanity/legend_helmet_noble_feather"
					],
					[
						1,
						"vanity/legend_helmet_side_feather"
					],
					[
						1,
						"vanity/legend_helmet_plait"
					],
					[
						1,
						"vanity/legend_helmet_noble_feather"
					],
					[
						1,
						"vanity/legend_helmet_top_feather"
					]
				]
			}
		]
	},
	{
		ID = "named/italo_norman_helm_named",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_padded_hood"
					],
					[
						1,
						"hood/legend_helmet_chain_hood_full"
					],
					[
						1,
						"hood/legend_helmet_southern_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_italo_norman_helm_named"
					]
				],
				Tops = [],
				Vanity = [
					[
						10,
						""
					],
					[
						1,
						"vanity/legend_helmet_noble_feather"
					],
					[
						1,
						"vanity/legend_helmet_side_feather"
					],
					[
						1,
						"vanity/legend_helmet_plait"
					],
					[
						1,
						"vanity/legend_helmet_noble_feather"
					],
					[
						1,
						"vanity/legend_helmet_top_feather"
					]
				]
			}
		]
	},
	{
		ID = "named/deep_sallet_named",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_padded_hood"
					],
					[
						1,
						"hood/legend_helmet_chain_hood_full"
					],
					[
						1,
						"hood/legend_helmet_southern_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_deep_sallet_named"
					]
				],
				Tops = [],
				Vanity = [
					[
						10,
						""
					],
					[
						1,
						"vanity/legend_helmet_noble_feather"
					],
					[
						1,
						"vanity/legend_helmet_side_feather"
					],
					[
						1,
						"vanity/legend_helmet_plait"
					],
					[
						1,
						"vanity/legend_helmet_noble_feather"
					],
					[
						1,
						"vanity/legend_helmet_top_feather"
					]
				]
			}
		]
	},
	{
		ID = "named/named_helm_with_lion_pelt",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_padded_hood"
					],
					[
						1,
						"hood/legend_helmet_chain_hood_full"
					],
					[
						1,
						"hood/legend_helmet_southern_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_deep_sallet_named"
					],
					[
						1,
						"helm/legend_helmet_italo_norman_helm_named"
					],
					[
						1,
						"helm/legend_helmet_barbute_named"
					],
					[
						1,
						"helm/legend_helmet_bascinet_named"
					]
				],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_lion_pelt"
					]
				]
			}
		]
	},
	{
		ID = "named/legend_helm_full_named",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_great_helm"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_faceplate_full_gold"
					]
				],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_noble_feather"
					],
					[
						1,
						"vanity/legend_helmet_noble_buckle"
					],
					[
						3,
						""
					]
				]
			}
		]
	},
	{
		ID = "named/legend_helm_stag_named",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_chain_hood"
					],
					[
						1,
						"hood/legend_helmet_chain_hood_full"
					],
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_swan_helm"
					]
				],
				Tops = [
					[
						5,
						""
					],
					[
						5,
						"top/legend_helmet_faceplate_long"
					],
					[
						3,
						"top/legend_helmet_faceplate_snub_nose"
					],
					[
						3,
						"top/legend_helmet_faceplate_snub_slit"
					],
					[
						1,
						"top/legend_helmet_faceplate_full_gold"
					],
					[
						3,
						"top/legend_helmet_faceplate_full_breaths"
					],
					[
						2,
						"top/legend_helmet_faceplate_flat"
					],
					[
						2,
						"top/legend_helmet_faceplate_curved"
					],
					[
						2,
						"top/legend_helmet_faceplate_curved"
					],
					[
						1,
						"top/legend_helmet_faceplate_gold"
					],
					[
						3,
						"top/legend_helmet_southern_faceplate"
					],
					[
						1,
						"top/legend_helmet_facemask"
					],
					[
						1,
						"top/legend_helmet_nose_plate"
					],
					[
						1,
						"top/legend_helmet_goblin_gillie"
					]
				],
				Vanity = [
					[
						5,
						""
					],
					[
						3,
						"vanity/legend_helmet_faction_helmet"
					],
					[
						1,
						"vanity/legend_helmet_goat_horns"
					],
					[
						1,
						"vanity/legend_helmet_bull_horns"
					],
					[
						5,
						"vanity/legend_helmet_plait"
					],
					[
						1,
						"vanity/legend_helmet_ram_horns"
					],
					[
						1,
						"vanity/legend_helmet_antler"
					],
					[
						1,
						"vanity/legend_helmet_horn_decorations"
					]
				]
			}
		]
	},
	{
		ID = "named/legend_helm_swan_named",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_chain_hood"
					],
					[
						1,
						"hood/legend_helmet_chain_hood_full"
					],
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_swan_helm"
					]
				],
				Tops = [
					[
						3,
						""
					],
					[
						5,
						"top/legend_helmet_faceplate_winged"
					],
					[
						3,
						"top/legend_helmet_faceplate_long"
					],
					[
						3,
						"top/legend_helmet_faceplate_full"
					],
					[
						1,
						"top/legend_helmet_faceplate_gold"
					],
					[
						3,
						"top/legend_helmet_faceplate_full_breaths"
					],
					[
						1,
						"top/legend_helmet_faceplate_full_gold"
					],
					[
						2,
						"top/legend_helmet_faceplate_pointed"
					],
					[
						3,
						"top/legend_helmet_faceplate_pointed_slit"
					],
					[
						3,
						"top/legend_helmet_facemask"
					],
					[
						3,
						"top/legend_helmet_nose_plate"
					],
					[
						1,
						"top/legend_helmet_goblin_gillie"
					]
				],
				Vanity = [
					[
						5,
						""
					],
					[
						3,
						"vanity/legend_faction_helmet"
					],
					[
						1,
						"vanity/legend_helmet_wreath"
					],
					[
						5,
						"vanity/legend_helmet_plait"
					],
					[
						3,
						"vanity/legend_helmet_feather_band"
					],
					[
						2,
						"vanity/legend_helmet_metal_bird"
					],
					[
						1,
						"vanity/legend_helmet_crown"
					]
				]
			}
		]
	}
]);

