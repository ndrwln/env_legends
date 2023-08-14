this.arena_fighter_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.arena_fighter";
		this.m.Name = "Arena Fighter";
		this.m.Icon = "ui/traits/trait_icon_74.png";
		this.m.Description = "Hearing a crowd chant your name can be addicting. This character is starting to enjoy the deadly fights of the arena and dispatching opponents in a way that entertains the crowds.";
		this.m.Order = this.Const.SkillOrder.Trait - 1;
	}

	function getTooltip()
	{
		local matches = this.getContainer().getActor().getFlags().getAsInt("ArenaFights");
		local won = this.getContainer().getActor().getFlags().getAsInt("ArenaFightsWon");

		if (won == matches)
		{
			won = "all";
		}

		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription() + " So far, this character has fought in " + matches + " matches and won " + won + " of them."
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Resolve"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.Bravery += 5;
	}

});

