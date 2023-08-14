this.refugees_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.refugees";
		this.m.Name = "Refugees";
		this.m.Description = "With the war raging, a constant stream of refugees is pouring into this settlement. It puts a strain on local economy, but it also means cheap recruits for anyone that can offer work.";
		this.m.Icon = "ui/settlement_status/settlement_effect_01.png";
		this.m.Rumors = [
			"Come morning I\'ll head out to %settlement%. Word is a large group of refugees just arrived and I need more hands for my farm.",
			"From what I\'ve heard, %settlement% is flooded with refugees nowadays. Those cowards should have stayed and fought for their home, I\'d say!",
			"The beggars, the downtrodden, the fugitives, they all have to go somewhere. A large group of them just arrived at %settlement% from what I heard."
		];
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
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * -0.1);
		}

		_settlement.resetRoster(true);
	}

	function onUpdate( _modifiers )
	{
		_modifiers.RarityMult *= 0.9;
		_modifiers.FoodRarityMult *= 0.75;
		_modifiers.FoodPriceMult *= 1.25;
	}

	function onUpdateDraftList( _draftList, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("slave_background");
		_draftList.push("beggar_background");
		_draftList.push("female_beggar_background");
		_draftList.push("female_beggar_background");
	}

});

