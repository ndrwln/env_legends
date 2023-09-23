this.patch_oasis <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.patch.oasis";
		this.m.MinX = 10;
		this.m.MinY = 10;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local desertTile = this.MapGen.get("tactical.tile.desert7_oasis");
		local water1Tile = this.MapGen.get("tactical.tile.desert4");
		local water2Tile = this.MapGen.get("tactical.tile.desert6");

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);

				if (tile.Type != 0)
				{
				}
				else
				{
					if (this.Math.abs(x - _rect.X) <= 2 || this.Math.abs(x - (_rect.X + _rect.W - 1)) <= 2 || this.Math.abs(y - _rect.Y) <= 2 || this.Math.abs(y - (_rect.Y + _rect.H - 1)) <= 2)
					{
						if (this.Math.rand(0, 100) < 33)
						{
						}
					}

					local n = 0;

					if (this.Tactical.isValidTileSquare(x - 1, y) && this.Tactical.getTileSquare(x - 1, y).Subtype == this.Const.Tactical.TerrainSubtype.PlashyGrass)
					{
						n = ++n;
					}

					if (this.Tactical.isValidTileSquare(x - 1, y + 1) && this.Tactical.getTileSquare(x - 1, y + 1).Subtype == this.Const.Tactical.TerrainSubtype.PlashyGrass)
					{
						n = ++n;
					}

					if (this.Tactical.isValidTileSquare(x, y - 1) && this.Tactical.getTileSquare(x, y - 1).Subtype == this.Const.Tactical.TerrainSubtype.PlashyGrass)
					{
						n = ++n;
					}

					tile.Level = 0;

					if (this.Math.rand(0, 100) >= 50 - n * 10)
					{
						water1Tile.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = _rect.IsEmpty
						}, _properties);
					}
					else
					{
						desertTile.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = _rect.IsEmpty
						}, _properties);
					}
				}
			}
		}

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);

				if (tile.Level != 0)
				{
				}
				else
				{
					local n = 0;

					for( local i = 0; i < 6; i = ++i )
					{
						if (!tile.hasNextTile(i))
						{
						}
						else if (tile.getNextTile(i).Subtype == this.Const.Tactical.TerrainSubtype.PlashyGrass || tile.getNextTile(i).Subtype == this.Const.Tactical.TerrainSubtype.ShallowWater)
						{
							n = ++n;
						}
					}

					if (n >= 5)
					{
						tile.clear();
						tile.removeObject();
						tile.Type = 0;
						water2Tile.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = _rect.IsEmpty || this.Math.rand(0, 100) < 33
						}, _properties);
					}
					else if (tile.Type != 0)
					{
						if (tile.BlendPriority == this.Const.Tactical.TileBlendPriority.Desert7)
						{
							desertTile.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1
							}, _properties, 2);
						}
					}
				}
			}
		}
	}

});

