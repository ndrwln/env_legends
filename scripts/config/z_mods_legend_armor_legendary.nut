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
		ID = "legendary/armor_of_davkul",
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
						"cloth/legend_sackcloth_tattered"
					],
					[
						1,
						"cloth/legend_sackcloth"
					]
				],
				Chain = [
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
						"plate/davkul"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "legendary/emperors_armor",
		Script = "scripts/items/legend_armor/legendary/legend_emperors_armor",
		Sets = [
			{
				Cloth = [
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
						"legendary/emperors_armor"
					]
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "legendary/emperors_armor_fake",
		Script = "scripts/items/legend_armor/legendary/legend_emperors_armor_fake",
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
		ID = "legendary/ijirok_armor",
		Script = "scripts/items/legend_armor/legendary/legend_ijirok_armor",
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
		ID = "legendary/legend_mountain_armor",
		Script = "scripts/items/legend_armor/legendary/legend_armor_mountain_named",
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
		ID = "legendary/legend_skin_armor",
		Script = "scripts/items/legend_armor/legendary/legend_skin_armor",
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
		ID = "named/legend_named_warlock_cloak",
		Script = "scripts/items/legend_armor/legendary/legend_armor_named_warlock_cloak",
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
		ID = "named/lindwurm_armor",
		Script = "scripts/items/legend_armor/legendary/legend_lindwurm_armor",
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

