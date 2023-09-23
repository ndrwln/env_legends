this.tile_snow <- this.inherit("scripts/mapgen/map_template", {
	m = {},
	function init()
	{
		this.m.Name = "world.tile.snow";
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

		tile.Type = this.Const.World.TerrainType.Snow;
		tile.TacticalType = this.Const.World.TerrainTacticalType.Snow;
		local water = 0;

		for( local i = 0; i != 6; i = ++i )
		{
			if (!tile.hasNextTile(i))
			{
			}
			else
			{
				local nextTile = tile.getNextTile(i);

				if (nextTile.Type == this.Const.World.TerrainType.Shore)
				{
					water = ++water;
				}
				else if (nextTile.Type == this.Const.World.TerrainType.Ocean)
				{
					water = 6;
					break;
				}
			}
		}

		if (water >= 3)
		{
			tile.setBrush("world_snow_04");
		}
		else
		{
			tile.setBrush("world_snow_0" + this.Math.rand(1, 3));
		}
	}

	function onSecondPass( _rect )
	{
		local tile = this.World.getTileSquare(_rect.X, _rect.Y);
		local forest = 0;

		for( local i = 0; i != 6; i = ++i )
		{
			if (!tile.hasNextTile(i))
			{
			}
			else
			{
				local type = tile.getNextTile(i).Type;

				if (type == this.Const.World.TerrainType.Forest || type == this.Const.World.TerrainType.SnowyForest)
				{
					forest = ++forest;
				}
			}
		}

		if (forest > 0)
		{
			if (this.Math.rand(1, 100) <= 50)
			{
				tile.spawnDetail("world_detail_forest_snow_light_0" + this.Math.rand(1, 5), this.Const.World.ZLevel.Object, 0);
			}
		}
		else if (this.Math.rand(1, 1000) <= 3)
		{
			tile.spawnDetail("world_detail_forest_snow_light_0" + this.Math.rand(1, 5), this.Const.World.ZLevel.Object, 0);
		}
		else if (this.Math.rand(1, 100) <= 20)
		{
			tile.spawnDetail("world_detail_hills_snow_0" + this.Math.rand(1, 3), this.Const.World.ZLevel.Terrain, this.Const.World.DetailType.NotCompatibleWithRoad);
		}
		else if (_rect.Y < this.Const.World.Settings.SizeY * this.Const.World.Settings.Snowline && this.Math.rand(1, 100) <= 10)
		{
			tile.spawnDetail("world_detail_snow_transition_0" + this.Math.rand(1, 3), this.Const.World.ZLevel.Terrain, 0);
		}
		else if (_rect.Y < this.Const.World.Settings.SizeY * this.Const.World.Settings.Snowline + 5 && this.Math.rand(1, 100) <= 20)
		{
			local r = this.Math.rand(4, 10);
			tile.spawnDetail("world_detail_snow_transition_" + (r < 10 ? "0" + r : r), this.Const.World.ZLevel.Terrain, 0);
		}
	}

});

