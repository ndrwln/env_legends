local gt = this.getroottable();

if (!("LegendMod" in gt.Const))
{
	gt.Const.LegendMod <- {};
}

if (!("ArmorObjs" in gt.Const.LegendMod))
{
	gt.Const.LegendMod.ArmorObjs <- [];
}

gt.Const.LegendMod.ArmorObjs.extend([
	{
		ID = "apron",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_apron"
					]
				],
				Chain = [],
				Plate = [
					[
						12,
						""
					],
					[
						1,
						"plate/legend_armor_leather_jacket"
					],
					[
						1,
						"plate/legend_armor_leather_jacket_simple"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "basic_mail_shirt",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_thick_tunic"
					],
					[
						1,
						"cloth/legend_tunic"
					],
					[
						1,
						"cloth/legend_tunic_wrap"
					],
					[
						1,
						"cloth/legend_tunic_collar_thin"
					],
					[
						1,
						"cloth/legend_tunic_collar_deep"
					],
					[
						1,
						"cloth/legend_padded_surcoat"
					],
					[
						1,
						"cloth/legend_gambeson_plain"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_mail_shirt_simple"
					]
				],
				Plate = [],
				Cloak = [
					[
						5,
						""
					],
					[
						1,
						"cloak/tabbed_hood"
					]
				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "blotched_gambeson",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						10,
						"cloth/legend_gambeson_plain"
					],
					[
						1,
						"cloth/legend_gambeson_wolf"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "butcher_apron",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_apron_butcher"
					]
				],
				Chain = [],
				Plate = [
					[
						12,
						""
					],
					[
						1,
						"plate/legend_armor_leather_jacket"
					],
					[
						1,
						"plate/legend_armor_leather_jacket_simple"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "coat_of_plates",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson"
					],
					[
						5,
						"cloth/legend_padded_surcoat"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_reinforced_mail"
					],
					[
						1,
						"chain/legend_armor_reinforced_mail_shirt"
					]
				],
				Plate = [
					[
						0,
						"plate/legend_armor_plate_chest_rotten"
					],
					[
						1,
						"plate/legend_armor_plate_cuirass"
					],
					[
						1,
						"plate/legend_armor_plate_full"
					],
					[
						1,
						"plate/legend_armor_plate_milanese"
					],
					[
						1,
						"plate/legend_armor_plate_krastenbrust"
					],
					[
						1,
						"plate/legend_armor_plate_triangle"
					]
				],
				Cloak = [
					[
						20,
						""
					],
					[
						1,
						"cloak/legend_armor_cloak_common"
					]
				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "coat_of_scales",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson"
					],
					[
						1,
						"cloth/legend_padded_surcoat"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_reinforced_mail"
					],
					[
						1,
						"chain/legend_armor_reinforced_mail_shirt"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_scale"
					],
					[
						1,
						"plate/legend_armor_scale_coat"
					],
					[
						0,
						"plate/legend_armor_scale_coat_rotten"
					],
					[
						1,
						"plate/legend_armor_scale_shirt"
					]
				],
				Cloak = [
					[
						20,
						""
					],
					[
						1,
						"cloak/legend_armor_cloak_common"
					],
					[
						1,
						"cloak/tabbed_hood"
					],
					[
						1,
						"cloak/decorative_hood"
					]
				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "cultist_leather_robe",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_robes"
					]
				],
				Chain = [],
				Plate = [
					[
						1,
						"plate/legend_armor_cult_armor"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "decayed_coat_of_plates",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_sackcloth"
					],
					[
						1,
						"cloth/legend_sackcloth_patched"
					],
					[
						1,
						"cloth/legend_sackcloth_tattered"
					],
					[
						1,
						"cloth/legend_thick_tunic"
					],
					[
						1,
						"cloth/legend_tunic"
					],
					[
						1,
						"cloth/legend_gambeson_plain"
					],
					[
						1,
						"cloth/legend_robes"
					]
				],
				Chain = [
					[
						2,
						""
					],
					[
						1,
						"chain/legend_armor_reinforced_worn_mail"
					],
					[
						1,
						"chain/legend_armor_reinforced_worn_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_rusty_mail_shirt"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_scale_coat_rotten"
					],
					[
						1,
						"plate/legend_armor_plate_chest_rotten"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "decayed_coat_of_scales",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_sackcloth"
					],
					[
						1,
						"cloth/legend_sackcloth_patched"
					],
					[
						1,
						"cloth/legend_sackcloth_tattered"
					],
					[
						1,
						"cloth/legend_thick_tunic"
					],
					[
						1,
						"cloth/legend_tunic"
					],
					[
						1,
						"cloth/legend_gambeson_plain"
					],
					[
						1,
						"cloth/legend_robes"
					]
				],
				Chain = [
					[
						2,
						""
					],
					[
						1,
						"chain/legend_armor_reinforced_worn_mail"
					],
					[
						1,
						"chain/legend_armor_reinforced_worn_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_rusty_mail_shirt"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_scale_coat_rotten"
					],
					[
						1,
						"plate/legend_armor_plate_chest_rotten"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "decayed_reinforced_mail_hauberk",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_sackcloth"
					],
					[
						1,
						"cloth/legend_sackcloth_patched"
					],
					[
						1,
						"cloth/legend_sackcloth_tattered"
					],
					[
						1,
						"cloth/legend_thick_tunic"
					],
					[
						1,
						"cloth/legend_tunic"
					],
					[
						1,
						"cloth/legend_gambeson_plain"
					],
					[
						1,
						"cloth/legend_robes"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_reinforced_rotten_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_reinforced_worn_mail"
					],
					[
						1,
						"chain/legend_armor_reinforced_worn_mail_shirt"
					]
				],
				Plate = [
					[
						1,
						""
					],
					[
						1,
						"chain/legend_armor_hauberk_sleevless"
					],
					[
						1,
						"chain/legend_armor_hauberk"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "footman_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson"
					],
					[
						1,
						"cloth/legend_padded_surcoat"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_basic_mail"
					],
					[
						1,
						"chain/legend_armor_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_reinforced_mail"
					],
					[
						1,
						"chain/legend_armor_reinforced_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_hauberk"
					],
					[
						1,
						"chain/legend_armor_short_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_riveted_light"
					]
				],
				Cloak = [
					[
						20,
						""
					],
					[
						1,
						"cloak/legend_armor_cloak_common"
					],
					[
						1,
						"cloak/decorative_hood"
					]
				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "gambeson",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "heavy_lamellar_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson"
					],
					[
						1,
						"cloth/legend_padded_surcoat"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_basic_mail"
					],
					[
						1,
						"chain/legend_armor_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_reinforced_mail"
					],
					[
						1,
						"chain/legend_armor_reinforced_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_short_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_lamellar_harness_heavy"
					],
					[
						1,
						"plate/legend_armor_leather_lamellar_harness_reinforced"
					],
					[
						1,
						"plate/legend_armor_leather_lamellar_heavy"
					],
					[
						1,
						"plate/legend_armor_leather_lamellar_reinforced"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "heraldic_mail",
		Script = "scripts/items/legend_armor/armor/legend_armor_heraldic",
		Sets = [
			{
				Cloth = [],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "lamellar_harness",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson_plain"
					],
					[
						1,
						"cloth/legend_padded_surcoat"
					]
				],
				Chain = [
					[
						1,
						""
					],
					[
						1,
						"chain/legend_armor_basic_mail"
					],
					[
						1,
						"chain/legend_armor_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_mail_shirt_simple"
					],
					[
						1,
						"chain/legend_armor_short_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_lamellar"
					],
					[
						1,
						"plate/legend_armor_leather_lamellar_harness_heavy"
					],
					[
						1,
						"plate/legend_armor_leather_lamellar_harness_reinforced"
					],
					[
						1,
						"plate/legend_armor_leather_lamellar_heavy"
					],
					[
						1,
						"plate/legend_armor_leather_lamellar_reinforced"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "leather_lamellar",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson_plain"
					],
					[
						1,
						"cloth/legend_padded_surcoat"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_mail_shirt_simple"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_lamellar"
					],
					[
						1,
						"plate/legend_armor_leather_lamellar_reinforced"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "leather_scale_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						2,
						"cloth/legend_gambeson"
					],
					[
						1,
						"cloth/legend_padded_surcoat"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_mail_shirt_simple"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_scale"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "noble_scale_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						2,
						"cloth/legend_gambeson"
					],
					[
						1,
						"cloth/legend_padded_surcoat"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_mail_shirt_simple"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_noble_scale"
					]
				],
				Cloak = [
					[
						20,
						""
					],
					[
						1,
						"cloak/dukes_cloak"
					]
				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "leather_tunic",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_thick_tunic"
					],
					[
						1,
						"cloth/legend_tunic"
					]
				],
				Chain = [],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_jacket"
					],
					[
						1,
						"plate/legend_armor_leather_jacket_simple"
					]
				],
				Cloak = [
					[
						20,
						""
					],
					[
						1,
						"cloak/tabbed_hood"
					]
				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "leather_wraps",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_tunic"
					]
				],
				Chain = [],
				Plate = [
					[
						15,
						""
					],
					[
						1,
						"plate/legend_armor_leather_jacket"
					],
					[
						5,
						"plate/legend_armor_leather_jacket_simple"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "legend_blacksmith_apron",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_apron"
					]
				],
				Chain = [],
				Plate = [
					[
						15,
						""
					],
					[
						1,
						"plate/legend_armor_leather_jacket"
					],
					[
						5,
						"plate/legend_armor_leather_jacket_simple"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "legend_crusader_armor",
		Script = "scripts/items/legend_armor/armor/legend_armor_crusader",
		Sets = [
			{
				Cloth = [],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "legend_herbalist_robe",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_robes"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "monk_robe",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_robes"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "legend_maid_apron",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_apron"
					],
					[
						1,
						"cloth/legend_sackcloth"
					],
					[
						1,
						"cloth/legend_tunic"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "legend_maid_dress",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_peasant_dress"
					],
					[
						1,
						"cloth/legend_sackcloth"
					],
					[
						1,
						"cloth/legend_tunic"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "legend_nun_robe_dark",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_robes_nun"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "legend_nun_robe_light",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_robes_nun"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "legend_rabble_fur",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"armor/legend_armor_rabble_fur"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "legend_rabble_tunic",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_sackcloth"
					],
					[
						1,
						"cloth/legend_sackcloth_patched"
					],
					[
						1,
						"cloth/legend_sackcloth_tattered"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "legend_ranger_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"armor/legend_armor_ranger"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "legend_seer_robes",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_robes"
					],
					[
						1,
						"cloth/legend_robes_magic"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "legend_taxidermist_apron",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_apron"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "legend_vala_cloak",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"armor/legend_armor_vala_cloak"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "legend_vala_dress",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"armor/legend_armor_vala_dress"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "legend_vampire_lord_armor",
		Script = "scripts/items/armor/legend_vampire_lord_armor",
		Sets = [
			{
				Cloth = [],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "legend_warlock_cloak",
		Script = "scripts/items/armor/legend_warlock_cloak",
		Sets = [
			{
				Cloth = [],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "light_scale_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_tunic"
					]
				],
				Chain = [],
				Plate = [
					[
						1,
						"plate/legend_armor_scale"
					],
					[
						1,
						"plate/legend_armor_scale_shirt"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "linen_tunic",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_tunic"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "mail_hauberk",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson"
					],
					[
						1,
						"cloth/legend_padded_surcoat"
					]
				],
				Chain = [
					[
						1,
						""
					],
					[
						1,
						"chain/legend_armor_hauberk"
					],
					[
						1,
						"chain/legend_armor_hauberk_full"
					],
					[
						1,
						"chain/legend_armor_hauberk_sleevless"
					]
				],
				Plate = [],
				Cloak = [
					[
						10,
						""
					],
					[
						1,
						"cloak/decorative_hood"
					]
				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "mail_shirt",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_tunic"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_mail_shirt_simple"
					]
				],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "necromancer_robes",
		Script = "scripts/items/armor/necromancer_robes",
		Sets = [
			{
				Cloth = [],
				Chain = [],
				Plate = [],
				Cloak = [
					[
						1,
						"cloak/cursed_cloak"
					]
				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "noble_gear",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_tunic_noble"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [
					[
						10,
						""
					],
					[
						1,
						"cloak/legend_noble_shawl"
					]
				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "noble_mail_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_tunic_noble"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_hauberk_sleevless"
					],
					[
						1,
						"chain/legend_armor_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_short_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_noble"
					]
				],
				Cloak = [
					[
						10,
						""
					],
					[
						2,
						"cloak/legend_noble_shawl"
					],
					[
						1,
						"cloak/legend_sash"
					]
				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "noble_tunic",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_tunic_noble"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [
					[
						10,
						""
					],
					[
						1,
						"cloak/legend_noble_shawl"
					]
				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "padded_leather",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_apron"
					],
					[
						1,
						"cloth/legend_dark_tunic"
					],
					[
						1,
						"cloth/legend_padded_surcoat"
					],
					[
						1,
						"cloth/legend_thick_tunic"
					]
				],
				Chain = [],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_padded"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "padded_surcoat",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_padded_surcoat"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [
					[
						10,
						""
					],
					[
						1,
						"cloak/decorative_hood"
					]
				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "patched_mail_shirt",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson_plain"
					],
					[
						1,
						"cloth/legend_gambeson_wolf"
					],
					[
						1,
						"cloth/legend_padded_surcoat"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_mail_shirt_simple"
					],
					[
						1,
						"chain/legend_armor_reinforced_rotten_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_rusty_mail_shirt"
					]
				],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "ragged_dark_surcoat",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_dark_tunic"
					],
					[
						1,
						"cloth/legend_thick_tunic"
					]
				],
				Chain = [],
				Plate = [
					[
						10,
						""
					],
					[
						3,
						"plate/legend_animal_hide_armor"
					],
					[
						3,
						"plate/legend_armor_leather_jacket"
					]
				],
				Cloak = [
					[
						10,
						""
					],
					[
						1,
						"cloak/tabbed_hood"
					],
					[
						1,
						"cloak/legend_dark_wooly_cloak"
					],
					[
						1,
						"cloak/fur_cloak"
					]
				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "ragged_surcoat",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_tunic"
					]
				],
				Chain = [
					[
						2,
						""
					],
					[
						1,
						"chain/legend_armor_rusty_mail_shirt"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_jacket"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "reinforced_mail_hauberk",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson_plain"
					],
					[
						1,
						"cloth/legend_padded_surcoat"
					]
				],
				Chain = [
					[
						4,
						"chain/legend_armor_hauberk"
					],
					[
						1,
						"chain/legend_armor_hauberk_full"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_brigandine"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "adorned_warriors_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson_plain"
					],
					[
						1,
						"cloth/legend_padded_surcoat"
					]
				],
				Chain = [
					[
						4,
						"chain/legend_armor_hauberk"
					],
					[
						1,
						"chain/legend_armor_hauberk_full"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_riveted"
					],
					[
						1,
						"plate/legend_armor_leather_riveted_light"
					]
				],
				Cloak = [
					[
						1,
						"cloak/relic_hood"
					]
				],
				Tabard = [],
				Attachments = [
					[
						1,
						"armor_upgrades/legend_armor_chain_and_mail_upgrade"
					],
					[
						1,
						"armor_upgrades/legend_armor_sacred_shield_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "sackcloth",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_sackcloth"
					],
					[
						1,
						"cloth/legend_sackcloth_patched"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "scale_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson_plain"
					],
					[
						1,
						"cloth/legend_padded_surcoat"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_hauberk_sleevless"
					],
					[
						1,
						"chain/legend_armor_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_reinforced_worn_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_rusty_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_short_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_scale"
					],
					[
						1,
						"plate/legend_armor_scale_coat"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "sellsword_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson_plain"
					],
					[
						1,
						"cloth/legend_padded_surcoat"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_hauberk"
					],
					[
						1,
						"chain/legend_armor_hauberk_full"
					],
					[
						1,
						"chain/legend_armor_reinforced_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_reinforced_worn_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_riveted"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "tattered_sackcloth",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_sackcloth_tattered"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "thick_dark_tunic",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_dark_tunic"
					],
					[
						1,
						"cloth/legend_thick_tunic"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "thick_tunic",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_thick_tunic"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "werewolf_hide_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson_wolf"
					]
				],
				Chain = [],
				Plate = [
					[
						10,
						""
					],
					[
						5,
						"plate/legend_animal_hide_armor"
					],
					[
						4,
						"plate/legend_armor_leather_jacket"
					],
					[
						4,
						"plate/legend_armor_leather_jacket_simple"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = [
					[
						1,
						"armor_upgrades/legend_direwolf_pelt_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "werewolf_mail_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson_wolf"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_basic_mail"
					],
					[
						1,
						"chain/legend_armor_hauberk_sleevless"
					],
					[
						1,
						"chain/legend_armor_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_reinforced_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_reinforced_worn_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_short_mail"
					]
				],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = [
					[
						1,
						"armor_upgrades/legend_direwolf_pelt_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "wizard_robe",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_robes_magic"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "beautiful_robe",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_robes_wizard"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "worn_mail_shirt",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson_plain"
					],
					[
						1,
						"cloth/legend_padded_surcoat"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_reinforced_rotten_mail_shirt"
					]
				],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "seedmaster_noble_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_tunic"
					],
					[
						1,
						"cloth/legend_robes"
					],
					[
						1,
						"cloth/legend_tunic_noble"
					]
				],
				Chain = [
					[
						4,
						"chain/legend_armor_mail_shirt"
					],
					[
						2,
						"chain/legend_armor_reinforced_mail"
					],
					[
						4,
						"chain/legend_armor_reinforced_mail_shirt"
					]
				],
				Plate = [
					[
						4,
						"plate/legend_armor_leather_riveted_light"
					],
					[
						6,
						"plate/legend_armor_leather_scale"
					],
					[
						6,
						"plate/legend_armor_scale_shirt"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = [
					[
						15,
						""
					],
					[
						5,
						"armor_upgrades/legend_leather_neckguard_upgrade"
					],
					[
						5,
						"armor_upgrades/legend_mail_patch_upgrade"
					],
					[
						2,
						"armor_upgrades/legend_metal_pauldrons_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "citreneking_noble_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson_plain"
					],
					[
						1,
						"cloth/legend_robes"
					],
					[
						1,
						"cloth/legend_tunic_noble"
					]
				],
				Chain = [
					[
						4,
						"chain/legend_armor_basic_mail"
					],
					[
						2,
						"chain/legend_armor_reinforced_mail"
					],
					[
						4,
						"chain/legend_armor_reinforced_mail_shirt"
					]
				],
				Plate = [
					[
						4,
						""
					],
					[
						1,
						"plate/legend_armor_leather_riveted"
					],
					[
						1,
						"plate/legend_armor_leather_riveted_light"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = [
					[
						5,
						""
					],
					[
						5,
						"armor_upgrades/legend_leather_neckguard_upgrade"
					],
					[
						5,
						"armor_upgrades/legend_mail_patch_upgrade"
					],
					[
						2,
						"armor_upgrades/legend_joint_cover_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "legend_noble_guard_armour",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_tunic_noble"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_reinforced_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_plate_krastenbrust"
					],
					[
						1,
						"plate/legend_armor_plate_full"
					]
				],
				Cloak = [
					[
						3,
						""
					],
					[
						1,
						"cloak/legend_armor_cloak_heavy"
					]
				],
				Tabard = [
					[
						2,
						"tabard/legend_noble_tabard"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "man_at_arms_noble_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson_named"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_hauberk"
					],
					[
						1,
						"chain/legend_armor_hauberk_full"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_plate_milanese"
					],
					[
						1,
						"plate/legend_armor_plate_triangle"
					],
					[
						1,
						"plate/legend_armor_plate_full_greaves"
					]
				],
				Cloak = [
					[
						2,
						""
					],
					[
						2,
						"cloak/legend_armor_cloak_noble"
					]
				],
				Tabard = [
					[
						2,
						"tabard/legend_noble_tabard"
					]
				],
				Attachments = [
					[
						5,
						""
					],
					[
						5,
						"armor_upgrades/legend_leather_neckguard_upgrade"
					],
					[
						5,
						"armor_upgrades/legend_mail_patch_upgrade"
					],
					[
						2,
						"armor_upgrades/legend_joint_cover_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "brown_hedgeknight_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson_plain"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_basic_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_plate_chest"
					]
				],
				Cloak = [],
				Tabard = [
					[
						1,
						"tabard/legend_southern_wrap_left",
						6
					]
				],
				Attachments = [
					[
						1,
						"armor_upgrades/legend_double_mail_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "red_bandit_leader_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_padded_surcoat_plain",
						41
					],
					[
						1,
						"cloth/legend_padded_surcoat_plain",
						17
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_basic_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_scale"
					]
				],
				Cloak = [],
				Tabard = [
					[
						1,
						"tabard/legend_southern_wrap_left",
						6
					]
				],
				Attachments = [
					[
						1,
						"armor_upgrades/legend_mail_patch_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "southern_knight_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						10,
						"cloth/legend_southern_robe"
					],
					[
						10,
						"cloth/legend_southern_split_gambeson"
					],
					[
						10,
						"cloth/legend_southern_gambeson"
					],
					[
						5,
						"cloth/legend_southern_tunic"
					],
					[
						5,
						"cloth/legend_gambeson"
					],
					[
						2,
						"cloth/legend_gambeson_plain"
					],
					[
						2,
						"cloth/legend_gambeson_wolf"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_southern_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_southern_plate_full"
					]
				],
				Cloak = [
					[
						1,
						""
					],
					[
						1,
						"cloak/legend_southern_scarf"
					],
					[
						1,
						"cloak/legend_animal_pelt"
					],
					[
						1,
						"cloak/legend_southern_scarf_wrap"
					]
				],
				Tabard = [
					[
						3,
						""
					],
					[
						2,
						"tabard/legend_southern_wrap_left"
					],
					[
						1,
						"tabard/legend_southern_wrap"
					],
					[
						1,
						"tabard/legend_southern_shoulder_cloth"
					]
				],
				Attachments = [
					[
						6,
						""
					],
					[
						4,
						"armor_upgrades/legend_mail_patch_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "northern_mercenary_armor_00",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						2,
						"cloth/legend_gambeson"
					],
					[
						2,
						"cloth/legend_gambeson_plain"
					],
					[
						5,
						"cloth/legend_gambeson_wolf"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_hauberk"
					],
					[
						1,
						"chain/legend_armor_hauberk_full"
					]
				],
				Plate = [
					[
						8,
						""
					],
					[
						1,
						"plate/legend_armor_scale_coat_rotten"
					],
					[
						1,
						"plate/legend_armor_scale_shirt"
					]
				],
				Cloak = [
					[
						1,
						""
					],
					[
						2,
						"cloak/legend_shoulder_cloth",
						2
					]
				],
				Tabard = [],
				Attachments = [
					[
						0,
						""
					],
					[
						4,
						"armor_upgrades/legend_double_mail_upgrade"
					],
					[
						4,
						"armor_upgrades/legend_direwolf_pelt_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "traze_northern_mercenary_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						2,
						"cloth/legend_gambeson"
					],
					[
						2,
						"cloth/legend_gambeson_plain"
					],
					[
						5,
						"cloth/legend_gambeson_wolf"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_hauberk"
					],
					[
						1,
						"chain/legend_armor_hauberk_full"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_plate_cuirass"
					]
				],
				Cloak = [
					[
						1,
						""
					],
					[
						2,
						"cloak/legend_shoulder_cloth"
					]
				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "northern_mercenary_armor_01",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						2,
						"cloth/legend_gambeson"
					],
					[
						2,
						"cloth/legend_gambeson_plain"
					],
					[
						5,
						"cloth/legend_gambeson_wolf"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_reinforced_mail"
					],
					[
						1,
						"chain/legend_armor_reinforced_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_reinforced_worn_mail"
					]
				],
				Plate = [
					[
						0,
						"plate/legend_southern_plate_full"
					]
				],
				Cloak = [
					[
						1,
						""
					],
					[
						2,
						"cloak/legend_shoulder_cloth",
						2
					]
				],
				Tabard = [],
				Attachments = [
					[
						0,
						""
					],
					[
						4,
						"armor_upgrades/legend_metal_plating_upgrade"
					],
					[
						4,
						"armor_upgrades/legend_leather_shoulderguards_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "northern_mercenary_armor_02",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						2,
						"cloth/legend_gambeson"
					],
					[
						2,
						"cloth/legend_gambeson_plain"
					],
					[
						5,
						"cloth/legend_gambeson_wolf"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_reinforced_mail"
					],
					[
						1,
						"chain/legend_armor_reinforced_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_reinforced_worn_mail"
					]
				],
				Plate = [
					[
						0,
						"plate/legend_southern_plate_full"
					]
				],
				Cloak = [
					[
						1,
						""
					],
					[
						2,
						"cloak/legend_shoulder_cloth",
						2
					]
				],
				Tabard = [],
				Attachments = [
					[
						0,
						""
					],
					[
						4,
						"armor_upgrades/legend_metal_plating_upgrade"
					],
					[
						4,
						"armor_upgrades/legend_leather_shoulderguards_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "barbarian_chosen_armor_00",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						2,
						"cloth/legend_gambeson"
					],
					[
						5,
						"cloth/legend_gambeson_wolf"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_ancient_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_hide_and_bone_armor"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = [
					[
						0,
						""
					],
					[
						4,
						"armor_upgrades/legend_bone_platings_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "barbarian_chosen_armor_01",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson"
					],
					[
						4,
						"cloth/legend_padded_surcoat"
					],
					[
						4,
						"cloth/legend_padded_surcoat_plain"
					],
					[
						1,
						"cloth/legend_gambeson_wolf"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_reinforced_worn_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_ancient_double_mail",
						1
					]
				],
				Plate = [
					[
						1,
						"plate/legend_scrap_metal_armor"
					],
					[
						1,
						"plate/legend_rugged_scale_armor"
					],
					[
						1,
						"plate/legend_heavy_iron_armor"
					]
				],
				Cloak = [
					[
						1,
						""
					],
					[
						1,
						"cloak/legend_dark_wooly_cloak",
						13
					],
					[
						1,
						"cloak/legend_southern_scarf",
						7
					],
					[
						1,
						"cloak/legend_southern_scarf",
						6
					],
					[
						1,
						"cloak/legend_southern_scarf",
						13
					]
				],
				Tabard = [
					[
						1,
						"tabard/legend_southern_shoulder_cloth",
						7
					],
					[
						1,
						"tabard/legend_southern_wrap"
					]
				],
				Attachments = [
					[
						4,
						""
					],
					[
						1,
						"armor_upgrades/legend_bone_platings_upgrade"
					],
					[
						1,
						"armor_upgrades/legend_direwolf_pelt_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "brown_monk_armor_00",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_robes",
						1
					]
				],
				Chain = [],
				Plate = [
					[
						2,
						""
					],
					[
						1,
						"plate/legend_armor_leather_jacket_simple"
					]
				],
				Cloak = [],
				Tabard = [
					[
						1,
						"tabard/legend_southern_wrap_left",
						6
					],
					[
						1,
						"tabard/legend_southern_shoulder_cloth",
						7
					],
					[
						1,
						"tabard/legend_southern_shoulder_cloth",
						6
					]
				],
				Attachments = [
					[
						9,
						""
					],
					[
						1,
						"armor_upgrades/legend_leather_neckguard_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "dark_southern_armor_00",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_thick_tunic"
					],
					[
						1,
						"cloth/legend_tunic"
					],
					[
						1,
						"cloth/legend_tunic_wrap"
					],
					[
						1,
						"cloth/legend_tunic_collar_thin"
					],
					[
						1,
						"cloth/legend_tunic_collar_deep"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_short_mail"
					]
				],
				Plate = [],
				Cloak = [
					[
						1,
						"cloak/legend_animal_pelt",
						4
					]
				],
				Tabard = [
					[
						1,
						"tabard/legend_southern_overcloth"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "citrene_nomad_cutthroat_armor_00",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_southern_tunic"
					]
				],
				Chain = [],
				Plate = [
					[
						5,
						"plate/legend_armor_leather_lamellar_harness_heavy"
					],
					[
						3,
						"plate/legend_armor_leather_lamellar_harness_reinforced"
					],
					[
						1,
						"plate/legend_armor_leather_lamellar_heavy"
					]
				],
				Cloak = [
					[
						0,
						"cloak/legend_southern_scarf_wrap"
					]
				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "citrene_nomad_cutthroat_armor_01",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_southern_gambeson"
					],
					[
						1,
						"cloth/legend_southern_split_gambeson"
					]
				],
				Chain = [],
				Plate = [
					[
						1,
						"plate/legend_armor_plate_ancient_chest_restored"
					]
				],
				Cloak = [],
				Tabard = [
					[
						1,
						"tabard/legend_southern_wrap_right"
					],
					[
						1,
						"tabard/legend_southern_wrap_left"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "citrene_nomad_leader_armor_00",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gladiator_harness"
					]
				],
				Chain = [
					[
						0,
						"chain/legend_southern_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_southern_arm_guards"
					]
				],
				Cloak = [],
				Tabard = [
					[
						2,
						"tabard/legend_noble_vest"
					],
					[
						1,
						"tabard/legend_southern_wrap"
					],
					[
						1,
						"tabard/legend_southern_shoulder_cloth"
					],
					[
						1,
						"tabard/legend_southern_overcloth"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "white_nomad_leader_armor_00",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_thick_tunic"
					],
					[
						1,
						"cloth/legend_tunic"
					],
					[
						1,
						"cloth/legend_tunic_wrap"
					],
					[
						1,
						"cloth/legend_tunic_collar_thin"
					],
					[
						1,
						"cloth/legend_tunic_collar_deep"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_southern_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_lamellar_harness_heavy"
					],
					[
						1,
						"plate/legend_armor_leather_lamellar_harness_reinforced"
					],
					[
						1,
						"plate/legend_southern_scale"
					]
				],
				Cloak = [
					[
						3,
						""
					],
					[
						1,
						"cloak/legend_southern_scarf"
					]
				],
				Tabard = [
					[
						2,
						""
					],
					[
						1,
						"tabard/legend_southern_shoulder_cloth"
					],
					[
						1,
						"tabard/legend_southern_wrap"
					],
					[
						1,
						"tabard/legend_southern_shoulder_cloth"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "theamson_nomad_outlaw_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_southern_tunic"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_hauberk_full"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_southern_arm_guards"
					]
				],
				Cloak = [
					[
						1,
						"cloak/legend_shoulder_cloth"
					]
				],
				Tabard = [
					[
						1,
						"tabard/legend_southern_shoulder_cloth"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "theamson_nomad_leader_armor_heavy",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_southern_tunic"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_basic_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_southern_leather_plates"
					]
				],
				Cloak = [],
				Tabard = [
					[
						1,
						"tabard/legend_southern_shoulder_cloth"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "indebted_armor_rags",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_sackcloth"
					],
					[
						1,
						"cloth/legend_sackcloth_tattered"
					],
					[
						1,
						"cloth/legend_sackcloth_patched"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [
					[
						1,
						""
					]
				],
				Tabard = [
					[
						1,
						"tabard/legend_southern_wrap_left"
					],
					[
						1,
						"tabard/legend_southern_wrap_right"
					],
					[
						1,
						"tabard/legend_southern_wrap"
					],
					[
						1,
						"tabard/legend_southern_shoulder_cloth"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "special/heraldic_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson_plain"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_hauberk_full"
					]
				],
				Plate = [],
				Cloak = [],
				Tabard = [
					[
						1,
						"tabard/legend_tabard"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "special/wardog_armor",
		Script = "",
		Sets = [
			{
				Cloth = [],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "special/wardog_heavy_armor",
		Script = "",
		Sets = [
			{
				Cloth = [],
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "adorned_heavy_mail_hauberk",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson_plain"
					],
					[
						1,
						"cloth/legend_padded_surcoat"
					]
				],
				Chain = [
					[
						4,
						"chain/legend_armor_hauberk"
					],
					[
						1,
						"chain/legend_armor_hauberk_full"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_heavy_mail"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "adorned_mail_shirt",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_knightly_robe"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_mail_shirt_simple"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_southern_padded"
					],
					[
						1,
						"plate/legend_armor_leather_padded"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = [
					[
						1,
						"armor_upgrades/legend_armor_spiked_collar_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "reinforced_leather_tunic",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/anatomist_robe"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [
					[
						1,
						"cloak/anatomist_hood"
					]
				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "undertaker_apron",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson_plain"
					]
				],
				Chain = [],
				Plate = [
					[
						1,
						"plate/undertakers_apron"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "wanderers_coat",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/wanderers_coat"
					]
				],
				Chain = [],
				Plate = [],
				Cloak = [
					[
						1,
						"cloak/legend_religious_scarf"
					]
				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "lonewolf_longsword_armour",
		Script = "scripts/items/armor/lonewolf_longsword_armour",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_padded_surcoat"
					],
					[
						1,
						"cloth/legend_gambeson_plain"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_mail_shirt_simple"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_lamellar"
					]
				],
				Cloak = [],
				Tabard = [
					[
						2,
						"tabard/legend_noble_vest"
					]
				],
				Attachments = [
					[
						5,
						"armor_upgrades/legend_leather_neckguard_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "lonewolf_hammershield_armour",
		Script = "scripts/items/armor/lonewolf_hammershield_armour",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_padded_surcoat"
					],
					[
						1,
						"cloth/legend_gambeson_plain"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_reinforced_mail"
					]
				],
				Plate = [],
				Cloak = [],
				Tabard = [
					[
						1,
						"tabard/legend_southern_shoulder_cloth"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "lonewolf_axebuckler_armour",
		Script = "scripts/items/armor/lonewolf_axebuckler_armour",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_padded_surcoat"
					],
					[
						1,
						"cloth/legend_gambeson_plain"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_mail_shirt_simple"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_lamellar_reinforced"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = [
					[
						1,
						"armor_upgrades/legend_direwolf_pelt_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "lonewolf_crossbowsword_armour",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_padded_surcoat"
					],
					[
						1,
						"cloth/legend_robes"
					],
					[
						1,
						"cloth/legend_tunic"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_mail_shirt_simple"
					]
				],
				Plate = [],
				Cloak = [
					[
						1,
						"cloak/legend_shoulder_cloth"
					]
				],
				Tabard = [
					[
						1,
						"tabard/legend_southern_shoulder_cloth"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "lonewolf_bowdagger_armour",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_tunic_noble"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_mail_shirt_simple"
					]
				],
				Plate = [],
				Cloak = [
					[
						1,
						"cloak/legend_armor_cloak_crusader"
					]
				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "lonewolf_polearm_armour",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_padded_surcoat"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_mail_shirt_simple"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_plate_chest"
					]
				],
				Cloak = [
					[
						1,
						"cloak/legend_southern_scarf"
					]
				],
				Tabard = [
					[
						1,
						"tabard/legend_common_tabard"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "bandit_armor_light",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_padded_surcoat"
					],
					[
						1,
						"cloth/legend_gambeson_plain"
					]
				],
				Chain = [
					[
						3,
						"chain/legend_armor_mail_shirt_simple"
					],
					[
						3,
						"chain/legend_armor_rusty_mail_shirt"
					],
					[
						2,
						"chain/legend_armor_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_reinforced_mail_shirt"
					],
					[
						2,
						"chain/legend_armor_short_mail"
					],
					[
						4,
						""
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_padded"
					],
					[
						2,
						""
					]
				],
				Cloak = [],
				Tabard = [
					[
						1,
						"tabard/legend_common_tabard"
					],
					[
						2,
						""
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "bandit_armor_medium",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_padded_surcoat"
					],
					[
						1,
						"cloth/legend_gambeson_plain"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_reinforced_mail"
					],
					[
						1,
						"chain/legend_armor_reinforced_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_short_mail"
					],
					[
						1,
						"chain/legend_armor_basic_mail"
					],
					[
						1,
						"chain/legend_armor_hauberk"
					],
					[
						1,
						"chain/legend_armor_reinforced_rotten_mail_shirt"
					]
				],
				Plate = [
					[
						2,
						"plate/legend_armor_scale_coat_rotten"
					],
					[
						2,
						"plate/legend_armor_leather_lamellar"
					],
					[
						2,
						"plate/legend_armor_leather_padded"
					],
					[
						2,
						"plate/legend_armor_leather_lamellar_reinforced"
					],
					[
						1,
						"plate/legend_armor_scale_shirt"
					],
					[
						2,
						""
					],
					[
						2,
						"plate/legend_armor_leather_lamellar_reinforced"
					]
				],
				Cloak = [
					[
						1,
						"cloak/legend_armor_cloak_common"
					],
					[
						1,
						""
					]
				],
				Tabard = [
					[
						1,
						"tabard/legend_common_tabard"
					],
					[
						1,
						""
					]
				],
				Attachments = [
					[
						15,
						""
					],
					[
						5,
						"armor_upgrades/legend_leather_neckguard_upgrade"
					],
					[
						5,
						"armor_upgrades/legend_mail_patch_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "bandit_armor_heavy",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_padded_surcoat"
					],
					[
						1,
						"cloth/legend_gambeson_plain"
					]
				],
				Chain = [
					[
						2,
						"chain/legend_armor_hauberk"
					],
					[
						2,
						"chain/legend_armor_basic_mail"
					],
					[
						1,
						"chain/legend_armor_reinforced_mail"
					],
					[
						1,
						"chain/legend_armor_hauberk_full"
					]
				],
				Plate = [
					[
						2,
						"plate/legend_armor_plate_chest"
					],
					[
						1,
						"plate/legend_armor_plate_cuirass"
					],
					[
						2,
						"plate/legend_armor_scale"
					],
					[
						2,
						"plate/legend_armor_scale_coat_rotten"
					],
					[
						1,
						"plate/legend_armor_scale_coat"
					],
					[
						2,
						"plate/legend_armor_leather_lamellar_harness_heavy"
					],
					[
						1,
						"plate/legend_armor_leather_lamellar_harness_reinforced"
					]
				],
				Cloak = [
					[
						1,
						"cloak/legend_armor_cloak_common"
					],
					[
						1,
						""
					]
				],
				Tabard = [
					[
						1,
						"tabard/legend_common_tabard"
					],
					[
						1,
						""
					]
				],
				Attachments = [
					[
						5,
						"armor_upgrades/legend_mail_patch_upgrade"
					],
					[
						15,
						""
					]
				]
			}
		]
	},
	{
		ID = "bandit_armor_ultraheavy",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_padded_surcoat"
					],
					[
						1,
						"cloth/legend_gambeson_wolf"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_reinforced_mail"
					],
					[
						1,
						"chain/legend_armor_hauberk"
					],
					[
						1,
						"chain/legend_armor_reinforced_mail_shirt"
					],
					[
						1,
						"chain/legend_armor_hauberk_full"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_plate_cuirass"
					],
					[
						1,
						"plate/legend_armor_plate_full"
					],
					[
						1,
						"plate/legend_armor_leather_lamellar_heavy"
					],
					[
						1,
						"plate/legend_armor_plate_milanese"
					],
					[
						1,
						"plate/legend_armor_plate_krastenbrust"
					],
					[
						1,
						"plate/legend_armor_plate_triangle"
					],
					[
						1,
						"plate/legend_armor_leather_lamellar_harness_reinforced"
					],
					[
						1,
						"plate/legend_armor_leather_lamellar_heavy"
					]
				],
				Cloak = [
					[
						1,
						"cloak/legend_armor_cloak_common"
					],
					[
						1,
						""
					]
				],
				Tabard = [],
				Attachments = [
					[
						15,
						""
					],
					[
						5,
						"armor_upgrades/legend_mail_patch_upgrade"
					],
					[
						2,
						"armor_upgrades/legend_metal_pauldrons_upgrade"
					]
				]
			}
		]
	}
]);
gt.Const.LegendMod.Armors <- {};

foreach( i, v in gt.Const.LegendMod.ArmorObjs )
{
	gt.Const.LegendMod.Armors[v.ID] <- v;
}

