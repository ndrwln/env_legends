this.legend_hunting_greenwood_schrats_action <- this.inherit("scripts/factions/faction_action", {
	m = {},
	function create()
	{
		this.m.ID = "legend_hunting_greenwood_schrats_action";
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

		if (_faction.getSettlements()[0].isIsolated())
		{
			return;
		}

		local village = _faction.getSettlements()[0];

		if (!this.isKindOf(village, "legends_lumber_village") && !this.isKindOf(village, "small_lumber_village") && !this.isKindOf(village, "medium_lumber_village") && !this.isKindOf(village, "large_lumber_village"))
		{
			return;
		}

		local minResources = this.Const.World.LegendaryContract.GreenSchrat * this.Const.World.ContractCost.GreenSchrat + this.Const.World.ContractCost.GreenSchrat;
		local currentResources = this.getDifficultyMult() * this.getScaledDifficultyMult() * this.Const.World.ContractCost.GreenSchrat;

		if (currentResources < minResources)
		{
			return;
		}
		else
		{
			this.Const.World.LegendaryContract.GreenSchrat += 1;
		}

		this.m.Score = 1;
	}

	function onClear()
	{
	}

	function onExecute( _faction )
	{
		local contract = this.new("scripts/contracts/contracts/legend_hunting_greenwood_schrats_contract");
		contract.setFaction(_faction.getID());
		contract.setHome(_faction.getSettlements()[0]);
		contract.setEmployerID(_faction.getRandomCharacter().getID());
		this.World.Contracts.addContract(contract);
	}

});

