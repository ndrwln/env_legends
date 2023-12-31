this.send_caravan_action <- this.inherit("scripts/factions/faction_action", {
	m = {
		Start = null,
		Dest = null
	},
	function create()
	{
		this.m.ID = "send_caravan_action";
		this.m.Cooldown = 100.0;
		this.m.IsSettlementsRequired = true;
		this.faction_action.create();
	}

	function onUpdate( _faction )
	{
		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		if (_faction.isEnemyNearby())
		{
			return;
		}

		if (_faction.getUnits().len() >= 1)
		{
			return;
		}

		local mySettlements = _faction.getSettlements();
		local allSettlements = this.World.EntityManager.getSettlements();
		local destinations;

		if (!this.World.FactionManager.isGreaterEvil())
		{
			destinations = allSettlements;
		}
		else
		{
			destinations = [];

			foreach( s in allSettlements )
			{
				if (s.getOwner() == null || s.getOwner().isAlliedWith(_faction.getID()))
				{
					destinations.push(s);
				}
			}
		}

		local settlements = this.getRandomConnectedSettlements(2, mySettlements, destinations, true);

		if (settlements.len() < 2)
		{
			return;
		}

		this.m.Start = settlements[0];
		this.m.Dest = settlements[1];
		this.m.Score = 5;
	}

	function onClear()
	{
		this.m.Start = null;
		this.m.Dest = null;
	}

	function getReputationToDifficultyLightMult()
	{
		return this.faction_action.getReputationToDifficultyLightMult() * (this.World.FactionManager.isCivilWar() ? 1.1 : 1.0);
	}

	function getResourcesForParty( _settlement, _faction )
	{
		if (_settlement == null)
		{
			return this.Math.rand(100, 200) * this.getReputationToDifficultyLightMult();
		}

		if (_faction.hasTrait(this.Const.FactionTrait.OrientalCityState))
		{
			return (this.Math.rand(90, 137) + this.Math.round(0.12 * ::Math.max(1, _settlement.getResources()))) * this.getReputationToDifficultyLightMult();
		}

		return (this.Math.rand(60, 110) + this.Math.round(0.1 * ::Math.max(1, _settlement.getResources()))) * this.getReputationToDifficultyLightMult();
	}

	function onExecute( _faction )
	{
		local party = _faction.spawnEntity(this.m.Start.getTile(), "Trading Caravan", false, this.pickSpawnList(this.m.Start, _faction), this.getResourcesForParty(this.m.Start, _faction));
		party.getSprite("banner").Visible = false;
		party.getSprite("base").Visible = false;
		party.setMirrored(true);
		party.setDescription("A trading caravan from " + this.m.Start.getName() + " that is transporting all manner of goods between settlements.");
		party.setFootprintType(this.Const.World.FootprintsType.Caravan);
		party.getFlags().set("IsCaravan", true);
		party.getFlags().set("IsRandomlySpawned", true);

		if (this.World.Assets.m.IsBrigand && this.m.Start.getTile().getDistanceTo(this.World.State.getPlayer().getTile()) <= 70)
		{
			party.setVisibleInFogOfWar(true);
			party.setImportant(true);
			party.setDiscovered(true);
		}

		this.addLoot(party);

		if (::Legends.Mod.ModSettings.getSetting("WorldEconomy").getValue())
		{
			::Const.World.Common.WorldEconomy.setupTrade(party, this.m.Start, this.m.Dest);
		}
		else
		{
			this.addToPartyInventory(party);
		}

		local c = party.getController();
		c.getBehavior(this.Const.World.AI.Behavior.ID.Attack).setEnabled(false);
		c.getBehavior(this.Const.World.AI.Behavior.ID.Flee).setEnabled(false);
		local move = this.new("scripts/ai/world/orders/move_order");
		move.setDestination(this.m.Dest.getTile());
		move.setRoadsOnly(true);
		local unload = this.new("scripts/ai/world/orders/unload_order");
		local despawn = this.new("scripts/ai/world/orders/despawn_order");
		c.addOrder(move);
		c.addOrder(unload);
		c.addOrder(despawn);
		this.afterSpawnCaravan(party);
	}

	function pickSpawnList( _settlement, _faction )
	{
		if (_faction.hasTrait(this.Const.FactionTrait.OrientalCityState))
		{
			return this.Const.World.Spawn.CaravanSouthern;
		}

		return this.Const.World.Spawn.Caravan;
	}

	function addLoot( _party )
	{
		if (this.Math.rand(1, 2) <= 1)
		{
			_party.getLoot().ArmorParts = this.Math.rand(0, 10);
		}

		if (this.Math.rand(1, 2) <= 1)
		{
			_party.getLoot().Medicine = this.Math.rand(0, 10);
		}

		if (this.Math.rand(1, 2) <= 1)
		{
			_party.getLoot().Ammo = this.Math.rand(0, 25);
		}

		_party.getLoot().Money = this.Math.rand(0, 100);
	}

	function addToPartyInventory( _party )
	{
		switch(::Math.rand(1, 4))
		{
		case 1:
			_party.addToInventory("supplies/bread_item");
			break;

		case 2:
			_party.addToInventory("supplies/roots_and_berries_item");
			break;

		case 3:
			_party.addToInventory("supplies/dried_fruits_item");
			break;

		default:
			_party.addToInventory("supplies/ground_grains_item");
		}
	}

	function afterSpawnCaravan( _party )
	{
	}

});

