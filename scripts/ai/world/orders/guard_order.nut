this.guard_order <- this.inherit("scripts/ai/world/world_behavior", {
	m = {
		TargetTile = null,
		WaitTime = 0.0,
		WaitTimeStart = 0.0
	},
	function setTarget( _t )
	{
		this.m.TargetTile = _t;
	}

	function setTime( _t )
	{
		this.m.WaitTime = _t;
	}

	function create()
	{
		this.world_behavior.create();
		this.m.ID = this.Const.World.AI.Behavior.ID.Guard;
	}

	function onSerialize( _out )
	{
		this.world_behavior.onSerialize(_out);
		_out.writeI16(this.m.TargetTile.Coords.X);
		_out.writeI16(this.m.TargetTile.Coords.Y);
		_out.writeF32(this.m.WaitTime);
		_out.writeF32(this.m.WaitTimeStart);
	}

	function onDeserialize( _in )
	{
		this.world_behavior.onDeserialize(_in);
		local x = _in.readI16();
		local y = _in.readI16();
		this.m.TargetTile = this.World.getTile(x, y);
		this.m.WaitTime = _in.readF32();
		this.m.WaitTimeStart = _in.readF32();
	}

	function onExecute( _entity, _hasChanged )
	{
		if (_entity.getTile().ID == this.m.TargetTile.ID)
		{
			_entity.setOrders("Guarding");

			if (this.m.WaitTimeStart == 0)
			{
				this.m.WaitTimeStart = this.Time.getVirtualTimeF();
			}
			else if (!this.getController().hasKnownOpponent() && this.m.WaitTimeStart + this.m.WaitTime <= this.Time.getVirtualTimeF())
			{
				this.getController().popOrder();
			}
		}
		else
		{
			_entity.setOrders("Falling back");

			if (_hasChanged || _entity.getPath() == null)
			{
				local navSettings = this.World.getNavigator().createSettings();
				navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost;
				navSettings.RoadMult = 1.0;
				local path = this.World.getNavigator().findPath(_entity.getTile(), this.m.TargetTile, navSettings, 0);

				if (!path.isEmpty())
				{
					_entity.setPath(path);
				}
				else
				{
					this.m.TargetTile = null;
				}
			}
		}

		return true;
	}

});

