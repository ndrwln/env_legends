this.patrol_order <- this.inherit("scripts/ai/world/orders/move_order", {
	m = {
		WaitTime = 0.0
	},
	function setWaitTime( _w )
	{
		this.m.WaitTime = _w;
	}

	function create()
	{
		this.move_order.create();
		this.m.ID = this.Const.World.AI.Behavior.ID.Patrol;
	}

	function onSerialize( _out )
	{
		this.move_order.onSerialize(_out);
		_out.writeF32(this.m.WaitTime);
	}

	function onDeserialize( _in )
	{
		this.move_order.onDeserialize(_in);
		this.m.WaitTime = _in.readF32();
	}

	function onExecute( _entity, _hasChanged )
	{
		if (this.m.TargetTile == null)
		{
			if (this.m.WaitTime != 0)
			{
				local w = this.new("scripts/ai/world/orders/wait_order");
				w.setTime(this.m.WaitTime);
				this.getController().addOrderInFront(w);
			}

			local f = this.World.FactionManager.getFaction(this.getController().getEntity().getFaction());
			local p = this.World.State.getPlayer().getTile();
			local s = clone f.getSettlements();
			s.sort(function ( _a, _b )
			{
				local a = _a.getTile().getDistanceTo(p);
				local b = _b.getTile().getDistanceTo(p);

				if (a > b)
				{
					return 1;
				}
				else if (a < b)
				{
					return -1;
				}

				return 0;
			});
			local r = this.Math.rand(0, this.Math.max(3, s.len() - 1));
			this.m.TargetTile = s[r].getTile();
			return true;
			  // [064]  OP_CLOSE          0      3    0    0
		}

		::logInfo("patrolling");
		_entity.setOrders("Patrolling");

		if (_entity.getTile().ID == $[stack offset 0].m.TargetTile.ID)
		{
			if (_entity.getPos().X == $[stack offset 0].m.TargetTile.Pos.X + $[stack offset 0].m.Offset.X && _entity.getPos().Y == $[stack offset 0].m.TargetTile.Pos.Y + $[stack offset 0].m.Offset.Y)
			{
				$[stack offset 0].m.TargetTile = null;
				return true;
			}
			else
			{
				_entity.setDestination($[stack offset 0].createVec($[stack offset 0].m.TargetTile.Pos.X + $[stack offset 0].m.Offset.X, $[stack offset 0].m.TargetTile.Pos.Y + $[stack offset 0].m.Offset.Y));
			}
		}
		else if (_hasChanged || _entity.getPath() == null)
		{
			local navSettings = $[stack offset 0].World.getNavigator().createSettings();
			navSettings.ActionPointCosts = $[stack offset 0].Const.World.TerrainTypeNavCost;
			navSettings.RoadMult = 1.0 / $[stack offset 0].Const.World.MovementSettings.RoadMult;

			if ($[stack offset 0].m.RoadsOnly)
			{
				navSettings.RoadMult *= 0.05;
			}

			if ($[stack offset 0].m.AvoidSettlements)
			{
				navSettings.HeatCost = 100;
			}

			local path = $[stack offset 0].World.getNavigator().findPath(_entity.getTile(), $[stack offset 0].m.TargetTile, navSettings, 0);

			if (!path.isEmpty())
			{
				_entity.setPath(path);
			}
		}

		return true;
	}

});

