this.legend_fear_dark_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.legend_fear_dark";
		this.m.Name = "Nyctophobia";
		this.m.Icon = "ui/traits/trait_fearofdark.png";
		this.m.Description = "A dislike of the dark can be a childish fear for some, but with what\'s been running around in the wilds lately, maybe it isn\'t as odd anymore...";
		this.m.Excluded = [
			"trait.fearless",
			"trait.brave",
			"trait.night_owl"
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
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10[/color] Resolve during Nighttime"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-20[/color] Resolve when attacked by mental effects during Nighttime"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Resolve during daytime"
			}
		];
	}

	function onUpdate( _properties )
	{
		if (this.getContainer().hasSkill("special.night") && _properties.IsAffectedByNight == true)
		{
			_properties.Bravery -= 10;
			_properties.MoraleCheckBravery[::Const.MoraleCheckType.MentalAttack] -= 20;
		}
		else
		{
			_properties.Bravery += 5;
		}
	}

});

