this.conquer_order <- this.inherit("scripts/ai/world/world_behavior", {
	m = {
		IsBurning = false,
		IsSafetyOverride = false,
		TargetTile = null,
		Time = 0.0,
		Start = 0.0
	},
	function setTargetTile( _t )
	{
		this.m.TargetTile = _t;
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
		this.m.ID = this.Const.World.AI.Behavior.ID.Conquer;
	}

	function onSerialize( _out )
	{
		this.world_behavior.onSerialize(_out);
		_out.writeI16(this.m.TargetTile.Coords.X);
		_out.writeI16(this.m.TargetTile.Coords.Y);
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
		this.m.IsSafetyOverride = _in.readBool();
		this.m.Time = _in.readF32();
		this.m.Start = _in.readF32();
	}

	function onExecute( _entity, _hasChanged )
	{
		local myTile = _entity.getTile();

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

		_entity.setOrders("Conquering");

		if (this.m.Start == 0.0)
		{
			this.m.Start = this.Time.getVirtualTimeF();
		}
		else if (this.Time.getVirtualTimeF() - this.m.Start >= this.m.Time)
		{
			local entities = this.World.getAllEntitiesAndOneLocationAtPos(_entity.getPos(), 1.0);

			foreach( e in entities )
			{
				if (e.isLocation())
				{
					if ((e.getOwner() == null || e.getOwner().getID() != _entity.getFaction()) && !e.hasSituation("situation.conquered"))
					{
						local news = this.World.Statistics.createNews();
						news.set("Conqueror", this.World.FactionManager.getFaction(_entity.getFaction()).getName());
						news.set("Defeated", e.getOwner().getName());
						news.set("City", e.getName());
						this.World.Statistics.addNews("crisis_civilwar_town_conquered", news);
						local defeatedFaction = e.getOwner();

						if (e.getOwner() != null)
						{
							e.getOwner().removeAlly(e.getFactionOfType(this.Const.FactionType.Settlement).getID());
							e.removeFaction(e.getOwner().getID());
						}

						local conqueringFaction = this.World.FactionManager.getFaction(_entity.getFaction());
						local settlementFaction = e.getFactionOfType(this.Const.FactionType.Settlement);
						conqueringFaction.addSettlement(e);
						conqueringFaction.addAlly(settlementFaction.getID());
						settlementFaction.cloneAlliesFrom(conqueringFaction);

						if (conqueringFaction.isAlliedWithPlayer() && !defeatedFaction.isAlliedWithPlayer())
						{
							if (settlementFaction.getPlayerRelation() < 25.0)
							{
								settlementFaction.addPlayerRelationEx(this.Math.minf(25.0, 25.0 - settlementFaction.getPlayerRelation()));
							}
						}
						else if (defeatedFaction.isAlliedWithPlayer() && !conqueringFaction.isAlliedWithPlayer())
						{
							if (settlementFaction.getPlayerRelation() >= 20.0)
							{
								settlementFaction.addPlayerRelationEx(-settlementFaction.getPlayerRelation());
							}
						}

						local situation = this.new("scripts/entity/world/settlements/situations/conquered_situation");
						situation.setValidForDays(3);
						e.addSituation(situation);
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

