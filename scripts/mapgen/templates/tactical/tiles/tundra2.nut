this.tundra2 <- this.inherit("scripts/mapgen/tactical_template", {
	m = {
		Details = [
			"tundra_grass_01",
			"tundra_grass_02",
			"tundra_grass_03",
			"tundra_grass_04",
			"tundra_grass_05",
			"tundra_grass_06"
		],
		DetailsStones = [
			"tundra_stone_detail_03",
			"tundra_stone_detail_04",
			"tundra_stone_detail_05",
			"tundra_stone_detail_06",
			"tundra_stone_detail_07",
			"tundra_stone_detail_08",
			"tundra_stone_detail_09",
			"tundra_stone_detail_09",
			"tundra_stone_detail_10",
			"tundra_stone_detail_13"
		],
		ChanceToSpawnDetails = 45,
		LimitOfSpawnedDetails = 1,
		Objects = [
			"entity/tactical/objects/tundra_boulder1",
			"entity/tactical/objects/tundra_boulder2",
			"entity/tactical/objects/tree_needle1",
			"entity/tactical/objects/tree_needle2",
			"entity/tactical/objects/tree_needle1",
			"entity/tactical/objects/tree_needle2",
			"entity/tactical/objects/tundra_brush",
			"entity/tactical/objects/tundra_brush",
			"entity/tactical/objects/tundra_brush",
			"entity/tactical/objects/tundra_brush"
		],
		ChanceToSpawnObject = 4
	},
	function init()
	{
		this.m.Name = "tactical.tile.tundra2";
		this.m.MinX = 1;
		this.m.MinY = 1;
		local t = this.createTileTransition();
		t.setBlendIntoSockets(false);
		t.setBrush(this.Const.Direction.SE, "transition_tundra_02_SE");
		t.setBrush(this.Const.Direction.S, "transition_tundra_02_S");
		t.setBrush(this.Const.Direction.SW, "transition_tundra_02_SW");
		t.setSocket("socket_earth");
		this.Tactical.setTransitions("tile_tundra_02", t);
	}

	function onFirstPass( _rect )
	{
		local tile = this.Tactical.getTileSquare(_rect.X, _rect.Y);

		if (tile.Type != 0)
		{
			return;
		}

		tile.Type = this.Const.Tactical.TerrainType.FlatGround;
		tile.Subtype = this.Const.Tactical.TerrainSubtype.Tundra;
		tile.BlendPriority = this.Const.Tactical.TileBlendPriority.Tundra2;
		tile.IsBadTerrain = false;
		tile.setBrush("tile_tundra_02");
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
			if (this.Math.rand(1, 100) <= 80)
			{
				tile.spawnDetail(this.m.DetailsStones[this.Math.rand(0, this.m.DetailsStones.len() - 1)]);
			}
			else
			{
				tile.spawnDetail(this.m.Details[this.Math.rand(0, this.m.Details.len() - 1)]);
			}
		}
	}

});

