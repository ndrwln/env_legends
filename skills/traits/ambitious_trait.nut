this.ambitious_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.ambitious";
		this.m.Name = "Ambitious";
		this.m.Icon = "ui/traits/ambitious_trait.png";
		this.m.Description = "Determined to be a hero.";
		this.m.Titles = [
			"the Talented",
			"the Smart",
			"the Future",
			"the Thirsty",
			"the Hope"
		];
		this.m.Excluded = [
			"trait.weasel",
			"trait.insecure",
			"trait.craven",
			"trait.hesitant",
			"trait.dastard",
			"trait.fainthearted",
			"trait.paranoid",
			"trait.fear_beasts",
			"trait.fear_undead",
			"trait.fear_greenskins",
			"trait.fear_nobles",
			"trait.slack",
			"trait.irrational",
			"trait.pessimist"
		];
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] Initiative"
			},
			{
				id = 12,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] Resolve"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5%[/color] Experience Gain"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.XPGainMult *= 1.05;
		_properties.Bravery += 3;
		_properties.Initiative += 3;
	}

});

