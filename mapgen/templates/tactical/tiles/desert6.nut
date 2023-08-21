this.desert6 <- this.inherit("scripts/mapgen/tactical_template", {
	m = {
		Details = [
			"desert_grass_02_water",
			"desert_grass_03_water",
			"desert_grass_04_water",
			"desert_grass_05_water"
		],
		DetailsHigh = [],
		DetailsGrass = [],
		ChanceToSpawnDetails = 30,
		LimitOfSpawnedDetails = 1,
		Objects = [],
		ChanceToSpawnObject = 4
	},
	function init()
	{
		this.m.Name = "tactical.tile.desert6";
		this.m.MinX = 1;
		this.m.MinY = 1;
	}

	function onFirstPass( _rect )
	{
		local tile = this.Tactical.getTileSquare(_rect.X, _rect.Y);

		if (tile.Type != 0)
		{
			return;
		}

		tile.Type = this.Const.Tactical.TerrainType.ShallowWater;
		tile.Subtype = this.Const.Tactical.TerrainSubtype.ShallowWater;
		tile.BlendPriority = this.Const.Tactical.TileBlendPriority.Desert6;
		tile.IsBadTerrain = false;
		tile.setBrush("tile_desert_06");

		if (this.Math.rand(0, 100) < this.m.ChanceToSpawnDetails)
		{
			tile.spawnDetail(this.m.Details[this.Math.rand(0, this.m.Details.len() - 1)]);
		}
	}

});

