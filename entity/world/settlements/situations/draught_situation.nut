this.draught_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.draught";
		this.m.Name = "Drought";
		this.m.Description = "An unexpected heatwave burnt many of the local crops. There is less food available and prices are higher.";
		this.m.Icon = "ui/settlement_status/settlement_effect_16.png";
		this.m.Rumors = [
			"A terrible drought is ailing %settlement% from what I hear. It\'s always been hard for the folks over there, but this time it\'s dire.",
			"If you are as reckless as you look, you might make a quick crown selling food in %settlement%. A harsh drought has the people starving, so they\'ll pay anything to get something between their teeth.",
			"Oh, son, I used to be a rainmaker over in %settlement%, but the fools chased me off! Now, admittedly, the village was suffering from a draught, but isn\'t that all the more reason to rely on me? Fools, I say!"
		];
		this.m.IsStacking = false;
		this.m.ValidDays = 7;
	}

	function getAddedString( _s )
	{
		return _s + " suffers from a " + this.m.Name;
	}

	function getRemovedString( _s )
	{
		return _s + " no longer suffers from a " + this.m.Name;
	}

	function onAdded( _settlement )
	{
		if (::Legends.Mod.ModSettings.getSetting("WorldEconomy").getValue())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * -0.1);
		}

		_settlement.resetShop();
	}

	function onUpdate( _modifiers )
	{
		_modifiers.FoodRarityMult *= 0.5;
		_modifiers.FoodPriceMult *= 2.0;
	}

	function onUpdateDraftList( _draftList, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");
		_draftList.push("farmhand_background");

		if (this.World.Assets.getOrigin().getID() == "scenario.legends_necro")
		{
			_draftList.push("legend_puppet_background");
		}
	}

});

