this.arena_pit_fighter_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pit_fighter";
		this.m.Name = "Pit Fighter";
		this.m.Icon = "ui/traits/trait_icon_73.png";
		this.m.Description = "This character has just dipped their toes into the brutal profession of arena fighting and did so without dying.";
		this.m.Order = this.Const.SkillOrder.Trait - 1;
	}

	function getTooltip()
	{
		local matches = this.getContainer().getActor().getFlags().getAsInt("ArenaFights");
		local won = this.getContainer().getActor().getFlags().getAsInt("ArenaFightsWon");
		local text;

		if (matches == 1)
		{
			text = " So far, this character has fought in one match";

			if (won == 1)
			{
				text = text + " and won it.";
			}
			else
			{
				text = text + " but lost it.";
			}
		}
		else
		{
			if (won == matches)
			{
				won = "all";
			}

			text = " So far, this character has fought in " + matches + " matches and won " + won + " of them.";
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
				text = this.getDescription() + text
			}
		];
	}

});

