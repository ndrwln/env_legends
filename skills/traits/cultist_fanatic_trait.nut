this.cultist_fanatic_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.cultist_fanatic";
		this.m.Name = "Fanatic of Davkul";
		this.m.Icon = "ui/traits/trait_icon_64.png";
		this.m.Description = "This character is a fanatic follower of Davkul, believing that Davkul embraces all in death.";
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
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Resolve"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/morale.png",
				text = "No morale check triggered upon allies dying"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.Bravery += 5;
		_properties.IsAffectedByDyingAllies = false;
	}

});

