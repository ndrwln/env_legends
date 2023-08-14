this.conquered_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.conquered";
		this.m.Name = "Conquered";
		this.m.Description = "This place has recently been conquered. Many lives were lost, and the survivors had to endure the conquerors taking their spoils of war. Much of the settlement is still damaged, and spirits are low.";
		this.m.Icon = "ui/settlement_status/settlement_effect_02.png";
		this.m.Rumors = [
			"%settlement% was recently captured, or so I have heard. \'New Lords - same shit\' is what I always say...",
			"Conquering new lands is the game of nobles. I heard they just sacked %settlement%.",
			"Oh, hey sellsword! Were you at the siege of %settlement%? Well, fucking congratulations. How many did you kill? How many did you rape? "
		];
		this.m.IsStacking = false;
	}

	function onAdded( _settlement )
	{
		if (::Legends.Mod.ModSettings.getSetting("WorldEconomy").getValue())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * -0.2);
		}

		_settlement.resetShop();
	}

	function onUpdate( _modifiers )
	{
		_modifiers.SellPriceMult *= 0.9;
		_modifiers.BuyPriceMult *= 1.1;
		_modifiers.RarityMult *= 0.6;
		_modifiers.FoodRarityMult *= 0.9;
	}

	function onUpdateDraftList( _draftList, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("cripple_background");
		_draftList.push("cripple_background");
		_draftList.push("vagabond_background");
		_draftList.push("gravedigger_background");
		_draftList.push("gravedigger_background");
		_draftList.push("beggar_background");
		_draftList.push("beggar_background");
		_draftList.push("beggar_background");

		if (this.World.Assets.getOrigin().getID() == "scenario.legends_necro")
		{
			_draftList.push("legend_puppet_background");
			_draftList.push("legend_puppet_background");
			_draftList.push("legend_puppet_background");
			_draftList.push("legend_puppet_background");
		}

		if (_gender)
		{
			_draftList.push("female_beggar_background");
			_draftList.push("female_beggar_background");
			_draftList.push("female_beggar_background");
			_draftList.push("female_thief_background");
		}
	}

});

