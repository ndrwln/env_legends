this.tile_oasis <- this.inherit("scripts/mapgen/map_template", {
	m = {},
	function init()
	{
		this.m.Name = "world.tile.oasis";
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

		tile.Type = this.Const.World.TerrainType.Oasis;
		tile.TacticalType = this.Const.World.TerrainTacticalType.Oasis;
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
			tile.setBrush("world_desert_10");
		}
		else
		{
			tile.setBrush("world_desert_0" + this.Math.rand(6, 9));
		}
	}

	function onSecondPass( _rect )
	{
		local tile = this.World.getTileSquare(_rect.X, _rect.Y);
		local forest = 0;
		local forest_leave = 0;
		local forest_autumn = 0;
		local mountain = 0;
		local hills = 0;
		local plains = 0;
		local swamp = 0;
		local urban = 0;
		local highlands = 0;
		local steppe = 0;
		local desert = 0;
		local plains = 0;

		for( local i = 0; i != 6; i = ++i )
		{
			if (!tile.hasNextTile(i))
			{
			}
			else
			{
				local nextTile = tile.getNextTile(i);
				local type = nextTile.Type;

				if (type == this.Const.World.TerrainType.Forest)
				{
					forest = ++forest;
				}
				else if (type == this.Const.World.TerrainType.LeaveForest)
				{
					forest_leave = ++forest_leave;
				}
				else if (type == this.Const.World.TerrainType.Mountains)
				{
					mountain = ++mountain;
				}
				else if (type == this.Const.World.TerrainType.Hills)
				{
					hills = ++hills;
				}
				else if (type == this.Const.World.TerrainType.Plains)
				{
					plains = ++plains;
				}
				else if (type == this.Const.World.TerrainType.Swamp)
				{
					swamp = ++swamp;
				}
				else if (type == this.Const.World.TerrainType.Urban)
				{
					urban = ++urban;
				}
				else if (type == this.Const.World.TerrainType.Tundra)
				{
					highlands = ++highlands;
				}
				else if (type == this.Const.World.TerrainType.Steppe)
				{
					steppe = ++steppe;
				}
				else if (type == this.Const.World.TerrainType.Desert)
				{
					desert = ++desert;
				}
				else if (type == this.Const.World.TerrainType.Plains)
				{
					plains = ++plains;
				}
				else if (type == this.Const.World.TerrainType.AutumnForest)
				{
					forest_autumn = ++forest_autumn;
				}
			}
		}

		if (plains > 0)
		{
			if (this.Math.rand(1, 100) <= 33)
			{
				tile.spawnDetail("world_grass_0" + this.Math.rand(1, 6), this.Const.World.ZLevel.Terrain, this.Const.World.DetailType.NotCompatibleWithRoad);
			}
		}
		else if (forest > 0 && forest > forest_leave && forest > forest_autumn)
		{
			if (this.Math.rand(1, 100) <= 50)
			{
				tile.spawnDetail("world_detail_forest_light_0" + this.Math.rand(1, 5), this.Const.World.ZLevel.Object, 0);
			}
		}
		else if (forest_leave > 0 && forest_leave > forest && forest_leave > forest_autumn)
		{
			if (this.Math.rand(1, 100) <= 50)
			{
				tile.spawnDetail("world_detail_forest_leaves_light_0" + this.Math.rand(1, 5), this.Const.World.ZLevel.Object, 0);
			}
		}
		else if (forest_autumn > 0 && forest_autumn > forest && forest_autumn > forest_leave)
		{
			if (this.Math.rand(1, 100) <= 50 + forest_autumn * 10)
			{
				local r = this.Math.rand(1, 10);
				tile.spawnDetail("world_detail_autumn_light_" + (r < 10 ? "0" + r : r), this.Const.World.ZLevel.Object, 0);
			}
		}
		else if (swamp != 0)
		{
			if (this.Math.rand(1, 100) <= 50 + swamp * 4)
			{
				tile.spawnDetail("world_detail_swamp_light_0" + this.Math.rand(0, 9), this.Const.World.ZLevel.Object, this.Const.World.DetailType.Swamp);
			}
		}
		else if (steppe != 0)
		{
			if (this.Math.rand(1, 100) <= 50 + steppe * 2)
			{
				local d = tile.spawnDetail("world_steppe_transition_0" + this.Math.rand(1, 4), this.Const.World.ZLevel.Terrain, this.Const.World.DetailType.NotCompatibleWithRoad);
				d.setBrightness(0.95);
			}
			else if (this.Math.rand(1, 100) <= 10)
			{
				local d = tile.spawnDetail("world_steppe_brush_0" + this.Math.rand(1, 6), this.Const.World.ZLevel.Object, 0);
				d.Saturation = 0.8;
			}
		}
		else if (!tile.HasRoad)
		{
			local r = this.Math.rand(1, 8);

			if (r < 10)
			{
				r = "0" + r;
			}

			tile.spawnDetail("world_detail_desert_oasis_" + r, this.Const.World.ZLevel.Object, this.Const.World.DetailType.NotCompatibleWithRoad);
		}
		else
		{
			local r = this.Math.rand(9, 13);

			if (r < 10)
			{
				r = "0" + r;
			}

			tile.spawnDetail("world_detail_desert_oasis_" + r, this.Const.World.ZLevel.Object, this.Const.World.DetailType.NotCompatibleWithRoad);
		}
	}

});

