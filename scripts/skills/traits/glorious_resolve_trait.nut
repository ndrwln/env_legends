this.glorious_resolve_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.glorious";
		this.m.Name = "Glorious Resolve";
		this.m.Icon = "ui/traits/trait_icon_72.png";
		this.m.Description = "Forged in the arenas of the south, this character has fought man and beast alike, and it takes a lot to break their resolve. This fabulous lifestyle demands high pay, but they\'ll never desert you  and can\'t be dismissed. If all three original members should die, your campaign ends.";
		this.m.Order = this.Const.SkillOrder.Trait - 1;
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
				icon = "ui/icons/special.png",
				text = "Re-roll every failed morale check for a second chance"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.RerollMoraleChance = 100;
	}

});

