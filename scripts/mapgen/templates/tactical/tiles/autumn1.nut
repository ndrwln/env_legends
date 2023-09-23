this.autumn1 <- this.inherit("scripts/mapgen/tactical_template", {
	m = {
		Details = [
			"tundra_grass_01",
			"tundra_grass_02",
			"tundra_grass_03",
			"tundra_grass_04",
			"tundra_grass_05",
			"tundra_grass_06",
			"detail_mushrooms_01",
			"detail_mushrooms_02",
			"detail_mushrooms_03",
			"detail_mushrooms_04",
			"detail_mushrooms_05",
			"detail_mushrooms_01",
			"detail_mushrooms_02",
			"detail_mushrooms_03",
			"detail_mushrooms_04",
			"detail_mushrooms_05",
			"autumn_leaves_01",
			"autumn_leaves_02",
			"autumn_leaves_03",
			"autumn_leaves_04",
			"autumn_leaves_05",
			"autumn_leaves_06",
			"autumn_leaves_07",
			"autumn_leaves_08",
			"autumn_leaves_09",
			"autumn_leaves_10",
			"autumn_leaves_11",
			"autumn_leaves_12",
			"autumn_leaves_13",
			"autumn_leaves_14",
			"autumn_leaves_01",
			"autumn_leaves_02",
			"autumn_leaves_03",
			"autumn_leaves_04",
			"autumn_leaves_05",
			"autumn_leaves_06",
			"autumn_leaves_07",
			"autumn_leaves_08",
			"autumn_leaves_09",
			"autumn_leaves_10",
			"autumn_leaves_11",
			"autumn_leaves_12",
			"autumn_leaves_13",
			"autumn_leaves_14"
		],
		DetailsStones = [
			"tundra_stone_detail_01",
			"tundra_stone_detail_02",
			"tundra_stone_detail_11",
			"tundra_stone_detail_12",
			"detail_mushrooms_01",
			"detail_mushrooms_02",
			"detail_mushrooms_03",
			"detail_mushrooms_04",
			"detail_mushrooms_05",
			"autumn_leaves_01",
			"autumn_leaves_02",
			"autumn_leaves_03",
			"autumn_leaves_04",
			"autumn_leaves_05",
			"autumn_leaves_06",
			"autumn_leaves_07",
			"autumn_leaves_08",
			"autumn_leaves_09",
			"autumn_leaves_10",
			"autumn_leaves_11",
			"autumn_leaves_12",
			"autumn_leaves_13",
			"autumn_leaves_14"
		],
		ChanceToSpawnDetails = 55,
		LimitOfSpawnedDetails = 4,
		Objects = [
			"entity/tactical/objects/tundra_boulder1",
			"entity/tactical/objects/autumn_boulder1",
			"entity/tactical/objects/autumn_brush",
			"entity/tactical/objects/autumn_brush",
			"entity/tactical/objects/autumn_brush",
			"entity/tactical/objects/autumn_brush",
			"entity/tactical/objects/autumn_brush",
			"entity/tactical/objects/autumn_tree1",
			"entity/tactical/objects/autumn_tree1",
			"entity/tactical/objects/autumn_tree2",
			"entity/tactical/objects/autumn_tree2",
			"entity/tactical/objects/autumn_tree2"
		],
		ChanceToSpawnObject = 20
	},
	function init()
	{
		this.m.Name = "tactical.tile.autumn1";
		this.m.MinX = 1;
		this.m.MinY = 1;
		local t = this.createTileTransition();
		t.setBlendIntoSockets(true);
		t.setBrush(this.Const.Direction.N, "transition_autumn_01_N");
		t.setBrush(this.Const.Direction.NE, "transition_autumn_01_NE");
		t.setBrush(this.Const.Direction.SE, "transition_autumn_01_SE");
		t.setBrush(this.Const.Direction.S, "transition_autumn_01_S");
		t.setBrush(this.Const.Direction.SW, "transition_autumn_01_SW");
		t.setBrush(this.Const.Direction.NW, "transition_autumn_01_NW");
		t.setSocket("socket_earth");
		this.Tactical.setTransitions("tile_autumn_01", t);
	}

	function onFirstPass( _rect )
	{
		local tile = this.Tactical.getTileSquare(_rect.X, _rect.Y);

		if (tile.Type != 0)
		{
			return;
		}

		tile.Type = this.Const.Tactical.TerrainType.FlatGround;
		tile.Subtype = this.Const.Tactical.TerrainSubtype.Dirt;
		tile.BlendPriority = this.Const.Tactical.TileBlendPriority.Autumn1;
		tile.IsBadTerrain = false;
		tile.setBrush("tile_autumn_01");
		local n = 0;

		if (this.Math.rand(0, 100) < this.m.ChanceToSpawnObject)
		{
			if (!tile.hasNextTile(this.Const.Direction.S) || tile.getNextTile(this.Const.Direction.S).IsEmpty)
			{
				tile.spawnObject(this.m.Objects[this.Math.rand(0, this.m.Objects.len() - 1)]);
			}
		}
		else if (this.Math.rand(1, 100) <= this.m.ChanceToSpawnDetails)
		{
			if (this.Math.rand(1, 100) <= 20)
			{
				tile.spawnDetail(this.m.DetailsStones[this.Math.rand(0, this.m.DetailsStones.len() - 1)]);
			}
			else if (this.Math.rand(1, 100) <= 50)
			{
				tile.spawnDetail(this.m.Details[this.Math.rand(0, this.m.Details.len() - 1)]);
			}
			else
			{
				for( local n = 0; this.Math.rand(0, 100) < this.m.ChanceToSpawnDetails && n++ < this.m.LimitOfSpawnedDetails;  )
				{
					local i = this.Math.rand(0, this.m.Details.len() - 1);
					tile.spawnDetail(this.m.Details[i]);
				}
			}
		}
	}

});

