this.full_nets_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.full_nets";
		this.m.Name = "Full Nets";
		this.m.Description = "The waters are teeming with swarms of fish. Fresh Fish is abundant and cheaply available.";
		this.m.Icon = "ui/settlement_status/settlement_effect_19.png";
		this.m.Rumors = [
			"This time o\' year large schools of fish always come by %settlement%. All they need do is throw some nets into the water and then pull out more fish than they could ever eat! Lucky bastards!",
			"Tomorrow I\'ll head out to %settlement% and fill my carts with fish. Rumor has it the fishermen over there hit a lucky streak!",
			"You in the trading business? I hear they have their nets filled to the brim with fish over at %settlement%."
		];
		this.m.IsStacking = false;
		this.m.ValidDays = 3;
	}

	function getAddedString( _s )
	{
		return _s + " has " + this.m.Name;
	}

	function getRemovedString( _s )
	{
		return _s + " no longer has " + this.m.Name;
	}

	function onAdded( _settlement )
	{
		if (::Legends.Mod.ModSettings.getSetting("WorldEconomy").getValue())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * 0.1);
		}

		_settlement.resetShop();
	}

	function onUpdate( _modifiers )
	{
		_modifiers.FoodRarityMult *= 2.0;
		_modifiers.FoodPriceMult *= 0.5;
	}

	function onUpdateDraftList( _draftList, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";
		_draftList.push("fisherman_background");
		_draftList.push("fisherman_background");
		_draftList.push("fisherman_background");
		_draftList.push("fisherman_background");
		_draftList.push("fisherman_background");
		_draftList.push("fisherman_background");

		if (_gender)
		{
			_draftList.push("female_butcher_background");
			_draftList.push("female_butcher_background");
			_draftList.push("female_butcher_background");
		}
	}

});

