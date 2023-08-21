this.road <- this.inherit("scripts/mapgen/tactical_template", {
	m = {
		Details = [],
		ChanceToSpawnDetails = 0,
		LimitOfSpawnedDetails = 1,
		Objects = [
			"entity/tactical/objects/cartwheel"
		],
		ChanceToSpawnObject = 1
	},
	function init()
	{
		this.m.Name = "tactical.tile.road";
		this.m.MinX = 1;
		this.m.MinY = 1;
		local t = this.createTileTransition();
		t.setBlendIntoSockets(false);
		t.setBrush(this.Const.Direction.N, "transition_road_N");
		t.setBrush(this.Const.Direction.NE, "transition_road_NE");
		t.setBrush(this.Const.Direction.SE, "transition_road_SE");
		t.setBrush(this.Const.Direction.S, "transition_road_S");
		t.setBrush(this.Const.Direction.SW, "transition_road_SW");
		t.setBrush(this.Const.Direction.NW, "transition_road_NW");
		t.setSocket("socket_earth");
		this.Tactical.setTransitions("tile_road", t);
	}

	function onFirstPass( _rect )
	{
		local tile = this.Tactical.getTileSquare(_rect.X, _rect.Y);

		if (tile.Type != 0)
		{
			return;
		}

		tile.Type = this.Const.Tactical.TerrainType.PavedGround;
		tile.Subtype = this.Const.Tactical.TerrainSubtype.CobblestoneRoad;
		tile.BlendPriority = this.Const.Tactical.TileBlendPriority.Road;
		tile.setBrush("tile_road");
		local n = 0;

		if (this.Math.rand(0, 100) < this.m.ChanceToSpawnObject)
		{
			tile.spawnObject(this.m.Objects[this.Math.rand(0, this.m.Objects.len() - 1)]);
		}
		else if (this.m.Details.len() > 0)
		{
			while (this.Math.rand(0, 100) < this.m.ChanceToSpawnDetails && n++ < this.m.LimitOfSpawnedDetails)
			{
				tile.spawnDetail(this.m.Details[this.Math.rand(0, this.m.Details.len() - 1)]);
			}
		}
	}

	function onSerialize( _out )
	{
		this.map_template.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.map_template.onDeserialize(_in);
	}

});

