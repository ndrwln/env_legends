this.public_executions_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.public_executions";
		this.m.Name = "Public Executions";
		this.m.Description = "A public execution is not to be missed and provides entertainment for the whole family. Food and drink are abundant during such an occasion, but merchants may also try to take advantage of spectators.";
		this.m.Icon = "ui/settlement_status/settlement_effect_14.png";
		this.m.Rumors = [
			"A whole bunch of folks is headin\' over to %settlement% for the big spectacle! Men, womenfolk, young ones, all on the road to see the upcoming executions!",
			"I heard they grabbed some brigands near %settlement% and are putting them to the chopping block. Serves them just right, waylaying poor folk on the roads...",
			"Us poor folks don\'t have much to enjoy these days, but a good hanging is always welcome. Hasn\'t been one here since autumn, but they is hanging folk over at %settlement% is what %randomname% tells me."
		];
		this.m.IsStacking = false;
		this.m.ValidDays = 2;
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
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * 0.025);
		}

		_settlement.resetShop();
	}

	function onUpdate( _modifiers )
	{
		_modifiers.FoodRarityMult *= 1.35;
		_modifiers.FoodPriceMult *= 1.15;
	}

});

