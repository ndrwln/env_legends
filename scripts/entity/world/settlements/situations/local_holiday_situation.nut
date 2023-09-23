this.local_holiday_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.local_holiday";
		this.m.Name = "Local Holiday";
		this.m.Description = "A local holiday has the people in a generous mood. Time for food and drink!";
		this.m.Icon = "ui/settlement_status/settlement_effect_22.png";
		this.m.Rumors = [
			"If you\'re looking to have a good time, head on over to %settlement% and join their celebration! Boy, I wish I could be there.",
			"You don\'t look quite like the festive type, if I might say so, but perhaps your men would enjoy some food and drink. Alas, both can be found aplenty in %settlement%, as they\'re celebrating some holiday over there.",
			"The good folks over in %settlement% are having their annual holiday right now. I\'d be there drinking and eating and all, if only I had the crowns. Mind getting me another ale, friend?"
		];
		this.m.IsStacking = false;
		this.m.ValidDays = 2;
	}

	function getAddedString( _s )
	{
		return _s + " now has a " + this.m.Name;
	}

	function getRemovedString( _s )
	{
		return _s + " no longer has a " + this.m.Name;
	}

	function onAdded( _settlement )
	{
		if (::Legends.Mod.ModSettings.getSetting("WorldEconomy").getValue())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * -0.01);
		}

		_settlement.resetShop();
	}

	function onUpdate( _modifiers )
	{
		_modifiers.SellPriceMult *= 1.05;
		_modifiers.BuyPriceMult *= 0.95;
		_modifiers.FoodRarityMult *= 1.5;
		_modifiers.FoodPriceMult *= 0.9;
	}

});

