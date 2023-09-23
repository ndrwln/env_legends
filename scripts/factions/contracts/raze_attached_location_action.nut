this.raze_attached_location_action <- this.inherit("scripts/factions/faction_action", {
	m = {},
	function create()
	{
		this.m.ID = "raze_attached_location_action";
		this.m.Cooldown = this.World.getTime().SecondsPerDay * 14;
		this.m.IsStartingOnCooldown = false;
		this.m.IsSettlementsRequired = true;
		this.faction_action.create();
	}

	function onUpdate( _faction )
	{
		if (this.World.FactionManager.isGreaterEvil())
		{
			return;
		}

		if (!_faction.isReadyForContract())
		{
			return;
		}

		if (_faction.getSettlements().len() < 2)
		{
			return;
		}

		if (_faction.getPlayerRelation() <= 70)
		{
			return;
		}

		if (this.World.Assets.getMoralReputation() >= 80)
		{
			return;
		}

		if (this.Math.rand(1, 100) > 8)
		{
			return;
		}

		if (!this.World.Ambitions.getAmbition("ambition.make_nobles_aware").isDone())
		{
			return;
		}

		local hasActiveLocation = false;

		foreach( s in _faction.getSettlements() )
		{
			if (s.isMilitary() || s.getAttachedLocations().len() == 0 || !s.isDiscovered())
			{
				continue;
			}

			foreach( a in s.getAttachedLocations() )
			{
				if (a.isActive() && a.isUsable() && !a.isMilitary())
				{
					hasActiveLocation = true;
					break;
				}
			}

			if (hasActiveLocation)
			{
				break;
			}
		}

		if (!hasActiveLocation)
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
		local bestDist = 9000;
		local best;

		foreach( s in _faction.getSettlements() )
		{
			if (s.isMilitary() || !s.isDiscovered() || s.getAttachedLocations().len() == 0)
			{
				continue;
			}

			local hasActiveLocation = false;

			foreach( a in s.getAttachedLocations() )
			{
				if (a.isActive() && a.isUsable() && !a.isMilitary())
				{
					hasActiveLocation = true;
					break;
				}
			}

			if (!hasActiveLocation)
			{
				continue;
			}

			foreach( o in _faction.getSettlements() )
			{
				local d = o.getTile().getDistanceTo(s.getTile());

				if (d < bestDist)
				{
					bestDist = d;
					best = s;
				}
			}
		}

		if (best == null)
		{
			return;
		}

		local bestLocation;
		bestDist = 0;

		foreach( a in best.getAttachedLocations() )
		{
			if (!a.isActive() || !a.isUsable() || a.isMilitary())
			{
				continue;
			}

			local d = a.getTile().getDistanceTo(best.getTile());

			if (d > bestDist)
			{
				bestDist = d;
				bestLocation = a;
			}
		}

		if (bestLocation == null)
		{
			return;
		}

		local contract = this.new("scripts/contracts/contracts/raze_attached_location_contract");
		contract.setFaction(_faction.getID());
		contract.setEmployerID(_faction.getRandomCharacter().getID());
		contract.setOrigin(best);
		contract.setSettlement(best);
		contract.setLocation(bestLocation);
		this.World.Contracts.addContract(contract);
	}

});

