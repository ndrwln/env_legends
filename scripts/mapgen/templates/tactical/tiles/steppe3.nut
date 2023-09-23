this.steppe3 <- this.inherit("scripts/mapgen/tactical_template", {
	m = {
		Details = [
			"steppe_stone_detail_01_02",
			"steppe_stone_detail_02_02",
			"steppe_stone_detail_05",
			"steppe_stone_detail_06",
			"steppe_stone_detail_07",
			"steppe_stone_detail_08",
			"steppe_stone_detail_09",
			"steppe_stone_detail_10",
			"steppe_stone_detail_11",
			"steppe_stone_detail_12",
			"steppe_brush_detail_01",
			"steppe_brush_detail_02",
			"steppe_brush_detail_03",
			"steppe_grass_detail_01",
			"steppe_grass_detail_02",
			"steppe_grass_detail_03"
		],
		ChanceToSpawnDetails = 20,
		LimitOfSpawnedDetails = 1,
		Objects = [
			"entity/tactical/objects/tree_olive_dry",
			"entity/tactical/objects/tree_dead_steppe",
			"entity/tactical/objects/steppe_boulder2",
			"entity/tactical/objects/steppe_boulder3"
		],
		ChanceToSpawnObject = 4
	},
	function init()
	{
		this.m.Name = "tactical.tile.steppe3";
		this.m.MinX = 1;
		this.m.MinY = 1;
		local t = this.createTileTransition();
		t.setBlendIntoSockets(true);
		t.setBrush(this.Const.Direction.SE, "transition_sand_SE");
		t.setBrush(this.Const.Direction.S, "transition_sand_S");
		t.setBrush(this.Const.Direction.SW, "transition_sand_SW");
		t.setSocket("socket_steppe");
		this.Tactical.setTransitions("tile_steppe_03", t);
	}

	function onFirstPass( _rect )
	{
		local tile = this.Tactical.getTileSquare(_rect.X, _rect.Y);

		if (tile.Type != 0)
		{
			return;
		}

		tile.Type = this.Const.Tactical.TerrainType.PavedGround;
		tile.Subtype = this.Const.Tactical.TerrainSubtype.DrySteppe;
		tile.BlendPriority = this.Const.Tactical.TileBlendPriority.Steppe3;
		tile.IsBadTerrain = false;
		tile.setBrush("tile_steppe_03");
		local n = 0;

		if (this.Math.rand(0, 100) < this.m.ChanceToSpawnObject)
		{
			if (!tile.hasNextTile(this.Const.Direction.S) || tile.getNextTile(this.Const.Direction.S).IsEmpty)
			{
				tile.spawnObject(this.m.Objects[this.Math.rand(0, this.m.Objects.len() - 1)]);
			}
		}
		else
		{
			while (this.Math.rand(0, 100) < this.m.ChanceToSpawnDetails && n++ < this.m.LimitOfSpawnedDetails)
			{
				tile.spawnDetail(this.m.Details[this.Math.rand(0, this.m.Details.len() - 1)]);
			}
		}
	}

});

