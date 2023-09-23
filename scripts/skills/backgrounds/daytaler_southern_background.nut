this.daytaler_southern_background <- this.inherit("scripts/skills/backgrounds/daytaler_background", {
	m = {},
	function create()
	{
		this.daytaler_background.create();
		this.m.Bodies = this.Const.Bodies.SouthernSkinny;
		this.m.Faces = this.Const.Faces.SouthernMale;
		this.m.Hairs = this.Const.Hair.SouthernMale;
		this.m.HairColors = this.Const.HairColors.Southern;
		this.m.Beards = this.Const.Beards.SouthernUntidy;
		this.m.Ethnicity = 1;
		this.m.BeardChance = 90;
		this.m.Excluded = [
			"trait.superstitious",
			"trait.fear_undead",
			"trait.hate_beasts",
			"trait.hate_undead",
			"trait.hate_greenskins",
			"trait.hate_nobles"
		];
		this.m.Names = this.Const.Strings.SouthernNames;
		this.m.LastNames = this.Const.Strings.SouthernNamesLast;
	}

	function onBuildDescription()
	{
		return "{Working here and there | With no steady work | Working on and off | Doing this and that | Having learned no craft}, %name% is known as a daytaler, someone to ask whenever an extra hand is needed. {Work had been sparse for a while now, so | There was little work to be a had these past weeks, so | %name% wanted to do something he had not done before, so | Despite having no experience in battle, staring too deep into the bottle made him believe that | %name% considered the fighting profession one that doesn\'t run out of work these days, so | %name% lost his loved one to sickness, as befalls so many these days, and broke down. After weeks blurred by drinking his sorrows away,} a travelling mercenary company seemed a good opportunity {to stay with for a while | to earn some coin | to see a bit of the world | to clear his head | to get him to the next village while filling his pockets}.";
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/knife"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/wooden_stick"));
		}

		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"sackcloth"
			],
			[
				1,
				"oriental/cloth_sash"
			]
		]));
		local helm = this.Const.World.Common.pickHelmet([
			[
				3,
				""
			],
			[
				1,
				"oriental/southern_head_wrap"
			]
		]);
		items.equip(helm);
	}

});

