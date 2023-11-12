this.disappearing_villagers_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.disappearing_villagers";
		this.m.Name = "Disappearing Villagers";
		this.m.Description = "Villagers have been disappearing from this town, putting everyone on edge. Fewer locals are to be found on the streets, the belongings of the disappeared have somehow appeared in the markets. Enterprising Ratcatchers and Beast Slayers have also turned up, offering to hunt down the beasts plaguing the settlement in exchange for coin.";
		this.m.Icon = "ui/settlement_status/settlement_effect_11.png";
		this.m.Rumors = [
			"I just cancelled my visit to %settlement% after I heard that people go missing over there. Staying out of trouble served me well so far!",
			"Me neighbour %randomname% went to %settlement% \'bout a week ago. Haven\'t heard a word of him since. I just hope nothing happened to him, you know, with them brigands and monsters and all roaming \'bout...",
			"The forces of evil are strong in this world. They hide in the woods, and in the mountains, and in the shadows, and sometimes folk just disappear without a trace. It\'s happening again right now over in %settlement%.",
			"If ye are of the beast hunting sort, there\'s been talk of crowns to be made at %settlement% on account of the beast attacks there. Why, many a ratcatcher or so-called beast slayer has stopped by here on their way there. Fools, all of them!"
		];
	}

	function getAddedString( _s )
	{
		return _s + " now has " + this.m.Name;
	}

	function getRemovedString( _s )
	{
		return _s + " no longer has " + this.m.Name;
	}

	function onAdded( _settlement )
	{
		if (::Legends.Mod.ModSettings.getSetting("WorldEconomy").getValue())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * -0.025);
		}

		_settlement.resetShop();
		_settlement.resetRoster(true);

		if (::Math.rand(1, 10) == 1)
		{
			_settlement.addSituation(this.new("scripts/entity/world/settlements/situations/legend_militant_townsfolk_situation"), this.getDefaultDays() + ::Math.rand(1, 3));
		}
	}

	function onResolved( _settlement )
	{
		if (::Legends.Mod.ModSettings.getSetting("WorldEconomy").getValue())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * 0.125);
		}
	}

	function onUpdate( _modifiers )
	{
		_modifiers.SellPriceMult *= 0.75;
		_modifiers.RarityMult *= 1.1;
		_modifiers.RecruitsMult *= 0.7;
	}

	function onUpdateDraftList( _draftList, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";

		if (this.World.Assets.getOrigin().getID() == "scenario.legends_necro")
		{
			_draftList.push("legend_puppet_background");
			_draftList.push("legend_puppet_background");
		}

		_draftList.push("ratcatcher_background");
		_draftList.push("ratcatcher_background");
		_draftList.push("ratcatcher_background");
		_draftList.push("ratcatcher_background");
		_draftList.push("beast_hunter_background");
		_draftList.push("beast_hunter_background");
	}

});

