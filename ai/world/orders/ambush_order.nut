this.ambush_order <- this.inherit("scripts/ai/world/world_behavior", {
	m = {
		TargetTile = null,
		WaitTimeStart = 0.0,
		Tries = 0
	},
	function create()
	{
		this.world_behavior.create();
		this.m.ID = this.Const.World.AI.Behavior.ID.Ambush;
	}

	function onSerialize( _out )
	{
		this.world_behavior.onSerialize(_out);
		_out.writeF32(this.m.WaitTimeStart);
	}

	function onDeserialize( _in )
	{
		this.world_behavior.onDeserialize(_in);
		this.m.WaitTimeStart = _in.readF32();
	}

	function onExecute( _entity, _hasChanged )
	{
		if (this.m.TargetTile != null && _entity.getTile().ID == this.m.TargetTile.ID)
		{
			if (this.m.WaitTimeStart == 0)
			{
				_entity.setOrders("Lying in Ambush");
				this.m.WaitTimeStart = this.Time.getVirtualTimeF();
			}
			else if (this.m.WaitTimeStart + this.Const.World.AI.Behavior.AmbushWaitTime <= this.Time.getVirtualTimeF())
			{
				this.getController().popOrder();
			}
		}
		else
		{
			_entity.setOrders("Preparing Ambush");

			if (_hasChanged || _entity.getPath() == null)
			{
				this.findTargetTile(_entity);

				if (this.m.TargetTile == null)
				{
					this.getController().popOrder();
				}

				local navSettings = this.World.getNavigator().createSettings();
				navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost_Sneak;
				navSettings.RoadMult = 1.0;
				navSettings.HeatCost = 100;
				local path = this.World.getNavigator().findPath(_entity.getTile(), this.m.TargetTile, navSettings, 0);

				if (!path.isEmpty())
				{
					_entity.setPath(path);
				}
				else
				{
					this.m.TargetTile = null;

					if (this.m.Tries++ >= 10)
					{
						this.getController().popOrder();
					}
				}
			}
		}

		return true;
	}

	function findTargetTile( _entity )
	{
		this.m.TargetTile = null;
		local ambushSpots = this.World.EntityManager.getAmbushSpots();
		local myTile = _entity.getTile();

		foreach( s in ambushSpots )
		{
			s.Distance = s.Tile.getDistanceTo(myTile);
		}

		ambushSpots.sort(this.onSortByLowestDistance);
		this.m.TargetTile = ambushSpots[this.Math.rand(0, this.Math.min(ambushSpots.len() - 1, this.Const.World.AI.Behavior.AmbushMaxSpots))].Tile;
	}

	function onSortByLowestDistance( _d1, _d2 )
	{
		if (_d1.Distance > _d2.Distance)
		{
			return 1;
		}
		else if (_d1.Distance < _d2.Distance)
		{
			return -1;
		}

		return 0;
	}

});

