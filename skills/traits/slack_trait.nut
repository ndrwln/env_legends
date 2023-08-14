this.slack_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.slack";
		this.m.Name = "Slack";
		this.m.Icon = "ui/traits/slack_trait.png";
		this.m.Description = "Doesn\'t really care what you are doing. Just here for salary and food.";
		this.m.Titles = [
			"the Slack",
			"the Lazy"
		];
		this.m.Excluded = [
			"trait.loyal",
			"trait.brave",
			"trait.fearless",
			"trait.quick",
			"trait.teamplayer",
			"trait.impatient",
			"trait.ambitious",
			"trait.aggressive",
			"trait.natural"
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
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-3[/color] Initiative"
			},
			{
				id = 12,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-3[/color] Resolve"
			},
			{
				id = 13,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-5%[/color] Experience Gain"
			},
			{
				id = 14,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Is always content with being in reserve"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.IsContentWithBeingInReserve = true;
		_properties.XPGainMult *= 0.95;
		_properties.Bravery -= 3;
		_properties.Initiative -= 3;
	}

});

