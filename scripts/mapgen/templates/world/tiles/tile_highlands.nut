this.tile_highlands <- this.inherit("scripts/mapgen/map_template", {
	m = {
		DetailsTerrain = [
			"world_detail_highlands_02",
			"world_detail_highlands_11"
		],
		DetailsObject = [
			"world_detail_highlands_01",
			"world_detail_highlands_03",
			"world_detail_highlands_04",
			"world_detail_highlands_05",
			"world_detail_highlands_06",
			"world_detail_highlands_07",
			"world_detail_highlands_08",
			"world_detail_highlands_09",
			"world_detail_highlands_10",
			"world_detail_highlands_12",
			"world_detail_highlands_13",
			"world_detail_highlands_14",
			"world_detail_highlands_15",
			"world_detail_highlands_16",
			"world_detail_highlands_18",
			"world_detail_highlands_19",
			"world_detail_highlands_20",
			"world_detail_highlands_21",
			"world_detail_treetrunk_01"
		],
		DetailsSpecial = [
			"world_detail_highlands_17"
		]
	},
	function init()
	{
		this.m.Name = "world.tile.highlands";
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

		tile.Type = this.Const.World.TerrainType.Tundra;
		tile.TacticalType = this.Const.World.TerrainTacticalType.Highlands;
		local r = this.Math.rand(1, 100);

		if (r <= 40)
		{
			tile.setBrush("world_highlands_01");
		}
		else if (r <= 80)
		{
			tile.setBrush("world_highlands_02");
		}
		else
		{
			tile.setBrush("world_highlands_03");
		}
	}

	function onSecondPass( _rect )
	{
		local tile = this.World.getTileSquare(_rect.X, _rect.Y);
		local mountain = 0;
		local hills = 0;
		local forest = 0;
		local forest_leave = 0;
		local forest_autumn = 0;
		local swamp = 0;
		local plains = 0;
		local snow = 0;
		local hills = 0;
		local ocean = 0;
		local shore = 0;

		for( local i = 0; i != 6; i = ++i )
		{
			if (!tile.hasNextTile(i))
			{
			}
			else
			{
				local nextTile = tile.getNextTile(i);
				local type = nextTile.Type;

				if (type == this.Const.World.TerrainType.Mountains)
				{
					mountain = ++mountain;
				}
				else if (type == this.Const.World.TerrainType.Hills)
				{
					hills = ++hills;
				}
				else if (type == this.Const.World.TerrainType.Forest)
				{
					forest = ++forest;
				}
				else if (type == this.Const.World.TerrainType.LeaveForest)
				{
					forest_leave = ++forest_leave;
				}
				else if (type == this.Const.World.TerrainType.Swamp)
				{
					swamp = ++swamp;
				}
				else if (type == this.Const.World.TerrainType.Plains)
				{
					plains = ++plains;
				}
				else if (type == this.Const.World.TerrainType.Hills)
				{
					hills = ++hills;
				}
				else if (type == this.Const.World.TerrainType.Snow)
				{
					snow = ++snow;
				}
				else if (type == this.Const.World.TerrainType.Ocean)
				{
					ocean = ++ocean;
				}
				else if (type == this.Const.World.TerrainType.Shore)
				{
					shore = ++shore;
				}
				else if (type == this.Const.World.TerrainType.AutumnForest)
				{
					forest_autumn = ++forest_autumn;
				}
			}
		}

		if (plains != 0 && this.Math.rand(1, 100) <= 66 || hills >= 2)
		{
			tile.setBrush("world_highlands_03");
		}

		if (forest > 0 && forest > forest_leave)
		{
			if (this.Math.rand(1, 100) <= 50)
			{
				tile.spawnDetail("world_detail_forest_light_0" + this.Math.rand(1, 5), this.Const.World.ZLevel.Object, 0);
			}
		}
		else if (forest_leave > 0 && forest_leave > forest)
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
				local d = tile.spawnDetail("world_detail_autumn_light_" + (r < 10 ? "0" + r : r), this.Const.World.ZLevel.Object, 0);
			}
		}
		else if (mountain != 0 || hills >= 2)
		{
			if (this.Math.rand(1, 100) <= 50)
			{
				tile.spawnDetail("world_detail_plains_stony_0" + this.Math.rand(1, 5), this.Const.World.ZLevel.Object, 0);
			}
		}
		else if (swamp != 0)
		{
			if (this.Math.rand(1, 100) <= 50 + swamp * 4)
			{
				tile.spawnDetail("world_detail_swamp_light_0" + this.Math.rand(0, 9), this.Const.World.ZLevel.Object, this.Const.World.DetailType.Swamp);
			}
		}
		else if (this.Math.rand(1, 100) <= 10)
		{
			tile.spawnDetail("world_detail_forest_light_0" + this.Math.rand(1, 5), this.Const.World.ZLevel.Object, 0);
		}
		else if (plains == 0 && tile.getBrush() != "world_highlands_03" && this.Math.rand(1, 100) <= 10)
		{
			tile.spawnDetail(this.m.DetailsTerrain[this.Math.rand(0, this.m.DetailsTerrain.len() - 1)], this.Const.World.ZLevel.Terrain, 0);
		}
		else if (this.Math.rand(1, 100) <= 66)
		{
			tile.spawnDetail(this.m.DetailsObject[this.Math.rand(0, this.m.DetailsObject.len() - 1)], this.Const.World.ZLevel.Object, 0);
		}
		else if (plains == 0 && this.Math.rand(1, 100) <= 2)
		{
			tile.spawnDetail(this.m.DetailsSpecial[this.Math.rand(0, this.m.DetailsSpecial.len() - 1)], this.Const.World.ZLevel.Object, this.Const.World.DetailType.Swamp);
		}

		if (ocean == 0 && shore == 0 && _rect.Y >= this.Const.World.Settings.SizeY * this.Const.World.Settings.Snowline - 7 && this.Math.rand(1, 100) <= 33)
		{
			tile.spawnDetail("world_snow_cover_01", this.Const.World.ZLevel.Terrain + 200, 0);
		}
	}

});

