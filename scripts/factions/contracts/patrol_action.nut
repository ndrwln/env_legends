this.patrol_action <- this.inherit("scripts/factions/faction_action", {
	m = {},
	function create()
	{
		this.m.ID = "patrol_action";
		this.m.Cooldown = this.World.getTime().SecondsPerDay * 7;
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

		if (_faction.getSettlements().len() < 3)
		{
			return;
		}

		if (_faction.getPlayerRelation() <= 25)
		{
			return;
		}

		if (!this.World.Ambitions.getAmbition("ambition.make_nobles_aware").isDone())
		{
			return;
		}

		if (this.World.FactionManager.isGreaterEvil())
		{
			if (this.Math.rand(1, 100) > 20)
			{
				return;
			}
		}
		else if (this.Math.rand(1, 100) > 10)
		{
			return;
		}

		local numConnected = 0;

		foreach( s in _faction.getSettlements() )
		{
			if (!s.isIsolatedFromRoads() && s.isDiscovered())
			{
				numConnected = ++numConnected;
			}
		}

		if (numConnected < 3)
		{
			return;
		}

		this.m.Score = 1;
	}

	function onClear()
	{
	}

	function onExecute( _faction )
	{
		local contract = this.new("scripts/contracts/contracts/patrol_contract");
		contract.setFaction(_faction.getID());
		contract.setEmployerID(_faction.getRandomCharacter().getID());
		this.World.Contracts.addContract(contract);
	}

});

