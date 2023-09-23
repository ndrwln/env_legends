this.tile_mountains <- this.inherit("scripts/mapgen/map_template", {
	m = {},
	function init()
	{
		this.m.Name = "world.tile.mountains";
		this.m.MinX = 1;
		this.m.MinY = 1;
	}

	function onFirstPass( _rect )
	{
		local tile = this.World.getTileSquare(_rect.X, _rect.Y);

		if (tile.Type != 0 && tile.Type != this.Const.World.TerrainType.Mountains)
		{
			return;
		}

		tile.Type = this.Const.World.TerrainType.Mountains;
		tile.TacticalType = this.Const.World.TerrainTacticalType.Mountains;
	}

	function onSecondPass( _rect )
	{
		local hillTemplate = this.MapGen.get("world.tile.hills");
		local tile = this.World.getTileSquare(_rect.X, _rect.Y);
		local n = 0;

		for( local i = 0; i != 6; i = ++i )
		{
			if (!tile.hasNextTile(i))
			{
			}
			else
			{
				local nextTile = tile.getNextTile(i);

				if ((nextTile.Type == this.Const.World.TerrainType.Mountains || nextTile.Type == this.Const.World.TerrainType.Hills) && tile.Subregion != 100)
				{
					n = ++n;
				}
			}
		}

		if (n >= 6)
		{
			if (_rect.Y < this.Const.World.Settings.SizeY * this.Const.World.Settings.Snowline)
			{
				local n = this.Math.rand(3, 4);
				local m = tile.spawnDetail("world_mountain_0" + n, this.Const.World.ZLevel.Terrain, 0, false);
			}
			else
			{
				local n = this.Math.rand(1, 2);
				local m = tile.spawnDetail("world_mountain_snow_0" + n, this.Const.World.ZLevel.Terrain, 0, false);
			}

			tile.Subregion = 100;
			tile.Type = 0;
			hillTemplate.onFirstPass({
				X = tile.SquareCoords.X,
				Y = tile.SquareCoords.Y
			});
			tile.Type = this.Const.World.TerrainType.Mountains;
			tile.TacticalType = this.Const.World.TerrainTacticalType.Mountains;

			for( local i = 0; i != 6; i = ++i )
			{
				if (!tile.hasNextTile(i))
				{
				}
				else
				{
					local nextTile = tile.getNextTile(i);

					if (nextTile.Subregion != 100)
					{
						nextTile.clear();
						this.placeHills(nextTile);
						nextTile.Type = this.Const.World.TerrainType.Mountains;
						nextTile.TacticalType = this.Const.World.TerrainTacticalType.Mountains;
					}

					nextTile.Subregion = 100;

					if (i == 0 || i == 1 || i == 5)
					{
						nextTile.IsOccupied = true;
					}
				}
			}
		}
	}

	function onThirdPass( _rect )
	{
		local tile = this.World.getTileSquare(_rect.X, _rect.Y);

		if (tile.Subregion != 100)
		{
			tile.clear();
			tile.Type = 0;
			local hillTemplate = this.MapGen.get("world.tile.hills");
			hillTemplate.onFirstPass(_rect);
			hillTemplate.onSecondPass(_rect);
		}
	}

	function placeHills( _tile )
	{
		local tundra = 0;
		local snow = 0;
		local steppe = 0;
		local desert = 0;
		local mountains = [];

		for( local i = 0; i != 6; i = ++i )
		{
			if (!_tile.hasNextTile(i))
			{
			}
			else
			{
				local nextTile = _tile.getNextTile(i);
				local type = nextTile.Type;

				if (type == this.Const.World.TerrainType.Tundra || type == this.Const.World.TerrainType.Hills && nextTile.Subregion == this.Const.World.TerrainType.Tundra)
				{
					tundra = ++tundra;
				}
				else if (type == this.Const.World.TerrainType.Snow || type == this.Const.World.TerrainType.Hills && nextTile.Subregion == this.Const.World.TerrainType.Snow)
				{
					snow = ++snow;
				}
				else if (type == this.Const.World.TerrainType.Steppe || type == this.Const.World.TerrainType.Hills && nextTile.Subregion == this.Const.World.TerrainType.Steppe)
				{
					steppe = ++steppe;
				}
				else if (type == this.Const.World.TerrainType.Desert || type == this.Const.World.TerrainType.Hills && nextTile.Subregion == this.Const.World.TerrainType.Desert)
				{
					desert = ++desert;
				}
				else if (type == this.Const.World.TerrainType.Mountains)
				{
					mountains.push(nextTile);
				}
			}
		}

		if (tundra >= 1)
		{
			_tile.setBrush("world_highlands_01");
			_tile.spawnDetail("world_tundra_hill_0" + this.Math.rand(2, 4), this.Const.World.ZLevel.Terrain + 500, this.Const.World.DetailType.Hills, false);
			_tile.TacticalType = this.Const.World.TerrainTacticalType.HighlandsHills;
		}
		else if (snow >= 2 || _tile.SquareCoords.Y >= this.Const.World.Settings.SizeY * this.Const.World.Settings.Snowline)
		{
			_tile.setBrush("world_snow_0" + this.Math.rand(1, 3));
			_tile.spawnDetail("world_snow_hill_0" + this.Math.rand(2, 5), this.Const.World.ZLevel.Terrain + 500, this.Const.World.DetailType.Hills, false);
			_tile.TacticalType = this.Const.World.TerrainTacticalType.SnowyHills;
		}
		else if (steppe >= 1)
		{
			_tile.setBrush("world_steppe_0" + this.Math.rand(1, 3));
			_tile.spawnDetail("world_grass_hill_0" + this.Math.rand(5, 6), this.Const.World.ZLevel.Terrain + 500, this.Const.World.DetailType.Hills, false);
			_tile.TacticalType = this.Const.World.TerrainTacticalType.SteppeHills;
		}
		else if (desert >= 1)
		{
			_tile.setBrush("world_desert_04");
			_tile.spawnDetail("world_grass_hill_0" + this.Math.rand(4, 5), this.Const.World.ZLevel.Terrain + 500, this.Const.World.DetailType.Hills, false);
			_tile.TacticalType = this.Const.World.TerrainTacticalType.DesertHills;
		}
		else
		{
			_tile.setBrush("world_grassland_0" + this.Math.rand(1, 4));
			_tile.spawnDetail("world_grass_hill_0" + this.Math.rand(2, 6), this.Const.World.ZLevel.Terrain + 500, this.Const.World.DetailType.Hills, false);
			_tile.TacticalType = this.Const.World.TerrainTacticalType.Hills;
		}
	}

});

