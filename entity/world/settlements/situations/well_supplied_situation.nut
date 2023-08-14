this.well_supplied_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.well_supplied";
		this.m.Name = "Well Supplied";
		this.m.Description = "This place has been recently supplied with fresh wares, and many of those can now be bought for the right price.";
		this.m.Icon = "ui/settlement_status/settlement_effect_03.png";
		this.m.Rumors = [
			"Trade with %settlement% is prospering, my friend! Safe roads and full stocks, let\'s hope it stays this way...",
			"My cousin over in %settlement% keeps bragging about how good they have it there. Well stocked market stands and all. Not like this rotten place."
		];
		this.m.IsStacking = false;
	}

	function getAddedString( _s )
	{
		return _s + " now is " + this.m.Name;
	}

	function getRemovedString( _s )
	{
		return _s + " no longer is " + this.m.Name;
	}

	function onAdded( _settlement )
	{
		if (::Legends.Mod.ModSettings.getSetting("WorldEconomy").getValue())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * 0.015);
		}

		_settlement.removeSituationByID("situation.ambushed_trade_routes");
		_settlement.resetShop();
	}

	function onUpdate( _modifiers )
	{
		_modifiers.PriceMult *= 0.9;
		_modifiers.RarityMult *= 1.5;
	}

});

