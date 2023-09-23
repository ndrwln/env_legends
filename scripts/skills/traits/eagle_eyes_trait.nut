this.eagle_eyes_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.eagle_eyes";
		this.m.Name = "Eagle Eyes";
		this.m.Icon = "ui/traits/trait_icon_09.png";
		this.m.Description = "Blessed with the eyes of an eagle, this character can spot a fly from a hundred paces away.";
		this.m.Excluded = [
			"trait.short_sighted",
			"trait.night_blind"
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
				icon = "ui/icons/vision.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+1[/color] Vision"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.Vision += 1;
	}

});

