this.legend_hunting_coven_leader_action <- this.inherit("scripts/factions/faction_action", {
	m = {},
	function create()
	{
		this.m.ID = "legend_hunting_coven_leader_action";
		this.m.Cooldown = this.World.getTime().SecondsPerDay * 14;
		this.m.IsStartingOnCooldown = false;
		this.m.IsSettlementsRequired = true;
		this.faction_action.create();
		this.m.DifficultyMult = this.Math.rand(145, 175) * 0.01;
	}

	function onUpdate( _faction )
	{
		if (!this.Const.DLC.Unhold)
		{
			return;
		}

		if (!_faction.isReadyForContract())
		{
			return;
		}

		if (this.World.Assets.getBusinessReputation() < 1500)
		{
			return;
		}

		local village = _faction.getSettlements()[0];

		if (village.isIsolated() || village.getSize() > 2)
		{
			return;
		}

		if (this.isKindOf(village, "small_snow_village") || this.isKindOf(village, "medium_snow_village"))
		{
			return;
		}

		local minResources = this.Const.World.LegendaryContract.BossHexe * this.Const.World.ContractCost.BossHexe + this.Const.World.ContractCost.BossHexe;
		local currentResources = this.getDifficultyMult() * this.getScaledDifficultyMult() * this.Const.World.ContractCost.BossHexe;

		if (currentResources < minResources)
		{
			return;
		}
		else
		{
			this.Const.World.LegendaryContract.BossHexe += 1;
		}

		this.m.Score = 1;
	}

	function onClear()
	{
	}

	function onExecute( _faction )
	{
		local contract = this.new("scripts/contracts/contracts/legend_hunting_coven_leader_contract");
		contract.setFaction(_faction.getID());
		contract.setHome(_faction.getSettlements()[0]);
		contract.setEmployerID(_faction.getRandomCharacter().getID());
		this.World.Contracts.addContract(contract);
	}

});

