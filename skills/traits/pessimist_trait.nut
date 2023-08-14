this.pessimist_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pessimist";
		this.m.Name = "Pessimist";
		this.m.Icon = "ui/traits/trait_icon_20.png";
		this.m.Description = "The glass is definitely half empty.";
		this.m.Excluded = [
			"trait.optimist",
			"trait.irrational",
			"trait.cocky",
			"trait.determined",
			"trait.survivor",
			"trait.aggressive",
			"trait.pragmatic",
			"trait.ambitious",
			"trait.unpredictable",
			"trait.natural",
			"trait.gift_of_people"
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
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-5[/color] Resolve at negative morale checks"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Good mood fades away faster"
			}
		];
	}

});

