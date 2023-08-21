this.tile_ocean <- this.inherit("scripts/mapgen/map_template", {
	m = {},
	function init()
	{
		this.m.Name = "world.tile.ocean";
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

		tile.Type = this.Const.World.TerrainType.Ocean;
		tile.TacticalType = this.Const.World.TerrainTacticalType.Plains;
		tile.resetBrush();
	}

	function onSecondPass( _rect )
	{
		local tile = this.World.getTileSquare(_rect.X, _rect.Y);
		local dir = 0;
		local surrounding_land = 0;
		local plains = 0;
		local tundra = 0;
		local snow = 0;
		local steppe = 0;
		local desert = 0;

		for( local i = 0; i != 6; i = ++i )
		{
			if (!tile.hasNextTile(i))
			{
			}
			else
			{
				local land = tile.getNextTile(i);

				if (land.Type == this.Const.World.TerrainType.Ocean || land.Type == this.Const.World.TerrainType.Shore)
				{
				}
				else
				{
					dir = dir | this.Const.DirectionBit[i];
					surrounding_land = ++surrounding_land;
					local type = land.TacticalType;

					if (type == this.Const.World.TerrainTacticalType.Plains || type == this.Const.World.TerrainTacticalType.Hills)
					{
						plains = ++plains;
					}
					else if (type == this.Const.World.TerrainTacticalType.Steppe || type == this.Const.World.TerrainTacticalType.SteppeHills)
					{
						steppe = ++steppe;
					}
					else if (type == this.Const.World.TerrainTacticalType.Desert || type == this.Const.World.TerrainTacticalType.DesertHills)
					{
						desert = ++desert;
					}
					else if (type == this.Const.World.TerrainTacticalType.Highlands || type == this.Const.World.TerrainTacticalType.HighlandsHills)
					{
						tundra = ++tundra;
					}
					else if (type == this.Const.World.TerrainTacticalType.Snow || type == this.Const.World.TerrainTacticalType.SnowyHills)
					{
						snow = ++snow;
					}
				}
			}
		}

		if (surrounding_land == 6)
		{
			tile.clear();
			tile.Type = this.Const.World.TerrainType.Plains;
			tile.TacticalType = this.Const.World.TerrainTacticalType.Plains;
			tile.setBrush("world_grassland_0" + this.Math.rand(1, 4));
		}
		else if (dir != 0)
		{
			tile.Type = this.Const.World.TerrainType.Shore;
			tile.spawnDetail(this.Const.World.ShoreBrushes.get(dir), this.Const.World.ZLevel.Terrain + 1000, this.Const.World.DetailType.Shore, false);
			tile.Subregion = dir;

			if (tundra >= plains && tundra >= snow && tundra >= steppe && tundra >= desert)
			{
				tile.TacticalType = this.Const.World.TerrainTacticalType.Highlands;
			}
			else if (steppe >= plains && steppe >= tundra && steppe >= snow && steppe >= desert)
			{
				tile.TacticalType = this.Const.World.TerrainTacticalType.Steppe;
			}
			else if (desert >= plains && desert >= tundra && desert >= snow && desert >= steppe)
			{
				tile.TacticalType = this.Const.World.TerrainTacticalType.Desert;
			}
			else if (snow >= plains && snow >= tundra && snow >= steppe && snow >= desert)
			{
				tile.TacticalType = this.Const.World.TerrainTacticalType.Snow;
			}
			else
			{
				tile.TacticalType = this.Const.World.TerrainTacticalType.Plains;
			}
		}
	}

	function onThirdPass( _rect )
	{
		local tile = this.World.getTileSquare(_rect.X, _rect.Y);
		local shore = 0;
		local ocean = 0;
		local hills = 0;
		local mountains = 0;

		for( local i = 0; i != 6; i = ++i )
		{
			if (!tile.hasNextTile(i))
			{
			}
			else
			{
				local next = tile.getNextTile(i);

				if (tile.Type == this.Const.World.TerrainType.Ocean)
				{
					for( local j = 0; j != 6; j = ++j )
					{
						if (!next.hasNextTile(j))
						{
						}
						else
						{
							local veryNext = next.getNextTile(j);

							if (veryNext.Type == this.Const.World.TerrainType.Hills)
							{
								hills = ++hills;
							}
							else if (veryNext.Type == this.Const.World.TerrainType.Mountains)
							{
								mountains = ++mountains;
							}
							else if (veryNext.Type == this.Const.World.TerrainType.Shore)
							{
								shore = ++shore;
							}
						}
					}
				}

				if (next.Type == this.Const.World.TerrainType.Ocean)
				{
					ocean = ++ocean;
				}
				else if (next.Type == this.Const.World.TerrainType.Shore)
				{
					shore = ++shore;
				}
				else if (next.Type == this.Const.World.TerrainType.Hills)
				{
					hills = ++hills;
				}
				else if (next.Type == this.Const.World.TerrainType.Mountains)
				{
					mountains = ++mountains;
				}
			}
		}

		if (tile.Type == this.Const.World.TerrainType.Shore)
		{
			if (_rect.Y > this.Const.World.Settings.SizeY * this.Const.World.Settings.Snowline)
			{
			}
			else if (this.Math.rand(1, 100) <= 5)
			{
				tile.spawnDetail("world_coast_detail_" + this.Math.rand(23, 28), this.Const.World.ZLevel.Object, 0);
			}
		}
		else if (shore >= 1)
		{
			if (_rect.Y > this.Const.World.Settings.SizeY * this.Const.World.Settings.Snowline)
			{
				if (this.Math.rand(1, 100) <= 5 + shore)
				{
					if (this.Math.rand(1, 100) <= 60)
					{
						tile.spawnDetail("world_coast_detail_" + this.Math.rand(11, 16), this.Const.World.ZLevel.Object, 0);
					}
					else
					{
						tile.spawnDetail("world_coast_detail_ice_0" + this.Math.rand(1, 4), this.Const.World.ZLevel.Object, 0);
					}
				}
			}
			else if (this.Math.rand(1, 100) <= 1 + hills + mountains)
			{
				tile.spawnDetail("world_coast_detail_0" + this.Math.rand(1, 5), this.Const.World.ZLevel.Object, 0);
			}
			else if (this.Math.rand(1, 100) <= hills + mountains)
			{
				tile.spawnDetail("world_coast_detail_0" + this.Math.rand(1, 7), this.Const.World.ZLevel.Object, 0);
			}
		}
		else if (_rect.Y > this.Const.World.Settings.SizeY * this.Const.World.Settings.Snowline + 4)
		{
			if (this.Math.rand(1, 1000) <= 75 + shore * 50)
			{
				if (this.Math.rand(1, 100) <= 60)
				{
					tile.spawnDetail("world_coast_detail_1" + this.Math.rand(1, 6), this.Const.World.ZLevel.Object, 0);
				}
				else
				{
					tile.spawnDetail("world_coast_detail_ice_0" + this.Math.rand(1, 4), this.Const.World.ZLevel.Object, 0);
				}
			}
		}
		else if (this.Math.rand(1, 1000) <= 3)
		{
			tile.spawnDetail("world_coast_detail_0" + this.Math.rand(1, 5), this.Const.World.ZLevel.Object, 0);
		}
	}

});

