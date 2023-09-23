this.bread_and_games_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.bread_and_games";
		this.m.Name = "Bread and Games";
		this.m.Description = "The city council ordered a time of food, drink and games for everyone to keep the population happy. Food and drink are easy to come by, gladiators are flocking to the city, and arena fights pay more than usual.";
		this.m.Icon = "ui/settlement_status/settlement_effect_39.png";
		this.m.Rumors = [
			"Praise the wise council of %settlement%! A time of food, drink and games is upon us!",
			"Ever been to the famed games of the south? Head to %settlement% and see for yourself the glory of the festivities!",
			"All the hard work through the year and for what? I will tell you: Food, drink and games! I will head out to %settlement% to join in, and so should you."
		];
		this.m.IsStacking = false;
		this.m.ValidDays = 3;
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
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * 0.02);
		}

		_settlement.resetShop();
		_settlement.resetRoster(true);
	}

	function onUpdate( _modifiers )
	{
		_modifiers.FoodRarityMult *= 1.5;
		_modifiers.FoodPriceMult *= 0.9;
	}

	function onUpdateDraftList( _draftList, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";
		_draftList.push("gladiator_background");
		_draftList.push("gladiator_background");
		_draftList.push("gladiator_background");
		_draftList.push("gladiator_background");
		_draftList.push("gladiator_background");
		_draftList.push("gladiator_background");
		_draftList.push("gladiator_background");
		_draftList.push("gladiator_background");
		_draftList.push("gladiator_background");
	}

});

