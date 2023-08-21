this.earth2 <- this.inherit("scripts/mapgen/tactical_template", {
	m = {
		Details = [
			"tundra_grass_01",
			"tundra_grass_02",
			"tundra_grass_03",
			"tundra_grass_04",
			"tundra_grass_05"
		],
		AltDetails = [
			"detail_bigstone_01",
			"detail_bigstone_02",
			"detail_bigstone_03",
			"detail_bigstone_01",
			"detail_bigstone_02",
			"detail_bigstone_03",
			"detail_bigstone_04"
		],
		ChanceToSpawnDetails = 25,
		ChanceToSpawnAltDetails = 20,
		LimitOfSpawnedDetails = 1,
		Objects = [],
		ChanceToSpawnObject = 3
	},
	function init()
	{
		this.m.Name = "tactical.tile.earth2";
		this.m.MinX = 1;
		this.m.MinY = 1;
		local t = this.createTileTransition();
		t.setBlendIntoSockets(true);
		t.setBrush(this.Const.Direction.S, "transition_earth_01_S");
		t.setBrush(this.Const.Direction.SW, "transition_earth_01_SW");
		t.setBrush(this.Const.Direction.SE, "transition_earth_01_SE");
		t.setSocket("socket_earth");
		this.Tactical.setTransitions("tile_earth_02", t);
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
		tile.BlendPriority = this.Const.Tactical.TileBlendPriority.Earth;
		tile.setBrush("tile_earth_02");
		local n = 0;

		if (this.Math.rand(0, 100) < this.m.ChanceToSpawnObject && this.m.Objects.len() != 0)
		{
			tile.spawnObject(this.m.Objects[this.Math.rand(0, this.m.Objects.len() - 1)]);
		}
		else
		{
			for( local decalSpawned = false; this.Math.rand(0, 100) < this.m.ChanceToSpawnDetails && n++ < this.m.LimitOfSpawnedDetails; decalSpawned = true )
			{
				if (this.Math.rand(0, 100) < this.m.ChanceToSpawnAltDetails)
				{
					tile.spawnDetail(this.m.AltDetails[this.Math.rand(0, this.m.AltDetails.len() - 1)]);
				}
				else
				{
					tile.spawnDetail(this.m.Details[this.Math.rand(0, this.m.Details.len() - 1)]);
				}
			}
		}
	}

});

