this.mustering_troops_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.mustering_troops";
		this.m.Name = "Mustering Troops";
		this.m.Description = "Order has been given to muster troops for service in this settlement. Equipment and recruits are in short supply, but a quick crown can be made by selling arms and armor here.";
		this.m.Icon = "ui/settlement_status/settlement_effect_35.png";
		this.m.Rumors = [
			"Another damn noble is pressing younglings into a regiment at %settlement%. Ach, why am I even talking to you about this, sellsword? You are no better!",
			"If I were a merchant with a wagonload full of weapons and armor, I\'d know just where to sell it all - they\'re mustering troops at %settlement% and will surely pay good coin. Alas, I\'m neither a merchant nor do I have any weapons.",
			"I\'m just passing trough. Narrowly escaped from impressment at %settlement%. They wanted to force me to fight for some lord, but no thanks, I says, not gonna happen, and away I went. I\'ll strike my luck further down south."
		];
		this.m.IsStacking = false;
		this.m.ValidDays = 4;
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
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * -0.1);
		}

		_settlement.resetShop();
		_settlement.resetRoster(false);
	}

	function onUpdate( _modifiers )
	{
		_modifiers.PriceMult *= 1.25;
		_modifiers.RecruitsMult *= 0.5;
		_modifiers.RarityMult *= 0.5;
	}

	function onUpdateDraftList( _draftList, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";
		_draftList.push("retired_soldier_background");
		_draftList.push("cripple_background");
		_draftList.push("cripple_background");
		_draftList.push("deserter_background");
		_draftList.push("deserter_background");

		if (_gender)
		{
			_draftList.push("female_beggar_background");
			_draftList.push("female_beggar_background");
			_draftList.push("female_beggar_background");
		}

		if (this.World.Assets.getOrigin().getID() == "scenario.militia")
		{
			_draftList.push("legend_man_at_arms_background");
			_draftList.push("legend_man_at_arms_background");
			_draftList.push("legend_man_at_arms_background");
		}
	}

});

