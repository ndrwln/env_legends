this.desert3 <- this.inherit("scripts/mapgen/tactical_template", {
	m = {
		Details = [
			"desert_stone_detail_01",
			"desert_stone_detail_02",
			"desert_stone_detail_03",
			"desert_stone_detail_04",
			"desert_stone_detail_05",
			"desert_stone_detail_06",
			"desert_stone_detail_07",
			"desert_stone_detail_08",
			"desert_stone_detail_09",
			"desert_stone_detail_10"
		],
		DetailsHigh = [
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
			"entity/tactical/objects/desert_boulder1",
			"entity/tactical/objects/desert_boulder2",
			"entity/tactical/objects/desert_boulder3"
		],
		ChanceToSpawnObject = 3
	},
	function init()
	{
		this.m.Name = "tactical.tile.desert3";
		this.m.MinX = 1;
		this.m.MinY = 1;
		local t = this.createTileTransition();
		t.setBlendIntoSockets(false);
		t.setBrush(this.Const.Direction.N, "transition_desert_03_N");
		t.setBrush(this.Const.Direction.NE, "transition_desert_03_NE");
		t.setBrush(this.Const.Direction.SE, "transition_desert_03_SE");
		t.setBrush(this.Const.Direction.S, "transition_desert_03_S");
		t.setBrush(this.Const.Direction.SW, "transition_desert_03_SW");
		t.setBrush(this.Const.Direction.NW, "transition_desert_03_NW");
		t.setSocket("socket_desert");
		this.Tactical.setTransitions("tile_desert_03", t);
	}

	function onFirstPass( _rect )
	{
		local tile = this.Tactical.getTileSquare(_rect.X, _rect.Y);

		if (tile.Type != 0)
		{
			return;
		}

		tile.Type = this.Const.Tactical.TerrainType.FlatGround;
		tile.Subtype = this.Const.Tactical.TerrainSubtype.FlatStone;
		tile.BlendPriority = this.Const.Tactical.TileBlendPriority.Desert3;
		tile.IsBadTerrain = false;
		tile.setBrush("tile_desert_03");
		local n = 0;

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

