this.light_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.light";
		this.m.Name = "Light";
		this.m.Icon = "ui/traits/light_trait.png";
		this.m.Description = "Being exceptionally light, this character\'s strikes don\'t really hurt, however they\'re also extremely fast.";
		this.m.Titles = [
			"the Feather",
			"the Rabbit",
			"the Lightning"
		];
		this.m.Excluded = [
			"trait.huge",
			"trait.strong",
			"trait.tough",
			"trait.brute",
			"trait.iron_jaw",
			"trait.hesitant",
			"trait.gluttonous",
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
				icon = "ui/icons/regular_damage.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10%[/color] Melee Damage"
			},
			{
				id = 12,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+20[/color] Initiative"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.MeleeDamageMult *= 0.9;
		_properties.Initiative += 20;
	}

});

