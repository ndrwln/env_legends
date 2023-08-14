this.legends_skeleton_med_archer <- this.inherit("scripts/entity/tactical/legend_skeleton", {
	m = {},
	function onInit()
	{
		this.m.SpawnType = this.Const.Tactical.Actor.LegendSkeletonMediumArcher;
		this.legend_skeleton.onInit();
		this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_mastery_bow"));
		this.m.Skills.add(this.new("scripts/skills/traits/legend_fleshless_trait"));

		if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
		}

		this.m.Skills.update();
	}

	function assignRandomEquipment()
	{
		this.m.Items.equip(this.new("scripts/items/weapons/hunting_bow"));
		this.m.Items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		this.m.Items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"ancient/ancient_scale_harness"
			],
			[
				1,
				"ancient/ancient_breastplate"
			],
			[
				1,
				"ancient/ancient_mail"
			],
			[
				1,
				"ancient/ancient_double_layer_mail"
			]
		]));
		local item = this.Const.World.Common.pickHelmet([
			[
				34,
				""
			],
			[
				66,
				"ancient/ancient_household_helmet"
			]
		]);

		if (item != null)
		{
			this.m.Items.equip(item);
		}
	}

});

