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
		ID = "ancient/ancient_breastplate",
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
				Chain = [],
				Plate = [
					[
						1,
						"plate/legend_armor_plate_ancient_chest"
					],
					[
						1,
						"plate/legend_armor_plate_ancient_chest_restored"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "ancient/ancient_double_layer_mail",
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
						"chain/legend_armor_ancient_double_mail"
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
		ID = "ancient/ancient_lich_attire",
		Script = "scripts/items/armor/ancient/ancient_lich_attire",
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
		ID = "ancient/ancient_mail",
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
						"chain/legend_armor_ancient_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_plate_ancient_mail"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "ancient/ancient_plated_mail_hauberk",
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
						"chain/legend_armor_ancient_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_plate_ancient_chest"
					],
					[
						1,
						"plate/legend_armor_plate_ancient_chest_restored"
					],
					[
						1,
						"plate/legend_armor_plate_ancient_scale"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "ancient/ancient_plated_scale_hauberk",
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
						"chain/legend_armor_ancient_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_plate_ancient_scale_coat"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "ancient/ancient_plate_harness",
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
						"chain/legend_armor_ancient_double_mail"
					],
					[
						1,
						"chain/legend_armor_ancient_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_plate_ancient_harness"
					],
					[
						1,
						"plate/legend_armor_plate_ancient_scale_harness"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "ancient/ancient_priest_attire",
		Script = "scripts/items/armor/ancient/ancient_priest_attire",
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
		ID = "ancient/ancient_ripped_cloth",
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
				Chain = [],
				Plate = [],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "ancient/ancient_scale_coat",
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
						"chain/legend_armor_ancient_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_plate_ancient_chest"
					],
					[
						1,
						"plate/legend_armor_plate_ancient_chest_restored"
					],
					[
						1,
						"plate/legend_armor_plate_ancient_harness"
					],
					[
						1,
						"plate/legend_armor_plate_ancient_scale"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "ancient/ancient_scale_harness",
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
						"chain/legend_armor_ancient_mail"
					]
				],
				Plate = [
					[
						1,
						"plate/legend_armor_plate_ancient_scale_harness"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "ancient/legend_mummy_dress",
		Script = "scripts/items/armor/ancient/legend_mummy_dress",
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
		ID = "ancient/legend_mummy_plate",
		Script = "scripts/items/armor/ancient/legend_mummy_plate",
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
		ID = "ancient/legend_mummy_bandages",
		Script = "scripts/items/armor/ancient/legend_mummy_bandages",
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
		ID = "ancient/legend_mummy_plate",
		Script = "scripts/items/armor/ancient/legend_mummy_plate",
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
		ID = "legend_armor_plate_ancient_scale_coat_restored",
		Script = "scripts/items/armor/ancient/legend_armor_plate_ancient_scale_coat_restored",
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
		ID = "legend_armor_plate_ancient_scale_harness_restored",
		Script = "scripts/items/armor/ancient/legend_armor_plate_ancient_scale_harness_restored",
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
		ID = "ancient/legend_mummy_royal_plate",
		Script = "scripts/items/armor/ancient/legend_mummy_royal_plate",
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

