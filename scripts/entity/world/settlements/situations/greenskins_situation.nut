this.greenskins_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.greenskins";
		this.m.Name = "Marauding Greenskins";
		this.m.Description = "Greenskins are terrorizing the surrounding lands, and many lives have been lost as orcs or goblins continue to raid outlying farms and raze caravans. Supplies are beginning to run low and people become desperate. Deserters fleeing the carnage are seeking refuge, while mercenaries claiming to be able to protect the locals are seeking coin.";
		this.m.Icon = "ui/settlement_status/settlement_effect_01.png";
		this.m.Rumors = [
			"I heard rumors that vile greenskins are marauding around %settlement%! Is it true? I hope they don\'t make their way over here...",
			"Did you see the columns of smoke in the evening sky? They are rising over from %settlement% where greenskins are burning and pillaging the countryside.",
			"Here, take a look at what\'s left of my hand! Can hardly use it anymore on account of it having no fingers since that run-in with greenskins a while ago. Now I hear they are back, marauding around %settlement% right as we speak.",
			"I just don\'t understand it. We had bunch of poor sods come by from %settlement% muttering that no noble house can promise them enough fortunes to fight a greenskin army ever again. Even so, a bunch of sheep-headed fools calling themselves sellswords said they were heading in that direction precisely for the coin."
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
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * -0.025);
		}

		_settlement.resetShop();
		_settlement.resetRoster(true);

		if (::Math.rand(1, 10) == 1)
		{
			_settlement.addSituation(this.new("scripts/entity/world/settlements/situations/legend_militant_townsfolk_situation"), this.getDefaultDays() + ::Math.rand(1, 3));
		}
	}

	function onResolved( _settlement )
	{
		if (::Legends.Mod.ModSettings.getSetting("WorldEconomy").getValue())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * 0.125);
		}
	}

	function onUpdate( _modifiers )
	{
		_modifiers.RarityMult *= 0.75;
		_modifiers.RecruitsMult *= 0.75;
	}

	function onUpdateDraftList( _draftList, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";

		if (this.World.Assets.getOrigin().getID() == "scenario.legends_necro")
		{
			_draftList.push("legend_puppet_background");
			_draftList.push("legend_puppet_background");
			_draftList.push("legend_puppet_background");
			_draftList.push("legend_puppet_background");
		}

		if (this.World.Assets.getOrigin().getID() == "scenario.militia")
		{
			_draftList.push("legend_man_at_arms_background");
			_draftList.push("legend_man_at_arms_background");
		}

		_draftList.push("deserter_background");
		_draftList.push("deserter_background");
		_draftList.push("deserter_background");
		_draftList.push("deserter_background");
		_draftList.push("sellsword_background");
		_draftList.push("sellsword_background");
		_draftList.push("sellsword_background");
		_draftList.push("hedge_knight_background");
		_draftList.push("hedge_knight_background");
	}

});

