this.warehouse_burned_down_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.warehouse_burned_down";
		this.m.Name = "Warehouse Burned Down";
		this.m.Description = "A recent fire in a warehouse caused significant damage. What survived the fire is now sold at high prices.";
		this.m.Icon = "ui/settlement_status/settlement_effect_21.png";
		this.m.Rumors = [
			"Seen the smoke on the horizon last night? They say it was the big warehouse in %settlement% burning down to the ground.",
			"I heard they caught the arsonist lighting the warehouse up in %settlement%. Hanged him from a tree right then and now, but it\'ll take them a lot longer to build up the warehouse again."
		];
		this.m.IsStacking = false;
		this.m.ValidDays = 5;
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
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * -0.01);
		}

		_settlement.resetShop();
	}

	function onUpdate( _modifiers )
	{
		_modifiers.BuyPriceMult *= 1.25;
		_modifiers.SellPriceMult *= 1.05;
		_modifiers.RarityMult *= 0.5;
	}

});

