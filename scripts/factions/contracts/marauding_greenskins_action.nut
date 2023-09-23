this.marauding_greenskins_action <- this.inherit("scripts/factions/faction_action", {
	m = {
		Origin = null
	},
	function create()
	{
		this.m.ID = "marauding_greenskins_action";
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

		if (_faction.getPlayerRelation() <= 25)
		{
			return;
		}

		if (!this.World.Ambitions.getAmbition("ambition.make_nobles_aware").isDone())
		{
			return;
		}

		if (!this.World.FactionManager.isGreenskinInvasion() && this.Math.rand(1, 100) > 10)
		{
			return;
		}

		local settlements = _faction.getSettlements();
		local orcs = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Orcs).getSettlements();
		local goblins = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Goblins).getSettlements();
		local lowestDistance = 9999;
		local origin;

		foreach( s in settlements )
		{
			if (s.isMilitary() || s.isIsolated() || !s.isDiscovered())
			{
				continue;
			}

			foreach( b in orcs )
			{
				local d = s.getTile().getDistanceTo(b.getTile());

				if (d <= 35 && d < lowestDistance)
				{
					lowestDistance = d;
					origin = s;
				}
			}

			foreach( b in goblins )
			{
				local d = s.getTile().getDistanceTo(b.getTile());

				if (d <= 35 && d < lowestDistance)
				{
					lowestDistance = d;
					origin = s;
				}
			}
		}

		if (origin == null)
		{
			return;
		}

		this.m.Origin = origin;
		this.m.Score = 1;
	}

	function onClear()
	{
		this.m.Origin = null;
	}

	function onExecute( _faction )
	{
		local contract = this.new("scripts/contracts/contracts/marauding_greenskins_contract");
		contract.setFaction(_faction.getID());
		contract.setEmployerID(_faction.getRandomCharacter().getID());
		contract.setOrigin(this.m.Origin);
		this.World.Contracts.addContract(contract);
	}

});

