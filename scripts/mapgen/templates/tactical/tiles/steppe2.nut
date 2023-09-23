this.steppe2 <- this.inherit("scripts/mapgen/tactical_template", {
	m = {
		Details = [
			"steppe_flowers_01",
			"steppe_flowers_02",
			"steppe_flowers_03",
			"steppe_flowers_04",
			"steppe_flowers_05",
			"steppe_flowers_06",
			"steppe_flowers_07",
			"steppe_stone_detail_01",
			"steppe_stone_detail_02",
			"steppe_stone_detail_03",
			"steppe_stone_detail_04",
			"steppe_brush_detail_01",
			"steppe_brush_detail_02",
			"steppe_brush_detail_03",
			"steppe_grass_detail_01",
			"steppe_grass_detail_02",
			"steppe_grass_detail_03",
			"steppe_grass_detail_04"
		],
		DetailsHigh = [
			"steppe_flowers_01",
			"steppe_flowers_02",
			"steppe_flowers_03",
			"steppe_flowers_04",
			"steppe_flowers_05",
			"steppe_flowers_06",
			"steppe_flowers_07",
			"steppe_grass_detail_01",
			"steppe_grass_detail_02",
			"steppe_grass_detail_03",
			"steppe_grass_detail_04",
			"steppe_grass_detail_05"
		],
		DetailsGrass = [
			"steppe_grass_detail_01",
			"steppe_grass_detail_02",
			"steppe_grass_detail_03",
			"steppe_grass_detail_04",
			"steppe_grass_detail_05"
		],
		ChanceToSpawnDetails = 15,
		LimitOfSpawnedDetails = 1,
		Objects = [
			"entity/tactical/objects/steppe_brush",
			"entity/tactical/objects/steppe_brush",
			"entity/tactical/objects/steppe_brush",
			"entity/tactical/objects/tree_cypress",
			"entity/tactical/objects/tree_cypress",
			"entity/tactical/objects/tree_olive",
			"entity/tactical/objects/steppe_boulder1"
		],
		ChanceToSpawnObject = 4
	},
	function init()
	{
		this.m.Name = "tactical.tile.steppe2";
		this.m.MinX = 1;
		this.m.MinY = 1;
		local t = this.createTileTransition();
		t.setBlendIntoSockets(true);
		t.setBrush(this.Const.Direction.N, "transition_steppe_02_N");
		t.setBrush(this.Const.Direction.NE, "transition_steppe_02_NE");
		t.setBrush(this.Const.Direction.SE, "transition_steppe_02_SE");
		t.setBrush(this.Const.Direction.S, "transition_steppe_02_S");
		t.setBrush(this.Const.Direction.SW, "transition_steppe_02_SW");
		t.setBrush(this.Const.Direction.NW, "transition_steppe_02_NW");
		t.setSocket("socket_steppe");
		this.Tactical.setTransitions("tile_steppe_02", t);
	}

	function onFirstPass( _rect )
	{
		local tile = this.Tactical.getTileSquare(_rect.X, _rect.Y);

		if (tile.Type != 0)
		{
			return;
		}

		tile.Type = this.Const.Tactical.TerrainType.FlatGround;
		tile.Subtype = this.Const.Tactical.TerrainSubtype.Steppe;
		tile.BlendPriority = this.Const.Tactical.TileBlendPriority.Steppe2;
		tile.IsBadTerrain = false;
		tile.setBrush("tile_steppe_02");

		if (this.Math.rand(0, 100) < this.m.ChanceToSpawnObject)
		{
			if (!tile.hasNextTile(this.Const.Direction.S) || tile.getNextTile(this.Const.Direction.S).IsEmpty)
			{
				tile.spawnObject(this.m.Objects[this.Math.rand(0, this.m.Objects.len() - 1)]);
			}
		}
		else if (this.Math.rand(0, 100) < 20)
		{
			tile.spawnDetail(this.m.DetailsHigh[this.Math.rand(0, this.m.DetailsHigh.len() - 1)]);
		}
		else if (this.Math.rand(0, 100) < 30)
		{
			local n = 0;

			do
			{
				tile.spawnDetail(this.m.DetailsGrass[this.Math.rand(0, this.m.DetailsGrass.len() - 1)]);
			}
			while (this.Math.rand(0, 100) < 50 && n++ < 2);
		}
		else if (this.Math.rand(0, 100) < this.m.ChanceToSpawnDetails)
		{
			tile.spawnDetail(this.m.Details[this.Math.rand(0, this.m.Details.len() - 1)]);
		}
	}

});

