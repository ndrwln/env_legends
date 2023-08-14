this.gift_of_people_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.gift_of_people";
		this.m.Name = "Charming";
		this.m.Icon = "ui/traits/trait_gift_of_people.png";
		this.m.Description = "Some say you can get almost anywhere with a trustworthy demenor and a warm smile.";
		this.m.Excluded = [
			"trait.pessimist",
			"trait.insecure",
			"trait.dastard",
			"trait.double_tongued"
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
				icon = "ui/icons/morale.png",
				text = "Has a [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] chance to boost up company morale at the start of a combat"
			}
		];
	}

	function onCombatStarted()
	{
		this.skill.onCombatStarted();

		if (this.Math.rand(1, 10) < 10)
		{
			return;
		}

		local allies = this.Tactical.Entities.getInstancesOfFaction(this.getContainer().getActor().getFaction());
		local ownID = this.getContainer().getActor().getID();

		foreach( ally in allies )
		{
			if (ally.getID() == ownID)
			{
				continue;
			}

			local ally_morale = ally.getMoraleState();

			if (ally_morale < this.Const.MoraleState.Confident)
			{
				ally.setMoraleState(ally_morale + 1);
			}
		}
	}

});

