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
		ID = "aketon_cap",
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
				Vanity = []
			}
		]
	},
	{
		ID = "barbute_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_padded_cap"
					],
					[
						1,
						"hood/legend_helmet_leather_hood"
					],
					[
						1,
						"hood/legend_helmet_padded_hood"
					],
					[
						3,
						"hood/legend_helmet_open_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_barbute"
					]
				],
				Tops = [],
				Vanity = [
					[
						5,
						""
					],
					[
						1,
						"vanity/legend_helmet_feather_band"
					],
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
		ID = "theamson_barbute_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_enclave_bevor"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_barbute"
					]
				],
				Tops = [],
				Vanity = [
					[
						5,
						""
					],
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
		ID = "bascinet_with_mail",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_open_chain_hood"
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
						"helm/legend_helmet_basinet"
					]
				],
				Tops = [],
				Vanity = [
					[
						5,
						""
					],
					[
						2,
						"vanity/legend_helmet_plait"
					]
				]
			}
		]
	},
	{
		ID = "closed_flat_top_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						2,
						"hood/legend_helmet_simple_hood"
					],
					[
						2,
						"hood/legend_helmet_padded_cap"
					],
					[
						1,
						"hood/legend_helmet_leather_hood"
					],
					[
						1,
						"hood/legend_helmet_padded_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_flat_top_helm_low"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_faceplate_flat"
					]
				],
				Vanity = [
					[
						5,
						""
					],
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
		ID = "closed_flat_top_with_neckguard",
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
						"hood/legend_helmet_padded_cap"
					],
					[
						2,
						"hood/legend_helmet_leather_hood"
					],
					[
						2,
						"hood/legend_helmet_padded_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_flat_top_helm"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_faceplate_flat"
					]
				],
				Vanity = [
					[
						5,
						""
					],
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
		ID = "closed_flat_top_with_mail",
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
				Helms = [
					[
						1,
						"helm/legend_helmet_flat_top_helm_polished"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_faceplate_flat"
					]
				],
				Vanity = [
					[
						5,
						""
					],
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
		ID = "closed_mail_coif",
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
						"top/legend_helmet_chain_attachment"
					]
				],
				Vanity = [
					[
						5,
						""
					],
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
		ID = "conic_helmet_with_closed_mail",
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
						"hood/legend_helmet_southern_chain_hood"
					],
					[
						1,
						"hood/legend_helmet_chain_hood_full"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_conic_helm"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_eyemask"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "conic_helmet_with_faceguard",
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
						"hood/legend_helmet_southern_chain_hood"
					],
					[
						1,
						"hood/legend_helmet_chain_hood_full"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_conic_helm"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_facemask"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "cultist_hood",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_scarf"
					],
					[
						1,
						"hood/legend_helmet_cloth_cap"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_sack"
					]
				]
			}
		]
	},
	{
		ID = "cultist_leather_hood",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_scarf"
					],
					[
						1,
						"hood/legend_helmet_cloth_cap"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_cult_hood"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "dark_cowl",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_cap"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_hood_cloth_round"
					],
					[
						1,
						"top/legend_helmet_hood_cloth_wide"
					],
					[
						1,
						"top/legend_helmet_hood_cloth_square"
					],
					[
						1,
						"top/legend_helmet_cloth_long_hood"
					]
				],
				Vanity = [
					[
						1,
						""
					],
					[
						1,
						"vanity/legend_helmet_wizard_cowl"
					]
				]
			}
		]
	},
	{
		ID = "decayed_closed_flat_top_with_mail",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						3,
						"hood/legend_helmet_rotten_chain_scarf"
					],
					[
						1,
						"hood/legend_helmet_barb_chain_scarf"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_rotten_flat_top_face_mask"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_hood_cloth_round"
					],
					[
						1,
						"top/legend_helmet_hood_cloth_wide"
					],
					[
						1,
						"top/legend_helmet_hood_cloth_square"
					],
					[
						1,
						"top/legend_helmet_cloth_long_hood"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "decayed_closed_flat_top_with_sack",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						3,
						"hood/legend_helmet_rotten_chain_scarf"
					],
					[
						1,
						"hood/legend_helmet_barb_chain_scarf"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_rotten_flat_top_face_mask"
					]
				],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_sack"
					]
				]
			}
		]
	},
	{
		ID = "decayed_full_helm",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_rotten_chain_scarf"
					],
					[
						1,
						"hood/legend_helmet_rusty_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_rotten_great_helm"
					]
				],
				Tops = [
					[
						4,
						""
					],
					[
						1,
						"top/legend_helmet_hood_cloth_round"
					],
					[
						1,
						"top/legend_helmet_hood_cloth_wide"
					],
					[
						1,
						"top/legend_helmet_hood_cloth_square"
					],
					[
						1,
						"top/legend_helmet_cloth_long_hood"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "decayed_great_helm",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_rotten_chain_scarf"
					],
					[
						1,
						"hood/legend_helmet_rusty_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_rotten_flat_top_face_mask"
					],
					[
						1,
						"helm/legend_helmet_rotten_great_helm"
					]
				],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_faction_decayed_helmet"
					]
				]
			}
		]
	},
	{
		ID = "dented_nasal_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_leather_hood"
					],
					[
						1,
						"hood/legend_helmet_padded_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_norman_helm"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "faction_helm",
		Script = "scripts/items/legend_helmets/helmets/legend_faction_helmet",
		Sets = [
			{
				Hoods = [],
				Helms = [],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "feathered_hat",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_cap"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_feathered_hat"
					]
				]
			}
		]
	},
	{
		ID = "flat_top_helmet",
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
						"hood/legend_helmet_padded_cap"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_flat_top_helm_low"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "flat_top_with_mail",
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
				Helms = [
					[
						1,
						"helm/legend_helmet_flat_top_helm_polished"
					]
				],
				Tops = [],
				Vanity = [
					[
						5,
						""
					],
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
		ID = "flat_top_with_closed_mail",
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
						"helm/legend_helmet_flat_top_helm_polished"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_chain_attachment"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "full_aketon_cap",
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
				Vanity = []
			}
		]
	},
	{
		ID = "full_helm",
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
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "legend_helm_wings",
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
						"top/legend_helmet_faceplate_winged"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "legend_helm_snub",
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
						3,
						"top/legend_helmet_faceplate_snub_nose"
					],
					[
						1,
						"top/legend_helmet_faceplate_snub_slit"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "legend_helm_short",
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
						"top/legend_helmet_faceplate_short"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "legend_helm_point",
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
						"top/legend_helmet_faceplate_pointed"
					],
					[
						1,
						"top/legend_helmet_faceplate_pointed_slit"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "legend_helm_full",
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
						"top/legend_helmet_faceplate_full"
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
						1,
						""
					]
				]
			}
		]
	},
	{
		ID = "legend_helm_curved",
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
						"top/legend_helmet_faceplate_curved"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "legend_helm_breathed",
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
						"top/legend_helmet_faceplate_full_breaths"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "legend_helm_bearded",
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
						"top/legend_helmet_southern_faceplate_bearded"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "full_leather_cap",
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
		ID = "greatsword_faction_helm",
		Script = "scripts/items/legend_helmets/helmets/legend_greatsword_faction_helmet",
		Sets = []
	},
	{
		ID = "greatsword_hat",
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
						"vanity/legend_helmet_fencerhat"
					]
				]
			}
		]
	},
	{
		ID = "headscarf",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_scarf"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "hood",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_simple_hood"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "hunters_hat",
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
						"hood/legend_helmet_patched_hood"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_hunter_cap"
					]
				]
			}
		]
	},
	{
		ID = "jesters_hat",
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
						"hood/legend_helmet_cloth_scarf"
					],
					[
						1,
						"hood/legend_helmet_cloth_bandana"
					],
					[
						1,
						"hood/legend_helmet_patched_hood"
					],
					[
						1,
						"hood/legend_helmet_simple_hood"
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
		ID = "kettle_hat_with_closed_mail",
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
				Helms = [
					[
						1,
						"helm/legend_helmet_enclave_kettle"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_chain_attachment"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "kettle_hat_with_mail",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_aventail"
					],
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					],
					[
						3,
						"hood/legend_helmet_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_kettle_helm_high"
					]
				],
				Tops = [
					[
						1,
						""
					],
					[
						1,
						"top/legend_helmet_chain_attachment"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "kettle_hat",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_patched_hood"
					],
					[
						1,
						"hood/legend_helmet_simple_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_kettle_helm_low"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "legend_frogmouth_helm_crested",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					],
					[
						1,
						"hood/legend_helmet_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_legend_armet"
					],
					[
						1,
						"helm/legend_helmet_legend_frogmouth"
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
					]
				]
			}
		]
	},
	{
		ID = "legend_frogmouth_helm",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					],
					[
						1,
						"hood/legend_helmet_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_legend_armet"
					],
					[
						1,
						"helm/legend_helmet_legend_frogmouth"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "legend_nun_habit",
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
						"hood/legend_helmet_cloth_bandana"
					],
					[
						1,
						"hood/legend_helmet_patched_hood"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_nun_habit"
					]
				]
			}
		]
	},
	{
		ID = "legend_seer_hat",
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
						"hood/legend_helmet_cloth_scarf"
					],
					[
						1,
						"hood/legend_helmet_cloth_bandana"
					],
					[
						1,
						"hood/legend_helmet_patched_hood"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_wizard_cowl"
					]
				]
			}
		]
	},
	{
		ID = "legend_vampire_lord_helmet",
		Script = "scripts/items/helmets/legend_vampire_lord_helmet",
		Sets = [
			{
				Hoods = [],
				Helms = [],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "legend_warlock_hood",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_scarf"
					],
					[
						1,
						"hood/legend_helmet_cloth_cap"
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
		ID = "magician_hat",
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
						"vanity/legend_helmet_wizard_cowl"
					]
				]
			}
		]
	},
	{
		ID = "mail_coif",
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
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "mouth_piece",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_scarf"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "nasal_helmet_with_closed_mail",
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
				Helms = [
					[
						1,
						"helm/legend_helmet_italo_norman_helm"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "nasal_helmet_with_mail",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					],
					[
						4,
						"hood/legend_helmet_chain_hood"
					],
					[
						4,
						"hood/legend_helmet_chain_hood_full"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_norman_helm"
					]
				],
				Tops = [
					[
						1,
						""
					],
					[
						1,
						"top/legend_helmet_chain_attachment"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "nasal_helmet_with_rusty_mail",
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
						3,
						"hood/legend_helmet_rusty_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_norman_helm"
					]
				],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_headband"
					]
				]
			}
		]
	},
	{
		ID = "nasal_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_patched_hood"
					],
					[
						1,
						"hood/legend_helmet_simple_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_norman_helm"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "necromancer_hat",
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
						"hood/legend_helmet_cloth_bandana"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_hood_cloth_round"
					],
					[
						1,
						"top/legend_helmet_hood_cloth_wide"
					],
					[
						1,
						"top/legend_helmet_hood_cloth_square"
					],
					[
						1,
						"top/legend_helmet_cloth_long_hood"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "noble_arrow_helm",
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
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_faction_helmet",
						2
					]
				]
			}
		]
	},
	{
		ID = "noble_bull_helm",
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
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_faction_helmet",
						3
					]
				]
			}
		]
	},
	{
		ID = "noble_castle_helm",
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
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_faction_helmet",
						1
					]
				]
			}
		]
	},
	{
		ID = "noble_deer_helm",
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
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_faction_helmet",
						8
					]
				]
			}
		]
	},
	{
		ID = "noble_dragon_helm",
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
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_faction_helmet",
						10
					]
				]
			}
		]
	},
	{
		ID = "noble_feather_helm",
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
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_faction_helmet",
						5
					]
				]
			}
		]
	},
	{
		ID = "noble_fish_helm",
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
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_faction_helmet",
						7
					]
				]
			}
		]
	},
	{
		ID = "noble_headgear",
		Script = "scripts/items/helmets/noble_headgear",
		Sets = [
			{
				Hoods = [],
				Helms = [],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "noble_lion_helm",
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
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_faction_helmet",
						4
					]
				]
			}
		]
	},
	{
		ID = "noble_sun_helm",
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
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_faction_helmet",
						9
					]
				]
			}
		]
	},
	{
		ID = "noble_swan_helm",
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
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_faction_helmet",
						6
					]
				]
			}
		]
	},
	{
		ID = "nordic_helmet_with_closed_mail",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_open_chain_hood"
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
						"helm/legend_helmet_nordic_helm_high"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "nordic_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_simple_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_nordic_helm_low"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "open_leather_cap",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_leather_cap"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "padded_flat_top_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_padded_cap"
					],
					[
						1,
						"hood/legend_helmet_padded_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_flat_top_helm"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "padded_kettle_hat",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_padded_cap"
					],
					[
						1,
						"hood/legend_helmet_padded_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_kettle_helm_med"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "padded_nasal_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_padded_cap"
					],
					[
						1,
						"hood/legend_helmet_padded_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_norman_helm"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "reinforced_mail_coif",
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
						"top/legend_helmet_chain_attachment"
					],
					[
						1,
						"top/legend_helmet_nose_plate"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "rusty_mail_coif",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_rusty_chain_hood"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "sallet_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						2,
						"hood/legend_helmet_cloth_cap"
					],
					[
						1,
						"hood/legend_helmet_cloth_bandana"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_sallet"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "steppe_helmet_with_mail",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					],
					[
						1,
						"hood/legend_helmet_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_horsetail"
					]
				],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_headband"
					],
					[
						9,
						""
					]
				]
			}
		]
	},
	{
		ID = "straw_hat",
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
						"hood/legend_helmet_cloth_scarf"
					],
					[
						1,
						"hood/legend_helmet_cloth_bandana"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_straw_hat"
					]
				]
			}
		]
	},
	{
		ID = "witchhunter_hat",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_cap"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_hood_cloth_round"
					],
					[
						1,
						"top/legend_helmet_hood_cloth_wide"
					],
					[
						1,
						"top/legend_helmet_hood_cloth_square"
					],
					[
						1,
						"top/legend_helmet_cloth_long_hood"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "legend_noble_crown",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_bandana"
					],
					[
						2,
						"hood/legend_helmet_cloth_cap"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_crown"
					]
				]
			}
		]
	},
	{
		ID = "legend_noble_hood",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_bandana"
					],
					[
						2,
						"hood/legend_helmet_cloth_cap"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_noble_hood"
					]
				]
			}
		]
	},
	{
		ID = "legend_noble_hat",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_bandana"
					],
					[
						2,
						"hood/legend_helmet_cloth_cap"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_noble_hat"
					]
				]
			}
		]
	},
	{
		ID = "legend_noble_floppy_hat",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_bandana"
					],
					[
						2,
						"hood/legend_helmet_cloth_cap"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_noble_hat"
					]
				]
			}
		]
	},
	{
		ID = "legend_noble_southern_crown",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_bandana"
					],
					[
						2,
						"hood/legend_helmet_cloth_cap"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_noble_southern_crown"
					]
				]
			}
		]
	},
	{
		ID = "legend_noble_southern_hat",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_bandana"
					],
					[
						2,
						"hood/legend_helmet_cloth_cap"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_noble_southern_hat"
					]
				]
			}
		]
	},
	{
		ID = "wizard_hat",
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
						"hood/legend_helmet_cloth_bandana"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_wizard_cowl"
					]
				]
			}
		]
	},
	{
		ID = "legend_enclave_vanilla_armet_01",
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
						"helm/legend_helmet_enclave_armet"
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
						"vanity_lower/legend_helmet_back_feathers"
					]
				]
			}
		]
	},
	{
		ID = "legend_enclave_vanilla_armet_02",
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
						"helm/legend_helmet_enclave_armet"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_enclave_armet_visor"
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
						"vanity_lower/legend_helmet_back_feathers"
					]
				]
			}
		]
	},
	{
		ID = "legend_enclave_vanilla_great_bascinet_01",
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
						"helm/legend_helmet_enclave_venitian_bascinet"
					]
				],
				Tops = [
					[
						2,
						""
					],
					[
						2,
						"top/legend_helmet_enclave_venitian_bascinet_visor"
					],
					[
						1,
						"top/legend_helmet_faceplate_pointed"
					],
					[
						1,
						"top/legend_helmet_faceplate_flat"
					],
					[
						1,
						"top/legend_helmet_faceplate_pointed_slit"
					],
					[
						1,
						"top/legend_helmet_faceplate_snub_nose"
					],
					[
						1,
						"top/legend_helmet_faceplate_snub_slit"
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
						"vanity_lower/legend_helmet_back_feathers"
					]
				]
			}
		]
	},
	{
		ID = "legend_enclave_vanilla_great_bascinet_02",
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
						"helm/legend_helmet_enclave_great_bascinet"
					]
				],
				Tops = [
					[
						10,
						""
					],
					[
						2,
						"top/legend_helmet_enclave_great_bascinet_visor"
					],
					[
						1,
						"top/legend_helmet_faceplate_pointed"
					],
					[
						1,
						"top/legend_helmet_faceplate_flat"
					],
					[
						1,
						"top/legend_helmet_faceplate_pointed_slit"
					],
					[
						1,
						"top/legend_helmet_faceplate_snub_nose"
					],
					[
						1,
						"top/legend_helmet_faceplate_snub_slit"
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
						"vanity_lower/legend_helmet_back_feathers"
					]
				]
			}
		]
	},
	{
		ID = "legend_enclave_vanilla_great_bascinet_03",
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
						"helm/legend_helmet_enclave_great_bascinet"
					]
				],
				Tops = [
					[
						2,
						""
					],
					[
						2,
						"top/legend_helmet_enclave_great_bascinet_visor"
					],
					[
						1,
						"top/legend_helmet_faceplate_pointed"
					],
					[
						1,
						"top/legend_helmet_faceplate_flat"
					],
					[
						1,
						"top/legend_helmet_faceplate_pointed_slit"
					],
					[
						1,
						"top/legend_helmet_faceplate_snub_nose"
					],
					[
						1,
						"top/legend_helmet_faceplate_snub_slit"
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
						"vanity_lower/legend_helmet_back_feathers"
					]
				]
			}
		]
	},
	{
		ID = "legend_enclave_vanilla_great_helm_01",
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
						"helm/legend_helmet_enclave_great_helm"
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
						"vanity_lower/legend_helmet_back_feathers"
					]
				]
			}
		]
	},
	{
		ID = "legend_enclave_vanilla_kettle_sallet_01",
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
						"helm/legend_helmet_enclave_kettle"
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
		ID = "legend_enclave_vanilla_kettle_sallet_02",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_enclave_bevor"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_enclave_kettle"
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
		ID = "legend_enclave_vanilla_kettle_sallet_03",
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
				Helms = [
					[
						1,
						"helm/legend_helmet_enclave_kettle"
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
		ID = "legend_enclave_vanilla_skullcap_01",
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
				Helms = [
					[
						1,
						"helm/legend_helmet_enclave_skullcap"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "legend_champion_butcher_helmet",
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
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_facemask"
					],
					[
						1,
						"top/legend_helmet_faceplate_flat"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "italo_norman_helm",
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
						"hood/legend_helmet_southern_open_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_italo_norman_helm"
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
		ID = "scale_helm",
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
						"helm/legend_helmet_scale_helm"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "rondel_helm",
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
						"helm/legend_helmet_rondel_helm"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "deep_sallet",
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
						"helm/legend_helmet_deep_sallet"
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
		ID = "wallace_sallet",
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
						"hood/legend_helmet_aventail"
					],
					[
						1,
						"hood/legend_helmet_southern_open_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_wallace_sallet"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_wallace_sallet_visor"
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
		ID = "red_bandit_leader_helmet",
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
						"helm/legend_helmet_barbute"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_wallace_sallet_visor"
					]
				],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_headband",
						1
					]
				]
			}
		]
	},
	{
		ID = "brown_hedgeknight_helmet",
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
						"helm/legend_helmet_nordic_helm_low"
					]
				],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_plait",
						7
					]
				]
			}
		]
	},
	{
		ID = "southern_knight_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_southern_chain_hood"
					],
					[
						1,
						"hood/legend_helmet_southern_open_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_conic_helm"
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
						"vanity/legend_helmet_southern_patterned_headwrap"
					],
					[
						1,
						"vanity/legend_helmet_southern_turban_open"
					],
					[
						1,
						"vanity/legend_helmet_southern_turban_full"
					],
					[
						1,
						"vanity/legend_helmet_southern_turban_feather"
					]
				]
			}
		]
	},
	{
		ID = "northern_mercenary_helmet_00",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_open_chain_hood"
					],
					[
						1,
						"hood/legend_helmet_rusty_chain_hood"
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
						"helm/legend_helmet_nordic_helm_low"
					],
					[
						1,
						"helm/legend_helmet_nordic_helm"
					],
					[
						1,
						"helm/legend_helmet_nordic_helm_high"
					]
				],
				Tops = [
					[
						0,
						"top/legend_helmet_facemask"
					]
				],
				Vanity = [
					[
						0,
						"vanity/legend_helmet_southern_patterned_headwrap"
					],
					[
						0,
						"vanity/legend_helmet_southern_turban_open"
					],
					[
						0,
						"vanity/legend_helmet_southern_turban_full"
					],
					[
						0,
						"vanity/legend_helmet_southern_turban_feather"
					]
				]
			}
		]
	},
	{
		ID = "traze_northern_mercenary_cap",
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
						"hood/legend_helmet_padded_cap"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_fencerhat"
					]
				]
			}
		]
	},
	{
		ID = "northern_mercenary_helmet_01",
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
				Helms = [
					[
						1,
						"helm/legend_helmet_viking_helm"
					]
				],
				Tops = [
					[
						1,
						""
					],
					[
						1,
						"top/legend_helmet_chain_attachment"
					]
				],
				Vanity = [
					[
						2,
						""
					],
					[
						1,
						"vanity/legend_helmet_antler"
					],
					[
						1,
						"vanity/legend_helmet_bull_horns"
					],
					[
						1,
						"vanity/legend_helmet_goat_horns"
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
		ID = "northern_mercenary_helmet_02",
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
				Helms = [
					[
						1,
						"helm/legend_helmet_nordic_helm"
					]
				],
				Tops = [
					[
						1,
						""
					],
					[
						1,
						"top/legend_helmet_eyemask"
					]
				],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_orc_bones"
					],
					[
						1,
						"vanity/legend_helmet_orc_great_horns"
					]
				]
			}
		]
	},
	{
		ID = "barbarian_chosen_helmet_00",
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
						"hood/legend_helmet_barb_open_chain"
					],
					[
						1,
						"hood/legend_helmet_rotten_chain_scarf"
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
						"vanity/legend_helmet_orc_bones"
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
		ID = "barbarian_chosen_helmet_01",
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
						"hood/legend_helmet_bronze_chain"
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
						"top/legend_helmet_orc_horn_mask"
					],
					[
						1,
						"top/legend_helmet_leather_hood_barb"
					],
					[
						1,
						"top/legend_helmet_orc_metal_mask"
					],
					[
						1,
						"top/legend_helmet_headband_nose"
					]
				],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_wolf_helm"
					],
					[
						1,
						"vanity/legend_helmet_lion_pelt"
					]
				]
			}
		]
	},
	{
		ID = "barbarian_chosen_helmet_02",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_scarf",
						1
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
						1,
						"top/legend_helmet_headband_side"
					]
				],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_ponytail",
						1
					],
					[
						1,
						"vanity/legend_helmet_ponytail",
						4
					]
				]
			}
		]
	},
	{
		ID = "heavy_noble_house_helmet_00",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_aventail"
					],
					[
						1,
						"hood/legend_helmet_enclave_bevor"
					],
					[
						1,
						"hood/legend_helmet_chain_hood_full"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_rondel_helm"
					],
					[
						1,
						"helm/legend_helmet_norman_helm"
					],
					[
						1,
						"helm/legend_helmet_barbute"
					],
					[
						1,
						"helm/legend_helmet_sallet"
					],
					[
						1,
						"helm/legend_helmet_deep_sallet"
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
						"top/legend_helmet_faceplate_snub_slit"
					],
					[
						1,
						"top/legend_helmet_faceplate_short"
					],
					[
						1,
						"top/legend_helmet_faceplate_full"
					],
					[
						1,
						"top/legend_helmet_faceplate_curved"
					],
					[
						1,
						"top/legend_helmet_faceplate_full_breaths"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "brown_monk_helmet_00",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_cap"
					]
				],
				Helms = [],
				Tops = [
					[
						3,
						""
					],
					[
						1,
						"top/legend_helmet_cloth_long_hood",
						3
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "dark_southern_helmet_00",
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
						"hood/legend_helmet_southern_niqaab"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_cloth_long_hood",
						4
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "white_nomad_leader_helmet_00",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_southern_open_chain_hood"
					],
					[
						1,
						"hood/legend_helmet_chain_hood"
					],
					[
						1,
						"hood/legend_helmet_chain_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_enclave_skullcap"
					],
					[
						1,
						"helm/legend_helmet_southern_conic_helm"
					]
				],
				Tops = [
					[
						1,
						""
					],
					[
						1,
						"top/legend_helmet_nose_plate"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "citrene_nomad_cutthroat_helmet_00",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_scarf"
					],
					[
						1,
						"hood/legend_helmet_southern_cap"
					],
					[
						1,
						"hood/legend_helmet_southern_cap_dark"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_headband"
					],
					[
						4,
						"vanity/legend_helmet_southern_headband"
					],
					[
						10,
						"vanity/legend_helmet_southern_patterned_headband"
					]
				]
			}
		]
	},
	{
		ID = "citrene_nomad_cutthroat_helmet_01",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_southern_open_chain_hood"
					],
					[
						1,
						"hood/legend_helmet_southern_cap"
					],
					[
						1,
						"hood/legend_helmet_southern_cap_dark"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_headband"
					],
					[
						4,
						"vanity/legend_helmet_southern_headband"
					],
					[
						10,
						"vanity/legend_helmet_southern_patterned_headband"
					]
				]
			}
		]
	},
	{
		ID = "citrene_nomad_ranged_helmet_00",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_southern_open_chain_hood"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_southern_helm_tailed"
					]
				]
			}
		]
	},
	{
		ID = "theamson_nomad_leader_helmet_heavy",
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
						"hood/legend_helmet_barb_open_chain"
					],
					[
						1,
						"hood/legend_helmet_rotten_chain_scarf"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_horsetail"
					],
					[
						1,
						"helm/legend_helmet_southern_conic_helm"
					]
				],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_southern_headband"
					]
				]
			}
		]
	},
	{
		ID = "theamson_nomad_leader_helmet_facemask",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_scarf"
					],
					[
						1,
						"helm/legend_helmet_southern_cap"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_southern_leather_helm"
					],
					[
						1,
						"helm/legend_helmet_horsetail"
					]
				],
				Tops = [],
				Vanity = [
					[
						15,
						"vanity/legend_helmet_southern_headband"
					],
					[
						4,
						"vanity/legend_helmet_southern_patterned_headband"
					]
				]
			}
		]
	},
	{
		ID = "theamson_nomad_outlaw_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_southern_open_chain_hood"
					],
					[
						2,
						"hood/legend_helmet_chain_hood"
					],
					[
						1,
						"hood/legend_helmet_southern_niqaab"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_enclave_skullcap"
					],
					[
						4,
						"helm/legend_helmet_southern_conic_helm"
					]
				],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_headband"
					],
					[
						4,
						"vanity/legend_helmet_southern_patterned_headband"
					]
				]
			}
		]
	},
	{
		ID = "great_jaw_helmet_00",
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
						"helm/legend_helmet_nordic_helm_high"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_enclave_great_jaw"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "adorned_closed_flat_top_with_mail",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_patched_hood"
					],
					[
						1,
						"hood/legend_helmet_leather_hood"
					],
					[
						1,
						"hood/legend_helmet_simple_hood"
					],
					[
						1,
						"hood/legend_helmet_padded_cap"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_flat_top_helm_low"
					],
					[
						3,
						"helm/legend_helmet_flat_top_helm"
					],
					[
						1,
						"helm/legend_helmet_flat_top_helm_polished"
					]
				],
				Tops = [
					[
						5,
						""
					],
					[
						5,
						"top/legend_helmet_faceplate_flat"
					],
					[
						3,
						"top/legend_helmet_faceplate_snub_nose"
					],
					[
						2,
						"top/legend_helmet_faceplate_snub_slit"
					],
					[
						1,
						"top/legend_helmet_faceplate_pointed"
					]
				],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_chaperon"
					]
				]
			}
		]
	},
	{
		ID = "adorned_full_helm",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_patched_hood"
					],
					[
						1,
						"hood/legend_helmet_leather_hood"
					],
					[
						1,
						"hood/legend_helmet_simple_hood"
					],
					[
						1,
						"hood/legend_helmet_padded_cap"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_full_helm"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_helm_adornment"
					]
				],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_thick_braid"
					]
				]
			}
		]
	},
	{
		ID = "adorned_full_helm_rotten",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_patched_hood"
					],
					[
						1,
						"hood/legend_helmet_leather_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_full_helm"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_helm_adornment_rotten"
					]
				],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_thick_braid_rotten"
					]
				]
			}
		]
	},
	{
		ID = "heavy_mail_coif",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_mail_coif"
					]
				],
				Helms = [],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_plait"
					]
				]
			}
		]
	},
	{
		ID = "masked_kettle_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_full_mask"
					]
				],
				Helms = [
					[
						20,
						"helm/legend_helmet_kettle_hat"
					],
					[
						3,
						"helm/legend_helmet_kettle_helm_low"
					],
					[
						2,
						"helm/legend_helmet_kettle_helm_med"
					],
					[
						1,
						"helm/legend_helmet_kettle_helm_high"
					]
				],
				Tops = [],
				Vanity = []
			}
		]
	},
	{
		ID = "physician_mask",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_full_mask"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_mask_beak"
					]
				],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_physicians_hood"
					]
				]
			}
		]
	},
	{
		ID = "undertaker_hat",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_cloth_bandana"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_undertakers_scarf"
					]
				],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_undertakers_hat"
					]
				]
			}
		]
	},
	{
		ID = "swan_helm",
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
						"vanity/legend_helmet_faction_helmet"
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
	},
	{
		ID = "stag_helm",
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
						"vanity/legend_helmet_ram_antler"
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
		ID = "lonewolf_longsword_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_padded_cap"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_enclave_kettle"
					]
				],
				Tops = [],
				Vanity = [
					[
						1,
						"vanity/legend_helmet_plait"
					]
				]
			}
		]
	},
	{
		ID = "lonewolf_hammershield_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_padded_cap"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_barbute"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_eyemask"
					],
					[
						1,
						"top/legend_helmet_faceplate_snub_nose"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "lonewolf_axebuckler_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_leather_hood"
					]
				],
				Helms = [
					[
						1,
						"helm/legend_helmet_barbute"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_faceplate_flat"
					],
					[
						1,
						"top/legend_helmet_faceplate_snub_nose"
					],
					[
						1,
						"top/legend_helmet_faceplate_snub_slit"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "lonewolf_crossbowsword_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_enclave_bevor"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_hood_cloth_round"
					],
					[
						1,
						"top/legend_helmet_hood_cloth_wide"
					],
					[
						1,
						"top/legend_helmet_hood_cloth_square"
					],
					[
						1,
						"top/legend_helmet_cloth_long_hood"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "lonewolf_bowdagger_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[
						1,
						"hood/legend_helmet_leather_hood"
					],
					[
						1,
						"hood/legend_helmet_padded_hood"
					]
				],
				Helms = [],
				Tops = [
					[
						1,
						"top/legend_helmet_hood_cloth_round"
					],
					[
						1,
						"top/legend_helmet_hood_cloth_wide"
					],
					[
						1,
						"top/legend_helmet_hood_cloth_square"
					],
					[
						1,
						"top/legend_helmet_cloth_long_hood"
					]
				],
				Vanity = []
			}
		]
	},
	{
		ID = "lonewolf_polearm_helmet",
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
						"helm/legend_helmet_basinet"
					]
				],
				Tops = [
					[
						1,
						"top/legend_helmet_facemask"
					],
					[
						1,
						"top/legend_helmet_faceplate_snub_slit"
					]
				],
				Vanity = []
			}
		]
	}
]);
gt.Const.LegendMod.Helmets <- {};

foreach( i, v in gt.Const.LegendMod.HelmObjs )
{
	gt.Const.LegendMod.Helmets[v.ID] <- v;
}

