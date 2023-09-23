this.frail_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.frail";
		this.m.Name = "Frail";
		this.m.Icon = "ui/traits/frail_trait.png";
		this.m.Description = "Weak and loose. Has to work hard to become a real warrior.";
		this.m.Titles = [
			"the Weak",
			"the Feeble"
		];
		this.m.Excluded = [
			"trait.quick",
			"trait.huge",
			"trait.tough",
			"trait.strong",
			"trait.brawler",
			"trait.brute",
			"trait.natural",
			"trait.iron_jaw",
			"trait.natural",
			"trait.firm",
			"trait.heavy"
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
				icon = "ui/icons/health.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-3[/color] Hitpoints"
			},
			{
				id = 12,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-3[/color] Fatigue"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-5%[/color] Experience Gain"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.XPGainMult *= 0.95;
		_properties.Hitpoints -= 3;
		_properties.Stamina -= 3;
	}

});

