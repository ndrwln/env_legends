this.caravan_hand <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.CaravanHand;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.CaravanHand.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/caravan_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.CaravanHand);
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_caravan");
		this.getSprite("dirt").Visible = true;
		this.m.Skills.add(this.new("scripts/skills/perks/perk_recover"));

		if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_bash"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_pathfinder"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_alert"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
		}
	}

	function assignRandomEquipment()
	{
		local r = this.Math.rand(1, 9);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/dagger"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/knife"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/wooden_stick"));
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/hatchet"));
		}
		else if (r == 5)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/bludgeon"));
		}
		else if (r == 6)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/militia_spear"));
		}
		else if (r == 7)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/scramasax"));
		}
		else if (r == 8)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/shortsword"));
		}
		else if (r == 9)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/legend_militia_glaive"));
		}

		if (this.Math.rand(1, 100) <= 33)
		{
			this.m.Items.equip(this.new("scripts/items/shields/buckler_shield"));
		}

		local item = this.Const.World.Common.pickArmor([
			[
				1,
				"leather_tunic",
				this.Math.rand(6, 7)
			],
			[
				1,
				"padded_leather"
			],
			[
				1,
				"padded_surcoat"
			],
			[
				1,
				"leather_lamellar"
			]
		]);
		this.m.Items.equip(item);

		if (this.Math.rand(1, 100) <= 33)
		{
			local item = this.Const.World.Common.pickHelmet([
				[
					1,
					"hood"
				],
				[
					1,
					"aketon_cap"
				]
			]);

			if (item != null)
			{
				this.m.Items.equip(item);
			}
		}
	}

});

