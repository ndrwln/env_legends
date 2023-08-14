this.root_out_undead_action <- this.inherit("scripts/factions/faction_action", {
	m = {},
	function create()
	{
		this.m.ID = "root_out_undead_action";
		this.m.Cooldown = this.World.getTime().SecondsPerDay * 5;
		this.m.IsStartingOnCooldown = false;
		this.m.IsSettlementsRequired = true;
		this.faction_action.create();
	}

	function onUpdate( _faction )
	{
		if (!_faction.isReadyForContract())
		{
			return;
		}

		if (_faction.getPlayerRelation() <= 25)
		{
			return;
		}

		if (this.World.Assets.getBusinessReputation() < 1500)
		{
			return;
		}

		if (!this.World.FactionManager.isUndeadScourge())
		{
			return;
		}

		if (this.Math.rand(1, 100) > 30)
		{
			return;
		}

		if (!this.World.Ambitions.getAmbition("ambition.make_nobles_aware").isDone())
		{
			return;
		}

		this.m.Score = 1;

		if (this.World.Assets.getOrigin().getID() == "scenario.legends_inquisition")
		{
			this.m.Score = 10;
		}
	}

	function onClear()
	{
	}

	function onExecute( _faction )
	{
		local contract = this.new("scripts/contracts/contracts/root_out_undead_contract");
		contract.setFaction(_faction.getID());
		contract.setEmployerID(_faction.getRandomCharacter().getID());
		this.World.Contracts.addContract(contract);
	}

});

