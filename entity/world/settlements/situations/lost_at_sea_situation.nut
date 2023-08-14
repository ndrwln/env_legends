this.lost_at_sea_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.lost_at_sea";
		this.m.Name = "Lost at Sea";
		this.m.Description = "A boat with fishermen has been lost at sea during a storm. Both fresh fish and willing recruits are a rare sight.";
		this.m.Icon = "ui/settlement_status/settlement_effect_18.png";
		this.m.Rumors = [
			"They never came back from the sea... thinking about all the poor souls lost from %settlement% makes me shiver.",
			"Damn wenches by %settlement%, wailin\' and wailin\'. Went over to sell them some of me pigs, but they only wailin\' with nary a man to be found. Some boat lost at sea or sumthin\'. Went right back with not a single pig sold.",
			"Seafaring has always been a dangerous profession. That\'s why I turned my back to the water. And right in time, might I say, for otherwise it might have been me on that boat that got lost by %settlement%."
		];
		this.m.IsStacking = false;
		this.m.ValidDays = 4;
	}

	function getAddedString( _s )
	{
		return _s + " has " + this.m.Name;
	}

	function getRemovedString( _s )
	{
		return _s + " no longer has " + this.m.Name;
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
		_modifiers.FoodRarityMult *= 0.5;
		_modifiers.FoodPriceMult *= 2.0;
		_modifiers.RecruitsMult *= 0.5;
	}

	function onUpdateDraftList( _draftList, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";

		if (_gender)
		{
			_draftList.push("female_beggar_background");
			_draftList.push("female_beggar_background");
			_draftList.push("female_beggar_background");
			_draftList.push("female_butcher_background");
			_draftList.push("female_butcher_background");
			_draftList.push("female_butcher_background");
		}

		if (this.World.Assets.getOrigin().getID() == "scenario.legends_necro")
		{
			_draftList.push("legend_puppet_background");
			_draftList.push("legend_puppet_background");
		}
	}

});

