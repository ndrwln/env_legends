this.rebuild_location_action <- this.inherit("scripts/factions/faction_action", {
	m = {
		Settlement = null
	},
	function create()
	{
		this.m.ID = "rebuild_location_action";
		this.m.Cooldown = this.World.getTime().SecondsPerDay * 7;
		this.m.IsSettlementsRequired = true;
		this.faction_action.create();
	}

	function onUpdate( _faction )
	{
		if (this.Math.rand(1, 100) > 10)
		{
			return;
		}

		if (this.World.Contracts.getActiveContract() != null && this.World.Contracts.getActiveContract().getID() == "contract.raze_attached_location")
		{
			return;
		}

		this.m.Settlement = _faction.getSettlements()[this.Math.rand(0, _faction.getSettlements().len() - 1)];

		if (_faction.getType() == this.Const.FactionType.NobleHouse && !this.m.Settlement.isMilitary())
		{
			return;
		}

		if (this.m.Settlement.getTile().getDistanceTo(this.World.State.getPlayer().getTile()) <= 15)
		{
			return;
		}

		if (this.m.Settlement.isBuilding())
		{
			return;
		}

		local playerTile = this.World.State.getPlayer().getTile();
		local numInactive = 0;
		local nogo = false;

		foreach( a in this.m.Settlement.getAttachedLocations() )
		{
			if (a.isActive())
			{
				continue;
			}

			if (a.isBuilding())
			{
				nogo = true;
				break;
			}

			numInactive = ++numInactive;
			numInactive = numInactive;
		}

		if (nogo)
		{
			return;
		}

		if (numInactive == 0)
		{
			return;
		}

		this.m.Score = 1;
	}

	function onClear()
	{
		this.m.Settlement = null;
	}

	function onExecute( _faction )
	{
		this.m.Settlement.addSituation(this.new("scripts/entity/world/settlements/situations/rebuilding_effort_situation"));
		local cooldown = this.World.getTime().SecondsPerDay * this.Math.rand(10, 20);
		cooldown = cooldown * (1.0 - 0.2 * (this.m.Settlement.getSize() - 1));

		if (this.World.FactionManager.isCivilWar())
		{
			cooldown = cooldown * 0.9;
		}

		this.m.Cooldown = cooldown;
	}

});

