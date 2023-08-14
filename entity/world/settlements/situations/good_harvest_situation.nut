this.good_harvest_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.good_harvest";
		this.m.Name = "Good Harvest";
		this.m.Description = "Conditions for crops have been perfect. Food is readily available and offered at lower prices.";
		this.m.Icon = "ui/settlement_status/settlement_effect_17.png";
		this.m.Rumors = [
			"Head over to %settlement% if you need to restock on food. Those lucky bastards have had themselves a bountiful harvest season this year.",
			"I came here from %settlement% to sell our extra produce. The gods have been smiling on us and granted us the best harvest in many years!",
			"I just learned that in %settlement% the granaries and larders are filled to the brim thanks to a good harvest. "
		];
		this.m.IsStacking = false;
		this.m.ValidDays = 7;
	}

	function getAddedString( _s )
	{
		return _s + " benefits from a " + this.m.Name;
	}

	function getRemovedString( _s )
	{
		return _s + " no longer benefits from a " + this.m.Name;
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
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("miller_background");
		_draftList.push("miller_background");
		_draftList.push("legend_herbalist_background");

		if (_gender)
		{
			_draftList.push("female_farmhand_background");
			_draftList.push("female_farmhand_background");
			_draftList.push("female_miller_background");
			_draftList.push("female_miller_background");
		}
	}

});

