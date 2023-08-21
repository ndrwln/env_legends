this.raid_order <- this.inherit("scripts/ai/world/world_behavior", {
	m = {
		IsBurning = false,
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

	function create()
	{
		this.world_behavior.create();
		this.m.ID = this.Const.World.AI.Behavior.ID.Raid;
	}

	function onSerialize( _out )
	{
		this.world_behavior.onSerialize(_out);
		_out.writeI16(this.m.TargetTile.Coords.X);
		_out.writeI16(this.m.TargetTile.Coords.Y);
		_out.writeF32(this.m.Time);
		_out.writeF32(this.m.Start);
	}

	function onDeserialize( _in )
	{
		this.world_behavior.onDeserialize(_in);
		local x = _in.readI16();
		local y = _in.readI16();
		this.m.TargetTile = this.World.getTile(x, y);
		this.m.Time = _in.readF32();
		this.m.Start = _in.readF32();
	}

	function onExecute( _entity, _hasChanged )
	{
		if (this.m.TargetTile != null && _entity.getTile().ID != this.m.TargetTile.ID)
		{
			local move = this.new("scripts/ai/world/orders/move_order");
			move.setDestination(this.m.TargetTile);
			this.getController().addOrderInFront(move);
			return true;
		}

		_entity.setOrders("Raiding");

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
					e.setActive(false);

					if (e.getSettlement() != null && !e.getSettlement().isNull() && e.getSettlement().isAlive())
					{
						local situation;
						local f = this.World.FactionManager.getFaction(_entity.getFaction());

						if (f != null && (f.getType() == this.Const.FactionType.Undead || f.getType() == this.Const.FactionType.Zombies))
						{
							situation = this.new("scripts/entity/world/settlements/situations/terrified_villagers_situation");
						}
						else
						{
							situation = this.new("scripts/entity/world/settlements/situations/raided_situation");
						}

						situation.setValidForDays(2);
						e.getSettlement().addSituation(situation);
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

