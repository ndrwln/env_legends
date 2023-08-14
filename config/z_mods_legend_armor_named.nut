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
		ID = "named/black_and_gold_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						4,
						"cloth/legend_gambeson"
					],
					[
						4,
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
						"chain/legend_armor_hauberk_full_named"
					]
				],
				Plate = [],
				Cloak = [
					[
						0,
						"cloak/legend_shoulder_cloth"
					],
					[
						0,
						"cloak/legend_noble_shawl"
					],
					[
						1,
						"cloak/legend_dark_wooly_cloak"
					],
					[
						1,
						"cloak/legend_armor_cloak_common"
					],
					[
						1,
						"cloak/legend_armor_cloak_heavy"
					],
					[
						0,
						"cloak/legend_armor_cloak_crusader"
					],
					[
						0,
						"cloak/legend_armor_cloak_noble"
					],
					[
						0,
						"cloak/legend_sash"
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
						2,
						""
					],
					[
						3,
						"tabard/legend_common_tabard"
					],
					[
						0,
						"tabard/legend_noble_tabard"
					],
					[
						1,
						"tabard/legend_southern_wrap_right"
					],
					[
						1,
						"tabard/legend_southern_wrap_left"
					],
					[
						1,
						"tabard/legend_southern_wide_belt"
					],
					[
						0,
						"tabard/legend_noble_vest"
					],
					[
						0,
						"tabard/legend_southern_wrap"
					],
					[
						0,
						"tabard/legend_southern_shoulder_cloth"
					],
					[
						0,
						"tabard/legend_southern_overcloth"
					],
					[
						2,
						"tabard/legend_southern_tabard"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "named/black_leather_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_tunic_noble_named"
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
						"chain/legend_armor_short_mail"
					]
				],
				Plate = [],
				Cloak = [
					[
						0,
						"cloak/legend_shoulder_cloth"
					],
					[
						0,
						"cloak/legend_noble_shawl"
					],
					[
						0,
						"cloak/legend_dark_wooly_cloak"
					],
					[
						1,
						"cloak/legend_armor_cloak_common"
					],
					[
						1,
						"cloak/legend_armor_cloak_heavy"
					],
					[
						0,
						"cloak/legend_armor_cloak_crusader"
					],
					[
						0,
						"cloak/legend_armor_cloak_noble"
					],
					[
						0,
						"cloak/legend_sash"
					],
					[
						0,
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
						1,
						""
					],
					[
						1,
						"tabard/legend_common_tabard"
					],
					[
						0,
						"tabard/legend_noble_tabard"
					],
					[
						0,
						"tabard/legend_southern_wrap_right"
					],
					[
						0,
						"tabard/legend_southern_wrap_left"
					],
					[
						0,
						"tabard/legend_southern_wide_belt"
					],
					[
						0,
						"tabard/legend_noble_vest"
					],
					[
						0,
						"tabard/legend_southern_wrap"
					],
					[
						0,
						"tabard/legend_southern_shoulder_cloth"
					],
					[
						0,
						"tabard/legend_southern_overcloth"
					],
					[
						0,
						"tabard/legend_southern_tabard"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "named/blue_studded_mail_armor",
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
						"chain/legend_armor_short_mail"
					]
				],
				Plate = [],
				Cloak = [
					[
						0,
						"cloak/legend_shoulder_cloth"
					],
					[
						0,
						"cloak/legend_noble_shawl"
					],
					[
						0,
						"cloak/legend_dark_wooly_cloak"
					],
					[
						0,
						"cloak/legend_armor_cloak_common"
					],
					[
						0,
						"cloak/legend_armor_cloak_heavy"
					],
					[
						0,
						"cloak/legend_armor_cloak_crusader"
					],
					[
						0,
						"cloak/legend_armor_cloak_noble"
					],
					[
						0,
						"cloak/legend_sash"
					],
					[
						0,
						"cloak/legend_southern_scarf"
					],
					[
						0,
						"cloak/legend_animal_pelt"
					],
					[
						0,
						"cloak/legend_southern_scarf_wrap"
					]
				],
				Tabard = [
					[
						0,
						""
					],
					[
						0,
						"tabard/legend_common_tabard"
					],
					[
						0,
						"tabard/legend_noble_tabard"
					],
					[
						0,
						"tabard/legend_southern_wrap_right"
					],
					[
						0,
						"tabard/legend_southern_wrap_left"
					],
					[
						0,
						"tabard/legend_southern_wide_belt"
					],
					[
						0,
						"tabard/legend_noble_vest"
					],
					[
						0,
						"tabard/legend_southern_wrap"
					],
					[
						0,
						"tabard/legend_southern_shoulder_cloth"
					],
					[
						0,
						"tabard/legend_southern_overcloth"
					],
					[
						0,
						"tabard/legend_southern_tabard"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "named/brown_coat_of_plates_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						4,
						"cloth/legend_gambeson"
					],
					[
						4,
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
						"chain/legend_armor_ancient_double_mail"
					],
					[
						1,
						"chain/legend_armor_ancient_mail"
					],
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
						"plate/legend_armor_plate_full_greaves"
					],
					[
						1,
						"plate/legend_armor_plate_full_greaves_named"
					],
					[
						1,
						"plate/legend_armor_plate_full_greaves_painted"
					]
				],
				Cloak = [
					[
						1,
						"cloak/legend_shoulder_cloth"
					],
					[
						1,
						"cloak/legend_noble_shawl"
					],
					[
						1,
						"cloak/legend_dark_wooly_cloak"
					],
					[
						1,
						"cloak/legend_armor_cloak_common"
					],
					[
						1,
						"cloak/legend_armor_cloak_heavy"
					],
					[
						0,
						"cloak/legend_armor_cloak_crusader"
					],
					[
						0,
						"cloak/legend_armor_cloak_noble"
					],
					[
						0,
						"cloak/legend_sash"
					],
					[
						0,
						"cloak/legend_southern_scarf"
					],
					[
						0,
						"cloak/legend_animal_pelt"
					],
					[
						0,
						"cloak/legend_southern_scarf_wrap"
					]
				],
				Tabard = [
					[
						0,
						""
					],
					[
						1,
						"tabard/legend_common_tabard"
					],
					[
						1,
						"tabard/legend_noble_tabard"
					],
					[
						0,
						"tabard/legend_southern_wrap_right"
					],
					[
						0,
						"tabard/legend_southern_wrap_left"
					],
					[
						0,
						"tabard/legend_southern_wide_belt"
					],
					[
						0,
						"tabard/legend_noble_vest"
					],
					[
						0,
						"tabard/legend_southern_wrap"
					],
					[
						0,
						"tabard/legend_southern_shoulder_cloth"
					],
					[
						0,
						"tabard/legend_southern_overcloth"
					],
					[
						0,
						"tabard/legend_southern_tabard"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "named/golden_scale_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						4,
						"cloth/legend_gambeson"
					],
					[
						4,
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
						"chain/legend_armor_hauberk_full_named"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_brigandine"
					],
					[
						1,
						"plate/legend_armor_leather_jacket"
					],
					[
						1,
						"plate/legend_armor_leather_jacket_simple"
					],
					[
						1,
						"plate/legend_armor_leather_lamellar"
					],
					[
						1,
						"plate/legend_armor_leather_padded"
					],
					[
						1,
						"plate/legend_armor_leather_riveted_light"
					],
					[
						1,
						"plate/legend_armor_leather_scale"
					]
				],
				Cloak = [
					[
						1,
						"cloak/legend_shoulder_cloth"
					],
					[
						1,
						"cloak/legend_noble_shawl"
					],
					[
						1,
						"cloak/legend_dark_wooly_cloak"
					],
					[
						1,
						"cloak/legend_armor_cloak_common"
					],
					[
						1,
						"cloak/legend_armor_cloak_heavy"
					],
					[
						0,
						"cloak/legend_armor_cloak_crusader"
					],
					[
						0,
						"cloak/legend_armor_cloak_noble"
					],
					[
						0,
						"cloak/legend_sash"
					],
					[
						0,
						"cloak/legend_southern_scarf"
					],
					[
						0,
						"cloak/legend_animal_pelt"
					],
					[
						0,
						"cloak/legend_southern_scarf_wrap"
					]
				],
				Tabard = [
					[
						0,
						""
					],
					[
						1,
						"tabard/legend_common_tabard"
					],
					[
						1,
						"tabard/legend_noble_tabard"
					],
					[
						0,
						"tabard/legend_southern_wrap_right"
					],
					[
						0,
						"tabard/legend_southern_wrap_left"
					],
					[
						0,
						"tabard/legend_southern_wide_belt"
					],
					[
						0,
						"tabard/legend_noble_vest"
					],
					[
						0,
						"tabard/legend_southern_wrap"
					],
					[
						0,
						"tabard/legend_southern_shoulder_cloth"
					],
					[
						0,
						"tabard/legend_southern_overcloth"
					],
					[
						0,
						"tabard/legend_southern_tabard"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "named/green_coat_of_plates_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						4,
						"cloth/legend_gambeson"
					],
					[
						4,
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
						"chain/legend_armor_ancient_double_mail"
					],
					[
						1,
						"chain/legend_armor_ancient_mail"
					],
					[
						1,
						"chain/legend_armor_reinforced_worn_mail"
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
						"chain/legend_southern_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_plate_full_greaves"
					],
					[
						1,
						"plate/legend_armor_plate_full_greaves_named"
					],
					[
						1,
						"plate/legend_armor_plate_full_greaves_painted"
					]
				],
				Cloak = [
					[
						1,
						"cloak/legend_shoulder_cloth"
					],
					[
						1,
						"cloak/legend_noble_shawl"
					],
					[
						1,
						"cloak/legend_dark_wooly_cloak"
					],
					[
						1,
						"cloak/legend_armor_cloak_common"
					],
					[
						1,
						"cloak/legend_armor_cloak_heavy"
					],
					[
						0,
						"cloak/legend_armor_cloak_crusader"
					],
					[
						0,
						"cloak/legend_armor_cloak_noble"
					],
					[
						0,
						"cloak/legend_sash"
					],
					[
						0,
						"cloak/legend_southern_scarf"
					],
					[
						0,
						"cloak/legend_animal_pelt"
					],
					[
						0,
						"cloak/legend_southern_scarf_wrap"
					]
				],
				Tabard = [
					[
						0,
						""
					],
					[
						1,
						"tabard/legend_common_tabard"
					],
					[
						1,
						"tabard/legend_noble_tabard"
					],
					[
						0,
						"tabard/legend_southern_wrap_right"
					],
					[
						0,
						"tabard/legend_southern_wrap_left"
					],
					[
						0,
						"tabard/legend_southern_wide_belt"
					],
					[
						0,
						"tabard/legend_noble_vest"
					],
					[
						0,
						"tabard/legend_southern_wrap"
					],
					[
						0,
						"tabard/legend_southern_shoulder_cloth"
					],
					[
						0,
						"tabard/legend_southern_overcloth"
					],
					[
						0,
						"tabard/legend_southern_tabard"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "named/heraldic_mail_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						4,
						"cloth/legend_gambeson"
					],
					[
						4,
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
						"chain/legend_armor_short_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_scale_coat_named"
					]
				],
				Cloak = [
					[
						0,
						"cloak/legend_shoulder_cloth"
					],
					[
						0,
						"cloak/legend_noble_shawl"
					],
					[
						0,
						"cloak/legend_dark_wooly_cloak"
					],
					[
						0,
						"cloak/legend_armor_cloak_common"
					],
					[
						0,
						"cloak/legend_armor_cloak_heavy"
					],
					[
						0,
						"cloak/legend_armor_cloak_crusader"
					],
					[
						0,
						"cloak/legend_armor_cloak_noble"
					],
					[
						0,
						"cloak/legend_sash"
					],
					[
						0,
						"cloak/legend_southern_scarf"
					],
					[
						0,
						"cloak/legend_animal_pelt"
					],
					[
						0,
						"cloak/legend_southern_scarf_wrap"
					]
				],
				Tabard = [
					[
						0,
						""
					],
					[
						0,
						"tabard/legend_common_tabard"
					],
					[
						0,
						"tabard/legend_noble_tabard"
					],
					[
						0,
						"tabard/legend_southern_wrap_right"
					],
					[
						0,
						"tabard/legend_southern_wrap_left"
					],
					[
						0,
						"tabard/legend_southern_wide_belt"
					],
					[
						0,
						"tabard/legend_noble_vest"
					],
					[
						0,
						"tabard/legend_southern_wrap"
					],
					[
						0,
						"tabard/legend_southern_shoulder_cloth"
					],
					[
						0,
						"tabard/legend_southern_overcloth"
					],
					[
						0,
						"tabard/legend_southern_tabard"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "named/leopard_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_southern_robe"
					],
					[
						1,
						"cloth/legend_southern_gambeson"
					],
					[
						1,
						"cloth/legend_southern_split_gambeson"
					],
					[
						1,
						"cloth/legend_southern_tunic"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_southern_padded_chest"
					],
					[
						1,
						"chain/legend_southern_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_southern_named_plates"
					]
				],
				Cloak = [
					[
						0,
						"cloak/legend_shoulder_cloth"
					],
					[
						0,
						"cloak/legend_noble_shawl"
					],
					[
						0,
						"cloak/legend_dark_wooly_cloak"
					],
					[
						0,
						"cloak/legend_armor_cloak_common"
					],
					[
						0,
						"cloak/legend_armor_cloak_heavy"
					],
					[
						0,
						"cloak/legend_armor_cloak_crusader"
					],
					[
						0,
						"cloak/legend_armor_cloak_noble"
					],
					[
						0,
						"cloak/legend_sash"
					],
					[
						0,
						"cloak/legend_southern_scarf"
					],
					[
						1,
						"cloak/legend_animal_pelt"
					],
					[
						0,
						"cloak/legend_southern_scarf_wrap"
					]
				],
				Tabard = [
					[
						3,
						""
					],
					[
						0,
						"tabard/legend_common_tabard"
					],
					[
						0,
						"tabard/legend_noble_tabard"
					],
					[
						0,
						"tabard/legend_southern_wrap_right"
					],
					[
						0,
						"tabard/legend_southern_wrap_left"
					],
					[
						1,
						"tabard/legend_southern_wide_belt"
					],
					[
						0,
						"tabard/legend_noble_vest"
					],
					[
						0,
						"tabard/legend_southern_wrap"
					],
					[
						0,
						"tabard/legend_southern_shoulder_cloth"
					],
					[
						0,
						"tabard/legend_southern_overcloth"
					],
					[
						1,
						"tabard/legend_southern_tabard"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "named/named_bronze_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						4,
						"cloth/legend_gambeson"
					],
					[
						4,
						"cloth/legend_gambeson_plain"
					],
					[
						2,
						"cloth/legend_gambeson_wolf"
					]
				],
				Chain = [],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_brigandine_named"
					]
				],
				Cloak = [
					[
						0,
						"cloak/legend_shoulder_cloth"
					],
					[
						0,
						"cloak/legend_noble_shawl"
					],
					[
						0,
						"cloak/legend_dark_wooly_cloak"
					],
					[
						0,
						"cloak/legend_armor_cloak_common"
					],
					[
						0,
						"cloak/legend_armor_cloak_heavy"
					],
					[
						0,
						"cloak/legend_armor_cloak_crusader"
					],
					[
						0,
						"cloak/legend_armor_cloak_noble"
					],
					[
						0,
						"cloak/legend_sash"
					],
					[
						0,
						"cloak/legend_southern_scarf"
					],
					[
						0,
						"cloak/legend_animal_pelt"
					],
					[
						0,
						"cloak/legend_southern_scarf_wrap"
					]
				],
				Tabard = [
					[
						0,
						""
					],
					[
						0,
						"tabard/legend_common_tabard"
					],
					[
						0,
						"tabard/legend_noble_tabard"
					],
					[
						0,
						"tabard/legend_southern_wrap_right"
					],
					[
						0,
						"tabard/legend_southern_wrap_left"
					],
					[
						0,
						"tabard/legend_southern_wide_belt"
					],
					[
						0,
						"tabard/legend_noble_vest"
					],
					[
						0,
						"tabard/legend_southern_wrap"
					],
					[
						0,
						"tabard/legend_southern_shoulder_cloth"
					],
					[
						0,
						"tabard/legend_southern_overcloth"
					],
					[
						0,
						"tabard/legend_southern_tabard"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "named/named_golden_lamellar_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						4,
						"cloth/legend_gambeson"
					],
					[
						4,
						"cloth/legend_gambeson_plain"
					],
					[
						2,
						"cloth/legend_gambeson_wolf"
					]
				],
				Chain = [],
				Plate = [
					[
						1,
						"plate/legend_southern_named_plates"
					]
				],
				Cloak = [
					[
						0,
						"cloak/legend_shoulder_cloth"
					],
					[
						0,
						"cloak/legend_noble_shawl"
					],
					[
						0,
						"cloak/legend_dark_wooly_cloak"
					],
					[
						0,
						"cloak/legend_armor_cloak_common"
					],
					[
						0,
						"cloak/legend_armor_cloak_heavy"
					],
					[
						0,
						"cloak/legend_armor_cloak_crusader"
					],
					[
						0,
						"cloak/legend_armor_cloak_noble"
					],
					[
						0,
						"cloak/legend_sash"
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
						0,
						""
					],
					[
						0,
						"tabard/legend_common_tabard"
					],
					[
						0,
						"tabard/legend_noble_tabard"
					],
					[
						1,
						"tabard/legend_southern_wrap_right"
					],
					[
						1,
						"tabard/legend_southern_wrap_left"
					],
					[
						1,
						"tabard/legend_southern_wide_belt"
					],
					[
						0,
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
					],
					[
						1,
						"tabard/legend_southern_tabard"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "named/named_noble_mail_armor",
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
						""
					],
					[
						1,
						"chain/legend_armor_mail_shirt_simple"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_jacket_named"
					],
					[
						1,
						"plate/legend_armor_leather_studded_jacket_named"
					]
				],
				Cloak = [
					[
						0,
						"cloak/legend_shoulder_cloth"
					],
					[
						0,
						"cloak/legend_noble_shawl"
					],
					[
						0,
						"cloak/legend_dark_wooly_cloak"
					],
					[
						0,
						"cloak/legend_armor_cloak_common"
					],
					[
						1,
						"cloak/legend_armor_cloak_heavy"
					],
					[
						0,
						"cloak/legend_armor_cloak_crusader"
					],
					[
						4,
						"cloak/legend_armor_cloak_noble"
					],
					[
						0,
						"cloak/legend_sash"
					],
					[
						0,
						"cloak/legend_southern_scarf"
					],
					[
						0,
						"cloak/legend_animal_pelt"
					],
					[
						0,
						"cloak/legend_southern_scarf_wrap"
					]
				],
				Tabard = [
					[
						0,
						""
					],
					[
						0,
						"tabard/legend_common_tabard"
					],
					[
						7,
						"tabard/legend_noble_tabard"
					],
					[
						0,
						"tabard/legend_southern_wrap_right"
					],
					[
						0,
						"tabard/legend_southern_wrap_left"
					],
					[
						0,
						"tabard/legend_southern_wide_belt"
					],
					[
						2,
						"tabard/legend_noble_vest"
					],
					[
						0,
						"tabard/legend_southern_wrap"
					],
					[
						0,
						"tabard/legend_southern_shoulder_cloth"
					],
					[
						0,
						"tabard/legend_southern_overcloth"
					],
					[
						1,
						"tabard/legend_southern_tabard"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "named/named_plated_fur_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						4,
						"cloth/legend_gambeson"
					],
					[
						4,
						"cloth/legend_gambeson_plain"
					],
					[
						2,
						"cloth/legend_gambeson_wolf"
					]
				],
				Chain = [],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_jacket_named"
					]
				],
				Cloak = [
					[
						0,
						"cloak/legend_shoulder_cloth"
					],
					[
						0,
						"cloak/legend_noble_shawl"
					],
					[
						0,
						"cloak/legend_dark_wooly_cloak"
					],
					[
						0,
						"cloak/legend_armor_cloak_common"
					],
					[
						0,
						"cloak/legend_armor_cloak_heavy"
					],
					[
						0,
						"cloak/legend_armor_cloak_crusader"
					],
					[
						0,
						"cloak/legend_armor_cloak_noble"
					],
					[
						0,
						"cloak/legend_sash"
					],
					[
						0,
						"cloak/legend_southern_scarf"
					],
					[
						1,
						"cloak/legend_animal_pelt"
					],
					[
						0,
						"cloak/legend_southern_scarf_wrap"
					]
				],
				Tabard = [
					[
						0,
						""
					],
					[
						0,
						"tabard/legend_common_tabard"
					],
					[
						0,
						"tabard/legend_noble_tabard"
					],
					[
						0,
						"tabard/legend_southern_wrap_right"
					],
					[
						0,
						"tabard/legend_southern_wrap_left"
					],
					[
						0,
						"tabard/legend_southern_wide_belt"
					],
					[
						0,
						"tabard/legend_noble_vest"
					],
					[
						0,
						"tabard/legend_southern_wrap"
					],
					[
						0,
						"tabard/legend_southern_shoulder_cloth"
					],
					[
						0,
						"tabard/legend_southern_overcloth"
					],
					[
						0,
						"tabard/legend_southern_tabard"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "named/named_sellswords_armor",
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
						"cloth/legend_dark_tunic"
					],
					[
						1,
						"cloth/legend_tunic_noble"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_ancient_double_mail"
					],
					[
						1,
						"chain/legend_armor_ancient_mail"
					],
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
						"plate/legend_armor_leather_lamellar_heavy_named"
					]
				],
				Cloak = [
					[
						0,
						"cloak/legend_shoulder_cloth"
					],
					[
						0,
						"cloak/legend_noble_shawl"
					],
					[
						0,
						"cloak/legend_dark_wooly_cloak"
					],
					[
						0,
						"cloak/legend_armor_cloak_common"
					],
					[
						0,
						"cloak/legend_armor_cloak_heavy"
					],
					[
						0,
						"cloak/legend_armor_cloak_crusader"
					],
					[
						0,
						"cloak/legend_armor_cloak_noble"
					],
					[
						0,
						"cloak/legend_sash"
					],
					[
						0,
						"cloak/legend_southern_scarf"
					],
					[
						0,
						"cloak/legend_animal_pelt"
					],
					[
						0,
						"cloak/legend_southern_scarf_wrap"
					]
				],
				Tabard = [
					[
						0,
						""
					],
					[
						0,
						"tabard/legend_common_tabard"
					],
					[
						0,
						"tabard/legend_noble_tabard"
					],
					[
						0,
						"tabard/legend_southern_wrap_right"
					],
					[
						0,
						"tabard/legend_southern_wrap_left"
					],
					[
						0,
						"tabard/legend_southern_wide_belt"
					],
					[
						0,
						"tabard/legend_noble_vest"
					],
					[
						0,
						"tabard/legend_southern_wrap"
					],
					[
						0,
						"tabard/legend_southern_shoulder_cloth"
					],
					[
						0,
						"tabard/legend_southern_overcloth"
					],
					[
						0,
						"tabard/legend_southern_tabard"
					]
				],
				Attachments = []
			}
		]
	},
	{
		ID = "named/named_skull_and_chain_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						4,
						"cloth/legend_gambeson"
					],
					[
						4,
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
						"chain/legend_armor_ancient_double_mail"
					],
					[
						1,
						"chain/legend_armor_ancient_mail"
					],
					[
						1,
						"chain/legend_armor_reinforced_rotten_mail_shirt"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_brigandine_named"
					]
				],
				Cloak = [
					[
						0,
						"cloak/legend_shoulder_cloth"
					],
					[
						0,
						"cloak/legend_noble_shawl"
					],
					[
						4,
						"cloak/legend_dark_wooly_cloak"
					],
					[
						0,
						"cloak/legend_armor_cloak_common"
					],
					[
						0,
						"cloak/legend_armor_cloak_heavy"
					],
					[
						0,
						"cloak/legend_armor_cloak_crusader"
					],
					[
						0,
						"cloak/legend_armor_cloak_noble"
					],
					[
						0,
						"cloak/legend_sash"
					],
					[
						0,
						"cloak/legend_southern_scarf"
					],
					[
						1,
						"cloak/legend_animal_pelt"
					],
					[
						0,
						"cloak/legend_southern_scarf_wrap"
					]
				],
				Tabard = [
					[
						0,
						""
					],
					[
						0,
						"tabard/legend_common_tabard"
					],
					[
						0,
						"tabard/legend_noble_tabard"
					],
					[
						0,
						"tabard/legend_southern_wrap_right"
					],
					[
						0,
						"tabard/legend_southern_wrap_left"
					],
					[
						0,
						"tabard/legend_southern_wide_belt"
					],
					[
						0,
						"tabard/legend_noble_vest"
					],
					[
						0,
						"tabard/legend_southern_wrap"
					],
					[
						0,
						"tabard/legend_southern_shoulder_cloth"
					],
					[
						0,
						"tabard/legend_southern_overcloth"
					],
					[
						0,
						"tabard/legend_southern_tabard"
					]
				],
				Attachments = [
					[
						1,
						"armor_upgrades/legend_armor_skull_chain_upgrade"
					]
				]
			}
		]
	}
]);

