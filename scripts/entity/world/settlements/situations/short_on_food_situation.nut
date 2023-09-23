this.short_on_food_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.short_on_food";
		this.m.Name = "Short on Food";
		this.m.Description = "Recent events have left this place short on food. As people are on the verge of starving, food is hard to come by and prices are on the rise.";
		this.m.Icon = "ui/settlement_status/settlement_effect_04.png";
		this.m.Rumors = [
			"The men and women in %settlement% are starving, I heard, with nothing but dirt to eat. I don\'t think I\'ll ever complain about my mouldy grain soup again!",
			"Some farmer just arrived today from %settlement%. Told stories of slain cattle, burned fields and empty larders. Looked like a damn walking skeleton himself!"
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
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * -0.05);
		}

		_settlement.resetShop();
	}

	function onUpdate( _modifiers )
	{
		_modifiers.FoodRarityMult *= 0.5;
		_modifiers.FoodPriceMult *= 3.0;
	}

	function onUpdateDraftList( _draftList, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";

		if (this.World.Assets.getOrigin().getID() == "scenario.legends_necro")
		{
			_draftList.push("legend_puppet_background");
		}
	}

});

