this.rich_veins_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.rich_veins";
		this.m.Name = "Rich Veins";
		this.m.Description = "Some lucky miner struck a particularly rich vein! Extraction of minerals and metals will be greatly increased until it is exhausted, but the settlement also experiences an inflation of prices.";
		this.m.Icon = "ui/settlement_status/settlement_effect_33.png";
		this.m.Rumors = [
			"They struck a mother lode over in %settlement%. I myself worked the mines for decades, too, and all I got to show for it is a bad cough.",
			"Those lucky bastards in %settlement% have found a new vein in the mine. Caravans can\'t come fast enough now with what they\'re shoveling up.",
			"I hear that the mines in %settlement% are awfully productive these days. Not a bad way to make some coin if you\'re in the trading business."
		];
		this.m.IsStacking = false;
		this.m.ValidDays = 4;
	}

	function getAddedString( _s )
	{
		return _s + " had " + this.m.Name;
	}

	function getRemovedString( _s )
	{
		return _s + " no longer has " + this.m.Name;
	}

	function onAdded( _settlement )
	{
		if (::Legends.Mod.ModSettings.getSetting("WorldEconomy").getValue())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * 0.25);
		}

		_settlement.resetShop();
	}

	function onUpdate( _modifiers )
	{
		_modifiers.SellPriceMult *= 1.1;
		_modifiers.BuyPriceMult *= 1.1;
		_modifiers.MineralRarityMult = 1.5;
	}

	function onUpdateDraftList( _draftList, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("legend_ironmonger_background");
		_draftList.push("legend_ironmonger_background");
		_draftList.push("legend_blacksmith_background");
	}

});

