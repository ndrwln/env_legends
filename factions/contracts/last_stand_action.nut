this.last_stand_action <- this.inherit("scripts/factions/faction_action", {
	m = {
		Origin = null
	},
	function create()
	{
		this.m.ID = "last_stand_action";
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

		local settlements = _faction.getSettlements();
		local undead = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Undead).getSettlements();
		local zombies = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Zombies).getSettlements();
		local lowest_distance = 9999;
		local best;

		foreach( s in settlements )
		{
			if (s.isMilitary() || s.isIsolated() || !s.isDiscovered())
			{
				continue;
			}

			foreach( b in undead )
			{
				local d = s.getTile().getDistanceTo(b.getTile());

				if (d <= 25 && d < lowest_distance)
				{
					lowest_distance = d;
					best = s;
				}
			}

			foreach( b in zombies )
			{
				local d = s.getTile().getDistanceTo(b.getTile());

				if (d <= 25 && d < lowest_distance)
				{
					lowest_distance = d;
					best = s;
				}
			}
		}

		if (best == null)
		{
			return;
		}

		this.m.Origin = best;
		this.m.Score = 1;
	}

	function onClear()
	{
		this.m.Origin = null;
	}

	function onExecute( _faction )
	{
		local contract = this.new("scripts/contracts/contracts/last_stand_contract");
		contract.setFaction(_faction.getID());
		contract.setEmployerID(_faction.getRandomCharacter().getID());
		contract.setOrigin(this.m.Origin);
		this.World.Contracts.addContract(contract);
	}

});

