this.tile_desert <- this.inherit("scripts/mapgen/map_template", {
	m = {
		DetailsGround = [
			"world_steppe_detail_01",
			"world_steppe_detail_02",
			"world_steppe_detail_03",
			"world_steppe_detail_05"
		],
		DetailsCommon = [
			"world_detail_desert_cactus_01",
			"world_detail_desert_cactus_02",
			"world_detail_desert_cactus_03",
			"world_detail_desert_cactus_04",
			"world_detail_desert_cactus_01",
			"world_detail_desert_cactus_02",
			"world_detail_desert_cactus_03",
			"world_detail_desert_cactus_04",
			"world_detail_desert_bones_01",
			"world_detail_desert_bones_02",
			"world_detail_desert_bones_03"
		],
		DetailsTerrain = [
			"world_steppe_grass_01",
			"world_steppe_grass_02",
			"world_steppe_grass_01",
			"world_steppe_grass_02",
			"world_steppe_grass_03",
			"world_steppe_grass_03"
		],
		DetailsBrush = [
			"world_steppe_brush_01",
			"world_steppe_brush_02",
			"world_steppe_brush_03",
			"world_steppe_brush_04",
			"world_steppe_brush_05"
		],
		DetailsDryObject = [
			"world_steppe_dry_01",
			"world_steppe_dry_02",
			"world_steppe_dry_03",
			"world_steppe_dry_04"
		],
		DetailsRuins = [
			"world_detail_desert_ruins_01",
			"world_detail_desert_ruins_02"
		],
		DetailsTrees = [
			"world_steppe_tree_01",
			"world_steppe_tree_02",
			"world_steppe_tree_03",
			"world_steppe_tree_04"
		],
		DetailsFlowers = [
			"world_detail_highlands_05",
			"world_detail_highlands_12",
			"world_detail_highlands_14",
			"world_detail_highlands_19"
		]
	},
	function init()
	{
		this.m.Name = "world.tile.desert";
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

		tile.Type = this.Const.World.TerrainType.Desert;
		tile.TacticalType = this.Const.World.TerrainTacticalType.Desert;
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
			tile.setBrush("world_desert_04");
		}
		else
		{
			tile.setBrush("world_desert_0" + this.Math.rand(1, 3));
		}
	}

	function onSecondPass( _rect )
	{
		local tile = this.World.getTileSquare(_rect.X, _rect.Y);
		local forest_leave = 0;
		local plains = 0;
		local hills = 0;
		local forest_autumn = 0;
		local brown_hills = 0;
		local shore = 0;
		local steppe = 0;
		local oasis = 0;
		local subregions = [];
		subregions.resize(4, 0);

		for( local i = 0; i != 6; i = ++i )
		{
			if (!tile.hasNextTile(i))
			{
			}
			else
			{
				local nextTile = tile.getNextTile(i);
				local type = nextTile.Type;

				if (type == this.Const.World.TerrainType.Plains)
				{
					plains = ++plains;
				}
				else if (type == this.Const.World.TerrainType.Steppe)
				{
					steppe = ++steppe;
				}
				else if (type == this.Const.World.TerrainType.Oasis)
				{
					oasis = ++oasis;
				}
				else if (type == this.Const.World.TerrainType.LeaveForest)
				{
					forest_leave = ++forest_leave;
				}
				else if (type == this.Const.World.TerrainType.AutumnForest)
				{
					forest_autumn = ++forest_autumn;
				}
				else if (type == this.Const.World.TerrainType.Hills && nextTile.Subregion != 99)
				{
					hills = ++hills;
				}
				else if (nextTile.Subregion == 99)
				{
					brown_hills = ++brown_hills;
				}
				else if (type == this.Const.World.TerrainType.Shore)
				{
					shore = ++shore;
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
		else if (oasis != 0)
		{
			if (this.Math.rand(1, 100) <= 33)
			{
				tile.spawnDetail("world_oasis_transition_0" + this.Math.rand(1, 6), this.Const.World.ZLevel.Terrain, this.Const.World.DetailType.NotCompatibleWithRoad);

				if (this.Math.rand(1, 100) <= 50)
				{
					local r = this.Math.rand(9, 13);

					if (r < 10)
					{
						r = "0" + r;
					}

					tile.spawnDetail("world_detail_desert_oasis_" + r, this.Const.World.ZLevel.Object, 0);
				}
			}
			else if (this.Math.rand(1, 100) <= 20)
			{
				local r = this.Math.rand(9, 12);

				if (r < 10)
				{
					r = "0" + r;
				}

				tile.spawnDetail("world_detail_desert_oasis_" + r, this.Const.World.ZLevel.Object, 0);
			}
		}
		else if (forest_leave > 0)
		{
			if (this.Math.rand(1, 100) <= 33)
			{
				tile.spawnDetail("world_detail_forest_leaves_light_0" + this.Math.rand(1, 5), this.Const.World.ZLevel.Object, 0);
			}
		}
		else if (forest_autumn > 0)
		{
			if (this.Math.rand(1, 100) <= 33)
			{
				local r = this.Math.rand(1, 10);
				local d = tile.spawnDetail("world_detail_autumn_light_" + (r < 10 ? "0" + r : r), this.Const.World.ZLevel.Object, 0);
			}
		}
		else if (hills >= 2 && tile.Subregion != 99)
		{
			if (this.Math.rand(1, 100) <= 50)
			{
				tile.spawnDetail("world_detail_plains_stony_0" + this.Math.rand(1, 5), this.Const.World.ZLevel.Object, 0);
			}
		}
		else if (tile.Subregion == 99 && !tile.HasRoad)
		{
			tile.TacticalType = this.Const.World.TerrainTacticalType.DesertHills;

			if (brown_hills <= 2)
			{
				tile.spawnDetail("world_desert_hill_0" + this.Math.rand(1, 2), this.Const.World.ZLevel.Terrain, this.Const.World.DetailType.Hills, false);
			}
			else
			{
				tile.spawnDetail("world_desert_hill_0" + this.Math.rand(2, 5), this.Const.World.ZLevel.Terrain, this.Const.World.DetailType.Hills, false);
			}

			tile.Subregion = 99;
			tile.Type = this.Const.World.TerrainType.Hills;
		}
		else if (brown_hills >= 2)
		{
			if (!tile.HasRoad)
			{
				if (this.Math.rand(1, 100) <= 40)
				{
					tile.spawnDetail("world_detail_desert_rocks_0" + this.Math.rand(1, 6), this.Const.World.ZLevel.Object, this.Const.World.DetailType.NotCompatibleWithRoad);
				}
			}
		}
		else if (this.Math.rand(1, 100) <= 5)
		{
			tile.spawnDetail(this.m.DetailsCommon[this.Math.rand(0, this.m.DetailsCommon.len() - 1)], this.Const.World.ZLevel.Object, this.Const.World.DetailType.NotCompatibleWithRoad);
		}
		else if (this.Math.rand(1, 1000) <= 7)
		{
			tile.spawnDetail(this.m.DetailsRuins[this.Math.rand(0, this.m.DetailsRuins.len() - 1)], this.Const.World.ZLevel.Object, this.Const.World.DetailType.NotCompatibleWithRoad);
		}
	}

});

