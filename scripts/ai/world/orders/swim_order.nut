this.swim_order <- this.inherit("scripts/ai/world/world_behavior", {
	m = {
		TargetTile = null
	},
	function setDestination( _t )
	{
		this.m.TargetTile = _t;
	}

	function create()
	{
		this.world_behavior.create();
		this.m.ID = this.Const.World.AI.Behavior.ID.Swim;
	}

	function onSerialize( _out )
	{
		this.world_behavior.onSerialize(_out);
		_out.writeI16(this.m.TargetTile.Coords.X);
		_out.writeI16(this.m.TargetTile.Coords.Y);
	}

	function onDeserialize( _in )
	{
		this.world_behavior.onDeserialize(_in);
		local x = _in.readI16();
		local y = _in.readI16();
		this.m.TargetTile = this.World.getTile(x, y);
	}

	function onExecute( _entity, _hasChanged )
	{
		_entity.setOrders("Sailing");

		if (_entity.getTile().ID == this.m.TargetTile.ID)
		{
			this.getController().popOrder();
		}
		else if (_hasChanged || _entity.getPath() == null)
		{
			local navSettings = this.World.getNavigator().createSettings();
			navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost_Ship;
			local path = this.World.getNavigator().findPath(_entity.getTile(), this.m.TargetTile, navSettings, 0);

			if (!path.isEmpty())
			{
				_entity.setPath(path);
			}
		}

		return true;
	}

});

