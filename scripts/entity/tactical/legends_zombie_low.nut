this.legends_zombie_low <- this.inherit("scripts/entity/tactical/legend_zombie", {
	m = {},
	function onInit()
	{
		this.m.SpawnType = this.Const.Tactical.Actor.LegendZombieLight;
		this.legend_zombie.onInit();
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fast_adaption"));
		this.m.Skills.add(this.new("scripts/skills/actives/zombie_bite"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_nine_lives"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_poison_immunity"));

		if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.BaseProperties.Hitpoints *= 1.5;
			this.m.Hitpoints *= 1.5;
			this.m.Skills.add(this.new("scripts/skills/perks/perk_last_stand"));
		}

		this.m.Skills.update();
	}

	function assignRandomEquipment()
	{
		local r = this.Math.rand(1, 7);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/legend_militia_glaive"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/militia_spear"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/legend_glaive"));
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/ancient/ancient_spear"));
		}
		else if (r == 5)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/legend_wooden_spear"));
		}
		else if (r == 6)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/legend_sickle"));
		}
		else if (r == 7)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/legend_hammer"));
		}

		local r = this.Math.rand(1, 2);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/shields/wooden_shield"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/shields/wooden_shield_old"));
		}

		this.m.Items.equip(this.Const.World.Common.pickArmor([
			[
				4,
				"leather_tunic"
			],
			[
				4,
				"linen_tunic"
			],
			[
				3,
				"sackcloth"
			],
			[
				3,
				"padded_surcoat"
			],
			[
				2,
				"leather_wraps"
			],
			[
				2,
				"monk_robe"
			],
			[
				2,
				"apron"
			],
			[
				2,
				"butcher_apron"
			],
			[
				1,
				"cultist_leather_robe"
			]
		]));
		local item = this.Const.World.Common.pickHelmet([
			[
				67,
				""
			],
			[
				7,
				"hood"
			],
			[
				7,
				"straw_hat"
			],
			[
				7,
				"aketon_cap"
			],
			[
				7,
				"full_aketon_cap"
			],
			[
				7,
				"open_leather_cap"
			],
			[
				7,
				"full_leather_cap"
			],
			[
				4,
				"headscarf"
			],
			[
				4,
				"cultist_hood"
			],
			[
				4,
				"witchhunter_hat"
			],
			[
				1,
				"cultist_leather_hood"
			]
		]);

		if (item != null)
		{
			this.m.Items.equip(item);
		}
	}

});

