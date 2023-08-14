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
		ID = "ancient/ancient_gladiator_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_leather_cap"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_legend_ancient_gladiator"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "ancient/legend_mummy_bandages",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_mummy_bandage"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_mummy_beard"
					],
					[
						1,
						""
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "ancient/legend_mummy_crown",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_mummy_bandage"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_mummy_mask"
					],
					[
						1,
						""
					]
				],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_mummy_crown"
					]
				]
			}
		]
	},
	{
		ID = "ancient/legend_mummy_crown_king",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_mummy_bandage"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_mummy_beard"
					],
					[
						1,
						""
					]
				],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_mummy_crown_king"
					]
				]
			}
		]
	},
	{
		ID = "ancient/legend_mummy_headband",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_mummy_bandage"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_mummy_headband"
					]
				]
			}
		]
	},
	{
		ID = "ancient/legend_mummy_beard",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_mummy_bandage"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_mummy_beard"
					]
				],
				Vanity = [
					[
						1,
						""
					],
					[
						1,
						"vanity/legend_helmet_mummy_headband"
					]
				]
			}
		]
	},
	{
		ID = "ancient/ancient_honorguard_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_leather_cap"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_ancient_conic_helm"
					],
					[
						1,
						"helm/legend_helmet_ancient_kettle"
					],
					[
						1,
						"helm/legend_helmet_ancient_dome"
					],
					[
						1,
						"helm/legend_helmet_ancient_crested"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_ancient_beard_mask"
					],
					[
						1,
						"top/legend_helmet_ancient_lion_mask"
					],
					[
						1,
						"top/legend_helmet_ancient_mask"
					]
				],
				Vanity = []
			},
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_rotten_chain_scarf"
					],
					[
						1,
						"hood/legend_helmet_barb_chain_scarf"
					],
					[
						1,
						"hood/legend_helmet_leather_cap"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_ancient_face_helm"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "ancient/ancient_household_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_leather_cap"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_ancient_conic_helm"
					],
					[
						1,
						"helm/legend_helmet_ancient_kettle"
					],
					[
						1,
						"helm/legend_helmet_ancient_dome"
					],
					[
						1,
						"helm/legend_helmet_ancient_crested"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "ancient/ancient_laurels",
		Script = "scripts/items/legend_helmets/helmets/legend_ancient_laurels",
		Sets = []
	},
	{
		ID = "ancient/ancient_legionary_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_leather_cap"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_ancient_dome_tailed"
					],
					[
						1,
						"helm/legend_helmet_ancient_face_plate"
					],
					[
						1,
						"helm/legend_helmet_ancient_legionaire"
					],
					[
						1,
						"helm/legend_helmet_ancient_side_hawk"
					],
					[
						1,
						"helm/legend_helmet_ancient_tailed_conic_helm"
					]
				],
				Tops = [],
				Vanity = [
					[
						1,
						"helm/legend_helmet_wreath"
					]
				]
			}
		]
	},
	{
		ID = "ancient/ancient_priest_diadem",
		Script = "scripts/items/legend_helmets/helmets/legend_ancient_priest_diadem",
		Sets = []
	},
	{
		ID = "ancient/legend_ancient_legionary_helmet_restored",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_leather_cap"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_legend_ancient_legionaire_restored"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "ancient/ancient_wig",
		Script = "scripts/items/legend_helmets/helmets/legend_ancient_wig",
		Sets = []
	},
	{
		ID = "ancient/ancient_lich_headpiece",
		Script = "scripts/items/legend_helmets/helmets/legend_ancient_lich_headpiece",
		Sets = []
	}
]);

