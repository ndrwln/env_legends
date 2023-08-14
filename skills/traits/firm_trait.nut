this.firm_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.firm";
		this.m.Name = "Martial";
		this.m.Icon = "ui/traits/firm_trait.png";
		this.m.Description = "Better not shake a hand with this one.";
		this.m.Titles = [
			"the Steady",
			"the Nail",
			"the Iron"
		];
		this.m.Excluded = [
			"trait.bleeder",
			"trait.ailing",
			"trait.frail",
			"trait.fragile"
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
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5%[/color] Melee Damage"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.MeleeDamageMult *= 1.05;
	}

});

