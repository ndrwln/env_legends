this.desert7_oasis <- this.inherit("scripts/mapgen/tactical_template", {
	m = {
		Details = [
			"desert_bones_01",
			"desert_bones_02",
			"desert_bones_03",
			"desert_bones_04",
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
		DetailsPuddle = [
			"desert_puddle_01",
			"desert_puddle_02",
			"desert_puddle_03",
			"desert_puddle_04",
			"desert_puddle_05",
			"desert_puddle_06",
			"desert_puddle_07"
		],
		DetailsHigh = [
			"steppe_flowers_01",
			"steppe_flowers_02",
			"steppe_flowers_03",
			"steppe_flowers_04",
			"steppe_flowers_05",
			"steppe_flowers_06",
			"steppe_flowers_07"
		],
		HidingExtras = [
			"desert_grass_details_01",
			"desert_grass_details_02",
			"desert_grass_details_03",
			"desert_grass_details_04",
			"desert_grass_details_05"
		],
		ChanceToSpawnDetails = 50,
		LimitOfSpawnedDetails = 1,
		Objects = [
			"entity/tactical/objects/tree_desert_large",
			"entity/tactical/objects/desert_plant"
		],
		ChanceToSpawnObject = 10
	},
	function init()
	{
		this.m.Name = "tactical.tile.desert7_oasis";
		this.m.MinX = 1;
		this.m.MinY = 1;
		local t = this.createTileTransition();
		t.setBlendIntoSockets(false);
		t.setBrush(this.Const.Direction.N, "transition_desert_07_N");
		t.setBrush(this.Const.Direction.NE, "transition_desert_07_NE");
		t.setBrush(this.Const.Direction.SE, "transition_desert_07_SE");
		t.setBrush(this.Const.Direction.S, "transition_desert_07_S");
		t.setBrush(this.Const.Direction.SW, "transition_desert_07_SW");
		t.setBrush(this.Const.Direction.NW, "transition_desert_07_NW");
		t.setSocket("socket_desert");
		this.Tactical.setTransitions("tile_desert_07", t);
	}

	function onFirstPass( _rect )
	{
		local tile = this.Tactical.getTileSquare(_rect.X, _rect.Y);

		if (tile.Type != 0)
		{
			return;
		}

		tile.Type = this.Const.Tactical.TerrainType.Sand;
		tile.Subtype = this.Const.Tactical.TerrainSubtype.Desert;
		tile.BlendPriority = this.Const.Tactical.TileBlendPriority.Desert7;
		tile.IsBadTerrain = false;
		tile.setBrush("tile_desert_07");

		if (this.Math.rand(0, 100) < this.m.ChanceToSpawnObject)
		{
			if (!tile.hasNextTile(this.Const.Direction.S) || tile.getNextTile(this.Const.Direction.S).IsEmpty)
			{
				tile.spawnObject(this.m.Objects[this.Math.rand(0, this.m.Objects.len() - 1)]);
			}
		}
		else if (this.Math.rand(0, 100) < 66)
		{
			tile.spawnDetail(this.m.DetailsHigh[this.Math.rand(0, this.m.DetailsHigh.len() - 1)]);
		}
		else if (this.Math.rand(0, 100) < this.m.ChanceToSpawnDetails)
		{
			tile.spawnDetail(this.m.Details[this.Math.rand(0, this.m.Details.len() - 1)]);
		}
	}

	function onSecondPass( _rect )
	{
		local tile = this.Tactical.getTileSquare(_rect.X, _rect.Y);
		local h = 0;

		if (tile.IsHidingEntity)
		{
			return;
		}

		if (tile.hasNextTile(this.Const.Direction.SW) && tile.getNextTile(this.Const.Direction.SW).IsHidingEntity)
		{
			h = ++h;
		}

		if (tile.hasNextTile(this.Const.Direction.NE) && tile.getNextTile(this.Const.Direction.NE).IsHidingEntity)
		{
			h = ++h;
		}

		if (tile.hasNextTile(this.Const.Direction.NW) && tile.getNextTile(this.Const.Direction.NW).IsHidingEntity)
		{
			h = ++h;
		}

		if (tile.hasNextTile(this.Const.Direction.SE) && tile.getNextTile(this.Const.Direction.SE).IsHidingEntity)
		{
			h = ++h;
		}

		if (tile.hasNextTile(this.Const.Direction.N) && tile.getNextTile(this.Const.Direction.N).IsHidingEntity)
		{
			h = ++h;
		}

		if (tile.hasNextTile(this.Const.Direction.S) && tile.getNextTile(this.Const.Direction.S).IsHidingEntity)
		{
			h = ++h;
		}

		if (h != 0)
		{
			tile.clear();
			local n = this.Math.rand(2, this.Math.min(this.Math.max(2, h), 4));

			for( local hi = 0; hi < n; hi = ++hi )
			{
				tile.spawnDetail(this.m.HidingExtras[this.Math.rand(0, this.m.HidingExtras.len() - 1)]);
			}
		}
		else if (tile.IsEmpty)
		{
			h = 0;

			for( local i = 0; i < 6; i = ++i )
			{
				if (!tile.hasNextTile(i))
				{
				}
				else if (tile.getNextTile(i).Subtype == this.Const.Tactical.TerrainSubtype.ShallowWater)
				{
					h = h + 100;
				}
			}

			if (this.Math.rand(1, 100) <= h)
			{
				tile.clear();
				tile.spawnDetail(this.m.DetailsPuddle[this.Math.rand(0, this.m.DetailsPuddle.len() - 1)]);
			}
		}
	}

});

