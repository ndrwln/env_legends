this.mine_cavein_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.mine_cavein";
		this.m.Name = "Mine Cave In";
		this.m.Description = "A tragic accident occured, and there was a cave-in in one of the mines. Production came to a halt until the damages are repaired, and miners are without means to feed their families.";
		this.m.Icon = "ui/settlement_status/settlement_effect_24.png";
		this.m.Rumors = [
			"I\'d never work underground, I am no stinkin\' mole! It\'s a damn deathtrap! Not long ago a mine gave in by %settlement%, don\'t even want to know how many died that day...",
			"A delivery of ores and minerals from the mines of %settlement% was due today, but alas it did not arrive yet. Something must have happened over there.",
			"Heard there was a cave-in on one of the mines at %settlement%. Just imagine being buried alive deep under rock and earth..."
		];
		this.m.IsStacking = false;
		this.m.ValidDays = 5;
	}

	function getAddedString( _s )
	{
		return _s + " had a " + this.m.Name;
	}

	function getRemovedString( _s )
	{
		return _s + " no longer suffers from a " + this.m.Name;
	}

	function onAdded( _settlement )
	{
		if (::Legends.Mod.ModSettings.getSetting("WorldEconomy").getValue())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * -0.05);
		}

		_settlement.resetShop();
		_settlement.resetRoster(true);
	}

	function onUpdate( _modifiers )
	{
		_modifiers.RecruitsMult *= 1.25;
	}

	function onUpdateShop( _stash )
	{
		do
		{
		}
		while (_stash.removeByID("misc.uncut_gems") != null);

		do
		{
		}
		while (_stash.removeByID("misc.copper_ingots") != null);
	}

	function onUpdateDraftList( _draftList, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("miner_background");
		_draftList.push("legend_ironmonger_background");
		_draftList.push("legend_ironmonger_background");
		_draftList.push("legend_ironmonger_background");
		_draftList.push("legend_blacksmith_background");

		if (this.World.Assets.getOrigin().getID() == "scenario.legends_necro")
		{
			_draftList.push("legend_puppet_background");
			_draftList.push("legend_puppet_background");
			_draftList.push("legend_puppet_background");
			_draftList.push("legend_puppet_background");
		}
	}

});

