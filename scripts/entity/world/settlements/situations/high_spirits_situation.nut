this.high_spirits_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.high_spirits";
		this.m.Name = "High Spirits";
		this.m.Description = "Spirits are high here, and people are eager to do business with you.";
		this.m.Icon = "ui/settlement_status/settlement_effect_05.png";
		this.m.Rumors = [
			"I arrived from %settlement% today, my clothes are still dusty from the road. The folks over there surely were in a good mood, not quite sure why though...",
			"No need to get me a mug, I am still drunk from the celebrations in %settlement%. They sure know how to have a good time!",
			"Rumor has it that the townsfolk of %settlement% just got an important relic back."
		];
		this.m.IsStacking = false;
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
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * 0.01);
		}

		_settlement.resetShop();
	}

	function onUpdate( _modifiers )
	{
		_modifiers.SellPriceMult *= 1.05;
		_modifiers.BuyPriceMult *= 0.95;
		_modifiers.RarityMult *= 1.1;
	}

});

