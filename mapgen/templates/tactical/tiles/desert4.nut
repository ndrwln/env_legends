this.desert4 <- this.inherit("scripts/mapgen/tactical_template", {
	m = {
		Details = [
			"desert_grass_02_high"
		],
		HidingFront = [
			"hiding_desert_01_front",
			"hiding_desert_02_front"
		],
		HidingBack = [
			"hiding_desert_01_back"
		],
		ChanceToSpawnDetails = 75,
		ChanceToSpawnHiding = 60,
		LimitOfSpawnedDetails = 1,
		Objects = [
			"entity/tactical/objects/tree_desert_large",
			"entity/tactical/objects/desert_plant"
		],
		ChanceToSpawnObject = 33
	},
	function init()
	{
		this.m.Name = "tactical.tile.desert4";
		this.m.MinX = 1;
		this.m.MinY = 1;
		local t = this.createTileTransition();
		t.setBlendIntoSockets(false);
		t.setBrush(this.Const.Direction.N, "transition_desert_04_N");
		t.setBrush(this.Const.Direction.NE, "transition_desert_04_NE");
		t.setBrush(this.Const.Direction.SE, "transition_desert_04_SE");
		t.setBrush(this.Const.Direction.S, "transition_desert_04_S");
		t.setBrush(this.Const.Direction.SW, "transition_desert_04_SW");
		t.setBrush(this.Const.Direction.NW, "transition_desert_04_NW");
		t.setSocket("socket_desert");
		this.Tactical.setTransitions("tile_desert_04", t);
	}

	function onFirstPass( _rect )
	{
		local tile = this.Tactical.getTileSquare(_rect.X, _rect.Y);

		if (tile.Type != 0)
		{
			return;
		}

		tile.Type = this.Const.Tactical.TerrainType.FlatGround;
		tile.Subtype = this.Const.Tactical.TerrainSubtype.PlashyGrass;
		tile.BlendPriority = this.Const.Tactical.TileBlendPriority.Desert4;
		tile.IsBadTerrain = false;
		tile.setBrush("tile_desert_04");

		if (this.Math.rand(1, 100) <= this.m.ChanceToSpawnHiding)
		{
			tile.spawnDetail(this.m.HidingBack[this.Math.rand(0, this.m.HidingBack.len() - 1)]);
			tile.spawnDetail(this.m.HidingFront[this.Math.rand(0, this.m.HidingFront.len() - 1)], 0, this.Math.rand(0, 1) == 1);
			tile.IsHidingEntity = true;
		}
		else if (this.Math.rand(0, 100) < this.m.ChanceToSpawnObject)
		{
			tile.spawnObject(this.m.Objects[this.Math.rand(0, this.m.Objects.len() - 1)]);
		}
		else if (this.Math.rand(0, 100) < this.m.ChanceToSpawnDetails)
		{
			tile.spawnDetail(this.m.Details[this.Math.rand(0, this.m.Details.len() - 1)]);
		}
	}

});

