this.starting_scenario <- {
	m = {
		ID = "",
		Name = "",
		Description = "",
		Difficulty = 1,
		Order = 0,
		IsFixedLook = false,
		CurrentSettlement = null,
		StashModifier = 0,
		StartingBusinessReputation = 0,
		StartingRosterTier = this.Const.Roster.DefaultTier,
		RosterTierMax = this.Const.Roster.DefaultTierMax,
		RosterTierMaxCombat = null,
		RosterReputationTiers = this.Const.Roster.DefaultReputationTiers,
		StaticRelationsToFaction = this.array(this.Const.FactionType.len(), false)
	},
	function isFixedLook()
	{
		return this.m.IsFixedLook;
	}

	function isDroppedAsLoot( _item )
	{
		return false;
	}

	function getID()
	{
		return this.m.ID;
	}

	function getName()
	{
		return this.m.Name;
	}

	function getDescription()
	{
		return this.m.Description;
	}

	function getDifficulty()
	{
		return this.m.Difficulty;
	}

	function getOrder()
	{
		return this.m.Order;
	}

	function isFixedLook()
	{
		return this.m.IsFixedLook;
	}

	function isDroppedAsLoot( _item )
	{
		return false;
	}

	function getDifficultyForUI()
	{
		switch(this.m.Difficulty)
		{
		case 1:
			return "difficulty_easy";

		case 2:
			return "difficulty_medium";

		case 3:
			return "difficulty_hard";

		case 4:
			return "difficulty_legend";
		}

		return "difficulty_unknown";
	}

	function getOrder()
	{
		return this.m.Order;
	}

	function getStaticRelations()
	{
		return this.m.StaticRelationsToFaction;
	}

	function getStashModifier()
	{
		return this.m.StashModifier;
	}

	function isValid()
	{
		return true;
	}

	function onSpawnAssets()
	{
	}

	function onSpawnPlayer()
	{
	}

	function onInit()
	{
		this.m.StaticRelationsToFaction.resize(this.Const.FactionType.len());

		if (this.World.State.getPlayer() != null)
		{
			this.World.State.getPlayer().calculateModifiers();
		}
	}

	function onUpdateHiringRoster( _roster )
	{
	}

	function onUpdateDraftList( _list, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";
	}

	function onUpdateStablesList( _list )
	{
	}

	function onHiredByScenario( bro )
	{
	}

	function onBuildPerkTree( _background )
	{
	}

	function onHired( _bro )
	{
	}

	function onActorKilled( _actor, _killer, _combatID )
	{
	}

	function onBattleWon( _combatLoot )
	{
	}

	function onCombatFinished()
	{
		return true;
	}

	function onContractFinished( _contractType, _cancelled )
	{
	}

	function onUnlockPerk( _bro, _perkID )
	{
	}

	function onUpdateLevel( _bro )
	{
	}

	function onGetBackgroundTooltip( _background, _tooltip )
	{
	}

	function getStartingRosterTier()
	{
		return this.m.StartingRosterTier;
	}

	function getRosterTier()
	{
		return this.Math.min(this.getRosterTierMax(), this.getRosterTierFromReputation() + this.getStartingRosterTier());
	}

	function getRosterTierCombat()
	{
		local tierMax = this.m.RosterTierMaxCombat == null ? this.Math.min(this.getRosterTierMax(), this.m.RosterTierMaxCombat) : this.m.RosterTierMaxCombat;
		return this.Math.min(tierMax, this.getRosterTierFromReputation() + this.getStartingRosterTier());
	}

	function getRosterTierMax()
	{
		return this.m.RosterTierMax;
	}

	function getRosterTierFromReputation()
	{
		local tier = 0;

		for( local i = 0; i < this.m.RosterReputationTiers.len(); i++ )
		{
			if (this.World.Assets.getBusinessReputation() >= this.m.RosterReputationTiers[i])
			{
				tier++;
			}
		}

		return tier;
	}

	function getRosterReputationTiers()
	{
		return this.m.RosterReputationTiers;
	}

	function setRosterReputationTiers( _tiers )
	{
		this.m.RosterReputationTiers = _tiers;
	}

	function addScenarioPerk( _background, _perk, _row = 0, _addSkill = true )
	{
		if (_background.m.CustomPerkTree == null)
		{
			return;
		}

		local isRefundable = true;

		if (_addSkill && _background.getContainer() != null)
		{
			_background.getContainer().add(this.new(this.Const.Perks.PerkDefObjects[_perk].Script));
			isRefundable = false;
		}

		_background.addPerk(_perk, _row, isRefundable);

		if (!isRefundable)
		{
			_background.getPerk(_perk).IsRefundable = false;
		}
	}

	function onGenerateBro( bro )
	{
	}

	function addBroToRoster( _roster, background, chance )
	{
		local multiplier = 1;

		if (_roster.getAll().len() < 8)
		{
			multiplier = 2;
		}

		local r;
		r = this.Math.rand(0, chance * multiplier);

		if (r == 0)
		{
			local bro = _roster.create("scripts/entity/tactical/player");
			bro.setStartValuesEx([
				background
			]);
			this.World.Assets.getOrigin().onGenerateBro(bro);
		}
	}

	function getCurrentSettlement()
	{
		return this.m.CurrentSettlement;
	}

	function setCurrentSettlement( _settlement )
	{
		this.m.CurrentSettlement = ::MSU.asWeakTableRef(_settlement);
	}

};

