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
		ID = "mercenary_archer_helmet_00",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_leather_hood"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "mercenary_infantry_helmet_00",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_simple_hood",
						1
					],
					[
						1,
						"hood/legend_helmet_leather_cap"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_sallet",
						1
					],
					[
						1,
						"helm/legend_helmet_sallet",
						2
					],
					[
						1,
						"helm/legend_helmet_norman_helm",
						1
					],
					[
						1,
						"helm/legend_helmet_flat_top_helm_low",
						1
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "mercenary_infantry_helmet_01",
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
						"top/legend_helmet_hood_cloth_round",
						1
					],
					[
						1,
						"top/legend_helmet_hood_cloth_wide",
						1
					],
					[
						1,
						"top/legend_helmet_hood_cloth_wide",
						2
					],
					[
						1,
						"top/legend_helmet_cloth_long_hood",
						3
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "mercenary_crossbow_helmet_00",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_padded_hood",
						1
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_basinet",
						1
					],
					[
						1,
						"helm/legend_helmet_norman_helm",
						1
					],
					[
						1,
						"helm/legend_helmet_sallet",
						1
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "mercenary_crossbow_helmet_01",
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
						"helm/legend_helmet_norman_helm",
						1
					],
					[
						1,
						"helm/legend_helmet_sallet",
						1
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "mercenary_crossbow_helmet_02",
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
						"top/legend_helmet_nose_plate"
					],
					[
						1,
						"top/legend_helmet_headband_side"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "mercenary_spearman_helmet_00",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_padded_hood",
						1
					]
				],
				Helms = [
					[
						4,
						"helm/legend_helmet_kettle_helm_low",
						1
					],
					[
						1,
						"helm/legend_helmet_kettle_helm_med",
						1
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
						"vanity/legend_helmet_plait"
					]
				]
			}
		]
	},
	{
		ID = "mercenary_spearman_helmet_01",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_padded_hood",
						1
					]
				],
				Helms = [
					[
						2,
						"helm/legend_helmet_norman_helm",
						1
					],
					[
						1,
						"helm/legend_helmet_sallet",
						1
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_faceplate_winged"
					],
					[
						1,
						"top/legend_helmet_faceplate_snub_nose"
					],
					[
						1,
						"top/legend_helmet_faceplate_short"
					],
					[
						1,
						"top/legend_helmet_faceplate_full"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "mercenary_leader_helmet_uncommon_00",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_chain_hood_full"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_italo_norman_helm"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_headband_side"
					]
				],
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
		ID = "mercenary_leader_helmet_00",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_chain_hood_full"
					],
					[
						1,
						"hood/legend_helmet_padded_hood",
						1
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_barbute",
						2
					],
					[
						1,
						"helm/legend_helmet_barbute",
						6
					],
					[
						1,
						"helm/legend_helmet_barbute",
						7
					],
					[
						1,
						"helm/legend_helmet_nordic_helm_low",
						1
					],
					[
						1,
						"helm/legend_helmet_nordic_helm",
						1
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_faceplate_snub_nose"
					],
					[
						1,
						"top/legend_helmet_facemask",
						1
					],
					[
						1,
						"top/legend_helmet_facemask",
						2
					]
				],
				Vanity = [
					[
						3,
						""
					],
					[
						1,
						"vanity/legend_helmet_plait"
					],
					[
						1,
						"vanity/legend_helmet_lion_pelt"
					],
					[
						1,
						"vanity_lower/legend_helmet_knotted_tail"
					],
					[
						1,
						"vanity_lower/legend_helmet_orc_tail"
					]
				]
			}
		]
	},
	{
		ID = "mercenary_leader_helmet_gilded_00",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_chain_hood_full"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_barbute",
						3
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_faceplate_full_01_named"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "mercenary_billman_helmet_00",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_chain_hood_full"
					],
					[
						1,
						"hood/legend_helmet_padded_hood",
						1
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_barbute",
						7
					],
					[
						1,
						"helm/legend_helmet_norman_helm",
						1
					],
					[
						1,
						"helm/legend_helmet_flat_top_helm_low",
						1
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
						"vanity/legend_helmet_plait"
					]
				]
			}
		]
	},
	{
		ID = "mercenary_longbow_helmet_00",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_simple_hood"
					],
					[
						1,
						"hood/legend_helmet_leather_cap"
					]
				],
				Helms = [
					[
						2,
						"helm/legend_helmet_norman_helm",
						1
					],
					[
						1,
						"helm/legend_helmet_sallet",
						1
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
						"vanity/legend_helmet_headband"
					],
					[
						1,
						"vanity/legend_helmet_southern_patterned_headband"
					],
					[
						1,
						"vanity/legend_helmet_southern_patterned_headwrap"
					]
				]
			}
		]
	}
]);

