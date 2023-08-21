this.burn_location_action <- this.inherit("scripts/factions/faction_action", {
	m = {
		Settlement = null
	},
	function create()
	{
		this.m.ID = "burn_location_action";
		this.m.Cooldown = this.World.getTime().SecondsPerDay * 20;
		this.m.IsSettlementsRequired = true;
		this.faction_action.create();
	}

	function onUpdate( _faction )
	{
		if (this.Math.rand(1, 100) > 1)
		{
			return;
		}

		if (this.World.FactionManager.isGreaterEvil())
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

		if (this.m.Settlement.getTile().getDistanceTo(this.World.State.getPlayer().getTile()) <= 20)
		{
			return;
		}

		local numActive = 0;

		foreach( a in this.m.Settlement.getAttachedLocations() )
		{
			if (!a.isUsable() || !a.isActive())
			{
				continue;
			}

			numActive = ++numActive;
		}

		if (numActive <= this.m.Settlement.getSize())
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
		local locs = [];

		foreach( a in this.m.Settlement.getAttachedLocations() )
		{
			if (!a.isUsable() || !a.isActive())
			{
				continue;
			}

			locs.push(a);
		}

		local loc = locs[this.Math.rand(0, locs.len() - 1)];
		loc.setActive(false);
		loc.spawnFireAndSmoke();
		local cooldown = this.World.getTime().SecondsPerDay * this.Math.rand(15, 25);
		local settlementTile = this.m.Settlement.getTile();

		if (this.m.Settlement.getSize() <= 2)
		{
			local s = this.new("scripts/entity/world/settlements/situations/raided_situation");
			s.setValidForDays(3);
			this.m.Settlement.addSituation(s);
		}

		if (this.m.Settlement.getOwner() != null)
		{
			cooldown = cooldown * 1.5;
		}

		local orcs = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Orcs).getNearestSettlement(settlementTile, 0);

		if (orcs != null && orcs.getTile().getDistanceTo(settlementTile) <= 20)
		{
			cooldown = cooldown * 0.75;
		}

		local goblins = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Goblins).getNearestSettlement(settlementTile, 0);

		if (goblins != null && goblins.getTile().getDistanceTo(settlementTile) <= 20)
		{
			cooldown = cooldown * 0.75;
		}

		this.m.Cooldown = cooldown;
	}

});

