this.tile_hills <- this.inherit("scripts/mapgen/map_template", {
	m = {
		Hillify = [
			"world_detail_hills_01",
			"world_detail_hills_02",
			"world_detail_hills_05"
		],
		HillifyHeath = [
			"world_detail_hills_heath_01",
			"world_detail_hills_heath_02",
			"world_detail_hills_heath_05"
		],
		HillifySnow = [
			"world_detail_hills_snow_01",
			"world_detail_hills_snow_02"
		]
	},
	function init()
	{
		this.m.Name = "world.tile.hills";
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

		tile.Type = this.Const.World.TerrainType.Hills;
		tile.TacticalType = this.Const.World.TerrainTacticalType.Hills;
	}

	function onSecondPass( _rect )
	{
		local tile = this.World.getTileSquare(_rect.X, _rect.Y);
		local hills = 0;
		local steppe = 0;
		local desert = 0;
		local tundra = 0;
		local snow = 0;
		local mountains = [];

		for( local i = 0; i != 6; i = ++i )
		{
			if (!tile.hasNextTile(i))
			{
			}
			else
			{
				local nextTile = tile.getNextTile(i);
				local type = nextTile.Type;

				if (type == this.Const.World.TerrainType.Hills)
				{
					hills = ++hills;
				}

				if (type == this.Const.World.TerrainType.Steppe || type == this.Const.World.TerrainType.Hills && nextTile.Subregion == this.Const.World.TerrainType.Steppe)
				{
					steppe = ++steppe;
				}
				else if ((type == this.Const.World.TerrainType.Desert || type == this.Const.World.TerrainType.Oasis) || type == this.Const.World.TerrainType.Hills && nextTile.Subregion == this.Const.World.TerrainType.Desert)
				{
					desert = ++desert;
				}
				else if (type == this.Const.World.TerrainType.Tundra || type == this.Const.World.TerrainType.Hills && nextTile.Subregion == this.Const.World.TerrainType.Tundra)
				{
					tundra = ++tundra;
				}
				else if (type == this.Const.World.TerrainType.Snow || type == this.Const.World.TerrainType.Hills && nextTile.Subregion == this.Const.World.TerrainType.Snow)
				{
					snow = ++snow;
				}
				else if (type == this.Const.World.TerrainType.Mountains)
				{
					mountains.push(nextTile);
				}
			}
		}

		if (steppe >= 2 || mountains.len() >= 1 && steppe != 0)
		{
			tile.setBrush("world_steppe_0" + this.Math.rand(1, 3));
			tile.Subregion = this.Const.World.TerrainType.Steppe;

			if (mountains.len() >= 1)
			{
				tile.TacticalType = this.Const.World.TerrainTacticalType.SteppeHills;

				if (tile.hasNextTile(this.Const.Direction.NE) && tile.getNextTile(this.Const.Direction.NE).IsOccupied)
				{
					tile.spawnDetail("world_steppe_hill_grey_0" + this.Math.rand(6, 6), this.Const.World.ZLevel.Terrain, this.Const.World.DetailType.Hills, false);
				}
				else
				{
					tile.spawnDetail("world_steppe_hill_grey_0" + this.Math.rand(3, 6), this.Const.World.ZLevel.Terrain, this.Const.World.DetailType.Hills, false);
				}
			}
			else if (steppe >= 4 || steppe >= 3 && this.Math.rand(1, 100) <= 50)
			{
				tile.TacticalType = this.Const.World.TerrainTacticalType.SteppeHills;
				local r;

				if (hills <= 2 || tile.hasNextTile(this.Const.Direction.NE) && tile.getNextTile(this.Const.Direction.NE).IsOccupied)
				{
					r = this.Math.rand(1, 3);
				}
				else
				{
					r = this.Math.rand(1, 5);
				}

				tile.spawnDetail("world_steppe_hill_grey_0" + r, this.Const.World.ZLevel.Terrain, this.Const.World.DetailType.Hills, false);

				if (r <= 2 && this.Math.rand(1, 100) <= 25)
				{
					tile.spawnDetail("world_detail_plains_stony_0" + this.Math.rand(1, 5), this.Const.World.ZLevel.Object, 0);
				}
				else if (r <= 2 && this.Math.rand(1, 100) <= 25)
				{
					tile.spawnDetail("world_detail_steppe_flowers_0" + this.Math.rand(1, 6), this.Const.World.ZLevel.Object, this.Const.World.DetailType.NotCompatibleWithRoad);
				}
				else if (this.Math.rand(1, 100) <= 10)
				{
					tile.spawnDetail("world_steppe_dry_0" + this.Math.rand(1, 5), this.Const.World.ZLevel.Object, 0);
				}
			}
			else
			{
				tile.Type = this.Const.World.TerrainType.Steppe;
				tile.TacticalType = this.Const.World.TerrainTacticalType.Steppe;

				if (this.Math.rand(1, 100) <= 33)
				{
					tile.spawnDetail("world_detail_plains_stony_0" + this.Math.rand(1, 5), this.Const.World.ZLevel.Object, 0);
				}
			}
		}
		else if (desert >= 2 || mountains.len() >= 1 && desert != 0)
		{
			tile.setBrush("world_desert_0" + this.Math.rand(1, 4));
			tile.Subregion = this.Const.World.TerrainType.Desert;

			if (mountains.len() >= 1)
			{
				tile.TacticalType = this.Const.World.TerrainTacticalType.DesertHills;

				if (tile.hasNextTile(this.Const.Direction.NE) && tile.getNextTile(this.Const.Direction.NE).IsOccupied)
				{
					tile.spawnDetail("world_steppe_hill_grey_0" + this.Math.rand(6, 6), this.Const.World.ZLevel.Terrain, this.Const.World.DetailType.Hills, false);
				}
				else
				{
					tile.spawnDetail("world_steppe_hill_grey_0" + this.Math.rand(3, 6), this.Const.World.ZLevel.Terrain, this.Const.World.DetailType.Hills, false);
				}
			}
			else if (steppe >= 4 || steppe >= 3 && this.Math.rand(1, 100) <= 50)
			{
				tile.TacticalType = this.Const.World.TerrainTacticalType.DesertHills;
				local r;

				if (hills <= 2 || tile.hasNextTile(this.Const.Direction.NE) && tile.getNextTile(this.Const.Direction.NE).IsOccupied)
				{
					r = this.Math.rand(1, 3);
				}
				else
				{
					r = this.Math.rand(1, 5);
				}

				tile.spawnDetail("world_steppe_hill_grey_0" + r, this.Const.World.ZLevel.Terrain, this.Const.World.DetailType.Hills, false);

				if (r <= 2 && this.Math.rand(1, 100) <= 25)
				{
					tile.spawnDetail("world_detail_plains_stony_0" + this.Math.rand(1, 5), this.Const.World.ZLevel.Object, 0);
				}
			}
			else
			{
				tile.Type = this.Const.World.TerrainType.Desert;
				tile.TacticalType = this.Const.World.TerrainTacticalType.Desert;

				if (this.Math.rand(1, 100) <= 33)
				{
					tile.spawnDetail("world_detail_plains_stony_0" + this.Math.rand(1, 5), this.Const.World.ZLevel.Object, 0);
				}
			}
		}
		else if (tundra >= 2)
		{
			tile.setBrush("world_highlands_01");
			tile.Subregion = this.Const.World.TerrainType.Tundra;
			tile.TacticalType = this.Const.World.TerrainTacticalType.HighlandsHills;

			if (mountains.len() >= 1)
			{
				tile.spawnDetail("world_tundra_hill_0" + this.Math.rand(3, 4), this.Const.World.ZLevel.Terrain, this.Const.World.DetailType.Hills, false);
			}
			else
			{
				tile.spawnDetail("world_tundra_hill_0" + this.Math.rand(1, 3), this.Const.World.ZLevel.Terrain, this.Const.World.DetailType.Hills, false);

				if (this.Math.rand(1, 100) <= 50)
				{
					if (this.Math.rand(1, 100) <= 75)
					{
						tile.spawnDetail("world_detail_highlands_0" + this.Math.rand(1, 9), this.Const.World.ZLevel.Object, this.Const.World.DetailType.Hills, false);
					}
					else
					{
						tile.spawnDetail("world_detail_forest_light_0" + this.Math.rand(1, 5), this.Const.World.ZLevel.Object, 0);
					}
				}
			}
		}
		else if (snow >= 2 || _rect.Y >= this.Const.World.Settings.SizeY * this.Const.World.Settings.Snowline)
		{
			tile.setBrush("world_snow_0" + this.Math.rand(1, 3));
			tile.Subregion = this.Const.World.TerrainType.Snow;
			tile.TacticalType = this.Const.World.TerrainTacticalType.SnowyHills;

			if (mountains.len() >= 1)
			{
				tile.spawnDetail("world_snow_hill_0" + this.Math.rand(3, 5), this.Const.World.ZLevel.Terrain, this.Const.World.DetailType.Hills, false);
			}
			else
			{
				tile.spawnDetail("world_snow_hill_0" + this.Math.rand(1, 3), this.Const.World.ZLevel.Terrain, this.Const.World.DetailType.Hills, false);
			}
		}
		else
		{
			if (steppe != 0)
			{
				tile.setBrush("world_steppe_0" + this.Math.rand(1, 3));
				tile.TacticalType = this.Const.World.TerrainTacticalType.SteppeHills;
			}
			else
			{
				tile.setBrush("world_grassland_0" + this.Math.rand(1, 4));
				tile.TacticalType = this.Const.World.TerrainTacticalType.Hills;
			}

			if (mountains.len() >= 1)
			{
				if (tile.hasNextTile(this.Const.Direction.NE) && tile.getNextTile(this.Const.Direction.NE).IsOccupied)
				{
					tile.spawnDetail("world_grass_hill_0" + this.Math.rand(6, 6), this.Const.World.ZLevel.Terrain, this.Const.World.DetailType.Hills, false);
				}
				else
				{
					tile.spawnDetail("world_grass_hill_0" + this.Math.rand(4, 6), this.Const.World.ZLevel.Terrain, this.Const.World.DetailType.Hills, false);
				}
			}
			else
			{
				if (tile.hasNextTile(this.Const.Direction.NE) && tile.getNextTile(this.Const.Direction.NE).IsOccupied)
				{
					tile.spawnDetail("world_grass_hill_0" + this.Math.rand(1, 3), this.Const.World.ZLevel.Terrain, this.Const.World.DetailType.Hills, false);
				}
				else
				{
					tile.spawnDetail("world_grass_hill_0" + this.Math.rand(1, 5), this.Const.World.ZLevel.Terrain, this.Const.World.DetailType.Hills, false);
				}

				if (this.Math.rand(1, 100) <= 50)
				{
					if (this.Math.rand(1, 100) <= 75)
					{
						tile.spawnDetail("world_detail_flowers_0" + this.Math.rand(1, 6), this.Const.World.ZLevel.Object, this.Const.World.DetailType.Hills, false);
					}
					else if (_rect.Y > this.Const.World.Settings.SizeY * 0.25)
					{
						tile.spawnDetail("world_detail_forest_light_0" + this.Math.rand(1, 5), this.Const.World.ZLevel.Object, 0);
					}
				}
			}
		}
	}

});

