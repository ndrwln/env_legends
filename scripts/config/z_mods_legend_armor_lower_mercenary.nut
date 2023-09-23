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
		ID = "mercenary_archer_armor_00",
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
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = [
					[
						9,
						""
					],
					[
						1,
						"armor_upgrades/legend_leather_shoulderguards_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "mercenary_archer_armor_01",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_padded_surcoat",
						65
					]
				],
				Chain = [],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_jacket",
						2
					],
					[
						1,
						"plate/legend_armor_leather_jacket_simple",
						2
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = [
					[
						9,
						""
					],
					[
						1,
						"armor_upgrades/legend_leather_shoulderguards_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "mercenary_infantry_armor_00",
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
						4,
						"chain/legend_armor_hauberk_sleevless"
					],
					[
						4,
						"chain/legend_armor_basic_mail"
					],
					[
						3,
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
		ID = "mercenary_infantry_armor_01",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						5,
						"cloth/legend_tunic",
						4
					],
					[
						1,
						"cloth/legend_gambeson",
						0
					],
					[
						1,
						"cloth/legend_gambeson",
						1
					],
					[
						1,
						"cloth/legend_padded_surcoat",
						40
					],
					[
						1,
						"cloth/legend_padded_surcoat",
						65
					],
					[
						1,
						"cloth/legend_gambeson_wolf"
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_hauberk_sleevless"
					],
					[
						1,
						"chain/legend_armor_basic_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_lamellar"
					],
					[
						1,
						"plate/legend_armor_leather_lamellar_harness_reinforced"
					],
					[
						1,
						"plate/legend_armor_leather_riveted_light"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "mercenary_crossbow_armor_00",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson",
						0
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_hauberk_sleevless"
					],
					[
						1,
						"chain/legend_armor_reinforced_mail_shirt"
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
						"plate/legend_armor_leather_lamellar"
					],
					[
						1,
						"plate/legend_armor_leather_lamellar_harness_reinforced"
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
						12,
						""
					],
					[
						1,
						"armor_upgrades/legend_metal_pauldrons_upgrade"
					],
					[
						1,
						"armor_upgrades/legend_double_mail_upgrade"
					],
					[
						1,
						"armor_upgrades/legend_leather_shoulderguards_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "mercenary_spearman_armor_00",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson",
						0
					],
					[
						1,
						"cloth/legend_gambeson",
						65
					],
					[
						1,
						"cloth/legend_gambeson",
						40
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_hauberk_sleevless"
					],
					[
						1,
						"chain/legend_armor_reinforced_mail_shirt"
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
						"plate/legend_armor_leather_padded"
					],
					[
						1,
						"plate/legend_armor_leather_jacket",
						3
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
						12,
						""
					],
					[
						1,
						"armor_upgrades/legend_metal_pauldrons_upgrade"
					],
					[
						1,
						"armor_upgrades/legend_double_mail_upgrade"
					],
					[
						1,
						"armor_upgrades/legend_leather_shoulderguards_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "mercenary_spearman_armor_01",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson",
						0
					],
					[
						1,
						"cloth/legend_gambeson",
						65
					],
					[
						1,
						"cloth/legend_gambeson",
						40
					]
				],
				Chain = [],
				Plate = [
					[
						1,
						"plate/legend_southern_plate"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "mercenary_leader_armor_uncommon_00",
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
						"chain/legend_armor_reinforced_mail_shirt"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_thick_plated_barbarian_armor"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "mercenary_leader_armor_00",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_tunic",
						4
					],
					[
						1,
						"cloth/legend_gambeson",
						0
					],
					[
						1,
						"cloth/legend_gambeson",
						1
					],
					[
						1,
						"cloth/legend_padded_surcoat",
						40
					],
					[
						1,
						"cloth/legend_padded_surcoat",
						65
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
						"chain/legend_armor_hauberk_full"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_brigandine"
					],
					[
						1,
						"plate/legend_armor_leather_riveted"
					]
				],
				Cloak = [],
				Tabard = [
					[
						4,
						""
					],
					[
						1,
						"tabard/legend_southern_shoulder_cloth",
						4
					]
				],
				Attachments = [
					[
						9,
						""
					],
					[
						1,
						"armor_upgrades/legend_leather_shoulderguards_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "mercenary_leader_armor_gilded_00",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gladiator_harness"
					]
				],
				Chain = [],
				Plate = [
					[
						1,
						"plate/legend_armor_plate_full_greaves_named"
					]
				],
				Cloak = [
					[
						1,
						"cloak/legend_noble_vest"
					]
				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "mercenary_billman_armor_00",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_tunic",
						4
					]
				],
				Chain = [
					[
						1,
						"chain/legend_armor_reinforced_mail"
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
						"chain/legend_armor_hauberk_full"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_padded"
					],
					[
						1,
						"plate/legend_armor_leather_lamellar_reinforced"
					],
					[
						1,
						"plate/legend_armor_leather_lamellar"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = [
					[
						9,
						""
					],
					[
						1,
						"armor_upgrades/legend_leather_shoulderguards_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "mercenary_longbow_armor_00",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_gambeson",
						0
					],
					[
						1,
						"cloth/legend_gambeson",
						8
					]
				],
				Chain = [],
				Plate = [
					[
						1,
						"plate/legend_armor_leather_scale"
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
						9,
						""
					],
					[
						1,
						"armor_upgrades/legend_leather_shoulderguards_upgrade"
					]
				]
			}
		]
	}
]);

