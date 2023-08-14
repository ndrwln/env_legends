this.cultist_procession_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.cultist_procession";
		this.m.Name = "Cultist Procession";
		this.m.Description = "There\'s a procession of cultists going through the city; a steady stream of people seemingly manifested themselves out of thin air and now slowly makes their way along the main roads. Clad in muted colors they ring bells and chant monotonously the name of Davkul.";
		this.m.Icon = "ui/settlement_status/settlement_effect_37.png";
		this.m.Rumors = [
			"I just saw the most bone chilling procession coming through %settlement%! Masked figures, whipping themselves on the backs until they were all bloodied up...",
			"%settlement% is swarming with strange cultists, they are surely up to no good! Somebody should send the witch hunters their way, I\'d say!",
			"It has awakened! The sleeping beast is about to rise from its century long slumber! Go to %settlement% and my brothers in faith will tell you the same! Davkul will come!"
		];
		this.m.IsStacking = false;
		this.m.ValidDays = 2;
	}

	function getAddedString( _s )
	{
		return _s + " now has a " + this.m.Name;
	}

	function getRemovedString( _s )
	{
		return _s + " no longer has a " + this.m.Name;
	}

	function onAdded( _settlement )
	{
		_settlement.resetRoster(true);
	}

	function onRemoved( _settlement )
	{
		_settlement.resetRoster(true);
	}

	function onUpdate( _modifiers )
	{
	}

	function onUpdateDraftList( _draftList, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("flagellant_background");
		_draftList.push("butcher_background");

		if (this.World.Assets.getOrigin().getID() == "scenario.cultists")
		{
			_draftList.push("legend_husk_background");
			_draftList.push("legend_husk_background");
			_draftList.push("legend_lurker_background");
			_draftList.push("legend_lurker_background");
			_draftList.push("legend_lurker_background");
			_draftList.push("legend_lurker_background");
			_draftList.push("legend_magister_background");
		}

		if (this.LegendsMod.Configs().LegendMagicEnabled())
		{
			local r;

			if (this.World.Assets.getOrigin().getID() == "scenario.legends_seer")
			{
				r = this.Math.rand(0, 2);

				if (r == 1)
				{
					_draftList.push("legend_ancient_summoner_background");
				}
			}
			else
			{
				r = this.Math.rand(0, 5);

				if (r == 1)
				{
					_draftList.push("legend_ancient_summoner_background");
				}
			}

			if (this.World.Assets.getOrigin().getID() == "scenario.legends_warlock")
			{
				_draftList.push("legend_ancient_summoner_background");
			}
		}
	}

});

