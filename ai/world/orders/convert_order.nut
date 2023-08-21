this.convert_order <- this.inherit("scripts/ai/world/world_behavior", {
	m = {
		IsBurning = false,
		IsSafetyOverride = false,
		TargetTile = null,
		TargetID = 0,
		Time = 0.0,
		Start = 0.0
	},
	function setTargetTile( _t )
	{
		this.m.TargetTile = _t;
	}

	function setTargetID( _id )
	{
		this.m.TargetID = _id;
	}

	function setTime( _t )
	{
		this.m.Time = _t;
	}

	function setSafetyOverride( _s )
	{
		this.m.IsSafetyOverride = _s;
	}

	function create()
	{
		this.world_behavior.create();
		this.m.ID = this.Const.World.AI.Behavior.ID.Convert;
	}

	function onSerialize( _out )
	{
		this.world_behavior.onSerialize(_out);
		_out.writeI16(this.m.TargetTile.Coords.X);
		_out.writeI16(this.m.TargetTile.Coords.Y);
		_out.writeU32(this.m.TargetID);
		_out.writeBool(this.m.IsSafetyOverride);
		_out.writeF32(this.m.Time);
		_out.writeF32(this.m.Start);
	}

	function onDeserialize( _in )
	{
		this.world_behavior.onDeserialize(_in);
		local x = _in.readI16();
		local y = _in.readI16();
		this.m.TargetTile = this.World.getTile(x, y);
		this.m.TargetID = _in.readU32();
		this.m.IsSafetyOverride = _in.readBool();
		this.m.Time = _in.readF32();
		this.m.Start = _in.readF32();
	}

	function onExecute( _entity, _hasChanged )
	{
		local myTile = _entity.getTile();

		if (!this.World.FactionManager.isGreaterEvil())
		{
			this.getController().popOrder();
			return true;
		}

		if (!this.m.IsSafetyOverride)
		{
			local activeContract = this.World.Contracts.getActiveContract();

			if (activeContract != null && activeContract.isTileUsed(myTile))
			{
				this.getController().popOrder();
				return true;
			}
		}

		if (this.m.TargetTile != null && myTile.ID != this.m.TargetTile.ID)
		{
			local move = this.new("scripts/ai/world/orders/move_order");
			move.setDestination(this.m.TargetTile);
			this.getController().addOrderInFront(move);
			return true;
		}

		_entity.setOrders("Converting");

		if (this.m.Start == 0.0)
		{
			this.m.Start = this.Time.getVirtualTimeF();
		}
		else if (this.Time.getVirtualTimeF() - this.m.Start >= this.m.Time)
		{
			local entities = this.World.getAllEntitiesAndOneLocationAtPos(_entity.getPos(), 1.0);

			foreach( e in entities )
			{
				if (e.isAlive() && e.getID() == this.m.TargetID)
				{
					if (this.World.Assets.isPermanentDestruction() && !e.isSouthern())
					{
						local news = this.World.Statistics.createNews();
						news.set("City", e.getName());
						this.World.Statistics.addNews("crisis_undead_town_destroyed", news);
						this.World.FactionManager.addGreaterEvilStrength(this.Const.Factions.GreaterEvilStrengthOnTownDestroyed);
						local tile = e.getTile();
						local name = e.getName();
						local sprite = e.m.Sprite;
						e.setActive(false, false);
						e.fadeOutAndDie();
						this.World.EntityManager.updateSettlementHeat();
						local n = this.World.spawnLocation("scripts/entity/world/locations/undead_necropolis_location", tile.Coords);
						n.setName(name);
						n.setSprite(sprite);
						n.onSpawned();
						n.setBanner(_entity.getBanner());
						this.World.FactionManager.getFaction(_entity.getFaction()).addSettlement(n, false);
					}
					else
					{
						e.addSituation(this.new("scripts/entity/world/settlements/situations/raided_situation"), 14);
					}

					break;
				}
			}

			this.getController().popOrder();
		}

		if (!this.m.IsBurning)
		{
			this.m.IsBurning = true;
			local entities = this.World.getAllEntitiesAndOneLocationAtPos(_entity.getPos(), 1.0);

			foreach( e in entities )
			{
				if (e.isLocation())
				{
					e.spawnFireAndSmoke();
					break;
				}
			}
		}

		return true;
	}

});

