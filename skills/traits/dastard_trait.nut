this.dastard_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.dastard";
		this.m.Name = "Dastard";
		this.m.Icon = "ui/traits/trait_icon_38.png";
		this.m.Description = "This character will turn tail on the first possible occasion. Better have an eye on them!";
		this.m.Titles = [
			"the Coward",
			"the Craven",
			"the Chicken"
		];
		this.m.Excluded = [
			"trait.determined",
			"trait.brave",
			"trait.deathwish",
			"trait.bloodthirsty",
			"trait.fearless",
			"trait.cocky",
			"trait.optimist",
			"trait.hate_greenskins",
			"trait.hate_undead",
			"trait.hate_beasts",
			"trait.hate_nobles",
			"trait.aggressive",
			"trait.pragmatic",
			"trait.ambitious",
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
				icon = "ui/icons/morale.png",
				text = "Will start combat at wavering morale"
			},
			{
				id = 16,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Is always content with being in reserve"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.IsContentWithBeingInReserve = true;
	}

	function onCombatStarted()
	{
		local actor = this.getContainer().getActor();

		if (actor.getMoodState() >= this.Const.MoodState.Disgruntled && actor.getMoraleState() > this.Const.MoraleState.Wavering)
		{
			actor.setMoraleState(this.Const.MoraleState.Wavering);
		}
	}

});

