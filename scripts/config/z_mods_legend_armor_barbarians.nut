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
		ID = "barbarians/animal_hide_armor",
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
				Plate = [
					[
						1,
						"plate/legend_animal_hide_armor"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "barbarians/barbarian_ritual_armor",
		Script = "scripts/items/armor/barbarians/barbarian_ritual_armor",
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
		ID = "barbarians/heavy_iron_armor",
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
				Plate = [
					[
						1,
						"plate/legend_thick_plated_barbarian_armor"
					]
				],
				Cloak = [
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
		ID = "barbarians/reinforced_heavy_iron_armor",
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
				Chain = [
					[
						1,
						"chain/legend_armor_reinforced_worn_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_heavy_iron_armor"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "barbarians/hide_and_bone_armor",
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
				Plate = [
					[
						1,
						"plate/legend_hide_and_bone_armor"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "barbarians/reinforced_animal_hide_armor",
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
				Plate = [
					[
						1,
						"plate/legend_reinforced_animal_hide_armor"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "barbarians/rugged_scale_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_sackcloth_patched"
					],
					[
						1,
						"cloth/legend_ancient_cloth_restored"
					]
				],
				Chain = [],
				Plate = [
					[
						1,
						"plate/legend_rugged_scale_armor"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "barbarians/legend_barbarian_southern_armor",
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
				Plate = [
					[
						1,
						"plate/legend_southern_arm_guards"
					]
				],
				Cloak = [],
				Tabard = [
					[
						1,
						"tabard/legend_southern_overcloth"
					]
				],
				Attachments = [
					[
						1,
						"armor_upgrades/legend_leather_shoulderguards_upgrade"
					]
				]
			}
		]
	},
	{
		ID = "barbarians/scrap_metal_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_ancient_cloth"
					],
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
				Plate = [
					[
						1,
						"plate/legend_scrap_metal_armor"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "barbarians/thick_furs_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_ancient_cloth"
					],
					[
						1,
						"cloth/legend_ancient_cloth_restored"
					],
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
				Plate = [
					[
						1,
						"plate/legend_thick_furs_armor"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "barbarians/thick_plated_barbarian_armor",
		Script = "",
		Sets = [
			{
				Cloth = [
					[
						1,
						"cloth/legend_ancient_cloth"
					],
					[
						1,
						"cloth/legend_ancient_cloth_restored"
					]
				],
				Chain = [
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
		ID = "barbarians/unhold_armor_heavy",
		Script = "scripts/items/armor/barbarians/unhold_armor_heavy",
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
		ID = "barbarians/unhold_armor_light",
		Script = "scripts/items/armor/barbarians/unhold_armor_light",
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
	}
]);

