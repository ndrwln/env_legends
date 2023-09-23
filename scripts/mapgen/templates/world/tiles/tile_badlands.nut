this.tile_badlands <- this.inherit("scripts/mapgen/map_template", {
	m = {},
	function init()
	{
		this.m.Name = "world.tile.badlands";
		this.m.MinX = 1;
		this.m.MinY = 1;
	}

	function onFirstPass( _rect )
	{
		local tile = this.World.getTileSquare(_rect.X, _rect.Y);

		if (tile.Type != 0)
		{
			return;
		}

		tile.Type = this.Const.World.TerrainType.Badlands;
		tile.TacticalType = this.Const.World.TerrainTacticalType.Badlands;
		tile.setBrush("world_badlands_0" + this.Math.rand(1, 3));
		tile.IsFlipped = this.Math.rand(0, 1) == 1;
	}

	function onSecondPass( _rect )
	{
		local tile = this.World.getTileSquare(_rect.X, _rect.Y);
		local mountain = tile.getSurroundingTilesOfType(this.Const.World.TerrainType.Mountains);

		if (mountain != 0)
		{
			if (this.Math.rand(1, 100) <= 50)
			{
				tile.spawnDetail("world_detail_plains_stony_0" + this.Math.rand(1, 5), this.Const.World.ZLevel.Object, 0);
			}
		}
		else if (this.Math.rand(1, 100) <= 13)
		{
			local n = this.Math.rand(1, 13);
			tile.spawnDetail("world_detail_badlands_" + (n < 10 ? "0" + n : n), this.Const.World.ZLevel.Object, 0);
		}
	}

});

