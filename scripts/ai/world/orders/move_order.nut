this.move_order <- this.inherit("scripts/ai/world/world_behavior", {
	m = {
		TargetTile = null,
		Offset = null,
		RoadsOnly = false,
		AvoidSettlements = false
	},
	function setDestination( _t )
	{
		this.m.TargetTile = _t;
	}

	function setRoadsOnly( _r )
	{
		this.m.RoadsOnly = _r;
	}

	function setAvoidSettlements( _a )
	{
		this.m.AvoidSettlements = _a;
	}

	function create()
	{
		this.world_behavior.create();
		this.m.ID = this.Const.World.AI.Behavior.ID.Move;
		this.m.Offset = this.createVec(this.Math.rand(0, 70) - 35, this.Math.rand(0, 70) - 35);
	}

	function onSerialize( _out )
	{
		this.world_behavior.onSerialize(_out);

		if (this.m.TargetTile != null)
		{
			_out.writeI16(this.m.TargetTile.Coords.X);
			_out.writeI16(this.m.TargetTile.Coords.Y);
		}
		else
		{
			_out.writeI16(-1);
			_out.writeI16(-1);
		}

		_out.writeBool(this.m.RoadsOnly);
		_out.writeBool(this.m.AvoidSettlements);
	}

	function onDeserialize( _in )
	{
		this.world_behavior.onDeserialize(_in);
		local x = _in.readI16();
		local y = _in.readI16();

		if (x != -1 && y != -1)
		{
			this.m.TargetTile = this.World.getTile(x, y);
		}

		this.m.RoadsOnly = _in.readBool();
		this.m.AvoidSettlements = _in.readBool();
	}

	function onExecute( _entity, _hasChanged )
	{
		if (this.m.TargetTile == null)
		{
			this.getController().popOrder();
			return true;
		}

		_entity.setOrders("Moving");

		if (_entity.getTile().ID == this.m.TargetTile.ID)
		{
			if (_entity.getPos().X == this.m.TargetTile.Pos.X + this.m.Offset.X && _entity.getPos().Y == this.m.TargetTile.Pos.Y + this.m.Offset.Y)
			{
				this.getController().popOrder();
			}
			else
			{
				_entity.setDestination(this.createVec(this.m.TargetTile.Pos.X + this.m.Offset.X, this.m.TargetTile.Pos.Y + this.m.Offset.Y));
			}
		}
		else if (_hasChanged || _entity.getPath() == null)
		{
			local navSettings = this.World.getNavigator().createSettings();
			navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost;
			navSettings.RoadMult = 1.0 / this.Const.World.MovementSettings.RoadMult;

			if (this.m.RoadsOnly)
			{
				navSettings.RoadMult *= 0.05;
			}

			if (this.m.AvoidSettlements)
			{
				navSettings.HeatCost = 100;
			}

			local path = this.World.getNavigator().findPath(_entity.getTile(), this.m.TargetTile, navSettings, 0);

			if (!path.isEmpty())
			{
				_entity.setPath(path);
			}
		}

		return true;
	}

});

