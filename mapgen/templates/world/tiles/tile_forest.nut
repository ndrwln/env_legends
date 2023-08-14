this.tile_forest <- this.inherit("scripts/mapgen/map_template", {
	m = {},
	function init()
	{
		this.m.Name = "world.tile.forest";
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

		if (_rect.Y < this.Const.World.Settings.SizeY * this.Const.World.Settings.Snowline - _rect.X % 3 - 3)
		{
			tile.setBrush("world_needles_0" + this.Math.rand(1, 3));
			tile.Type = this.Const.World.TerrainType.Forest;
			tile.TacticalType = this.Const.World.TerrainTacticalType.Forest;
		}
		else
		{
			tile.setBrush("world_snow_0" + this.Math.rand(1, 3));
			tile.Type = this.Const.World.TerrainType.SnowyForest;
			tile.TacticalType = this.Const.World.TerrainTacticalType.SnowyForest;
		}
	}

	function onSecondPass( _rect )
	{
		local tile = this.World.getTileSquare(_rect.X, _rect.Y);
		local urban = tile.getSurroundingTilesOfType(this.Const.World.TerrainType.Urban);
		local swamp = tile.getSurroundingTilesOfType(this.Const.World.TerrainType.Swamp);
		local snow = tile.getSurroundingTilesOfType(this.Const.World.TerrainType.Snow);
		local forest = tile.getSurroundingTilesOfType(this.Const.World.TerrainType.Forest);
		local leaves = tile.getSurroundingTilesOfType(this.Const.World.TerrainType.LeaveForest);
		local autumn = tile.getSurroundingTilesOfType(this.Const.World.TerrainType.AutumnForest);

		if (snow <= 1 && _rect.Y < this.Const.World.Settings.SizeY * this.Const.World.Settings.Snowline - _rect.X % 3)
		{
			tile.setBrush("world_needles_0" + this.Math.rand(1, 3));

			if (leaves > 1)
			{
				tile.spawnDetail("world_detail_forest_green_0" + this.Math.rand(1, 3), this.Const.World.ZLevel.Object, 0);
			}
			else if (autumn > 1)
			{
				tile.spawnDetail("world_detail_autumn_green_0" + this.Math.rand(1, 6), this.Const.World.ZLevel.Object, 0);
			}
			else if (swamp > 1)
			{
				tile.spawnDetail("world_detail_swamp_green_forest_0" + this.Math.rand(1, 3), this.Const.World.ZLevel.Object, 0);
			}
			else if (urban != 0 && this.Math.rand(1, 100) <= 75)
			{
				tile.spawnDetail("world_detail_forest_cut_0" + this.Math.rand(1, 2), this.Const.World.ZLevel.Object, 0);
				tile.setBrush("world_forest_needle_02");
			}
			else
			{
				tile.spawnDetail("world_detail_forest_0" + this.Math.rand(1, 6), this.Const.World.ZLevel.Object, 0);
			}
		}
		else
		{
			tile.setBrush("world_snow_0" + this.Math.rand(1, 3));
			tile.spawnDetail("world_detail_forest_snow_0" + this.Math.rand(1, 3), this.Const.World.ZLevel.Object, 0);
		}
	}

	function onRoadPass( _rect )
	{
		local tile = this.World.getTileSquare(_rect.X, _rect.Y);

		if (tile.IsOccupied)
		{
			return;
		}

		if (tile.HasRoad)
		{
			tile.clearAllBut(this.Const.World.DetailType.Road);

			if (_rect.Y < this.Const.World.Settings.SizeY * this.Const.World.Settings.Snowline - _rect.X % 3)
			{
				tile.spawnDetail("world_detail_forest_road_0" + this.Math.rand(1, 1), this.Const.World.ZLevel.Object, 0);
				tile.setBrush("world_forest_needle_02");
			}
			else
			{
				tile.spawnDetail("world_detail_forest_snow_road_0" + this.Math.rand(1, 1), this.Const.World.ZLevel.Object, 0);
			}
		}
	}

});

