this.collectors_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.collectors";
		this.m.Name = "Collectors";
		this.m.Description = "Several collectors seeking exotic curios have made their way into town. There\'s good coin to be made selling beast trophies and like here.";
		this.m.Icon = "ui/settlement_status/settlement_effect_46.png";
		this.m.Rumors = [
			"Are you lot beast hunters? I\'ve heard that some strange characters have shown up in %settlement% and are buying every exotic monster trophy they can find.",
			"See this here dog tooth? I plan on selling it over in %settlement%, I heard they pay good coin for animal parts there.",
			"It seems all sorts of beast slayers and corpse-pickers are gathering in %settlement%. Something about selling beast trophies, I heard. Sounds like witchcraft to me."
		];
		this.m.IsStacking = false;
		this.m.ValidDays = 3;
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
		_settlement.resetShop();
		_settlement.resetRoster(true);
	}

	function onUpdate( _modifiers )
	{
		_modifiers.BeastPartsPriceMult *= 2.0;
		_modifiers.RecruitsMult *= 1.25;
	}

	function onUpdateDraftList( _draftList, _gender = null )
	{
		_draftList.push("witchhunter_background");
		_draftList.push("witchhunter_background");
		_draftList.push("witchhunter_background");

		if (this.Const.DLC.Unhold)
		{
			_draftList.push("beast_hunter_background");
			_draftList.push("beast_hunter_background");
			_draftList.push("beast_hunter_background");
			_draftList.push("beast_hunter_background");
			_draftList.push("beast_hunter_background");
		}

		if (this.Const.DLC.Paladins)
		{
			_draftList.push("anatomist_background");
			_draftList.push("anatomist_background");
			_draftList.push("anatomist_background");
			_draftList.push("anatomist_background");
			_draftList.push("anatomist_background");
		}
	}

});

