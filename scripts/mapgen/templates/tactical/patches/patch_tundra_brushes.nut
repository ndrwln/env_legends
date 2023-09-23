this.patch_tundra_brushes <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.patch.tundra_brushes";
		this.m.MinX = 10;
		this.m.MinY = 10;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local tundra1Tile = this.MapGen.get("tactical.tile.tundra1");
		local tundra2Tile = this.MapGen.get("tactical.tile.tundra4");
		local bumpyChance = 98;
		local mainTile = tundra1Tile;
		local otherTile = tundra2Tile;
		local otherTileChance = 10;

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

					if (this.Tactical.isValidTileSquare(x - 1, y) && this.Tactical.getTileSquare(x - 1, y).Level == 1)
					{
						n = ++n;
					}

					if (this.Tactical.isValidTileSquare(x - 1, y + 1) && this.Tactical.getTileSquare(x - 1, y + 1).Level == 1)
					{
						n = ++n;
					}

					if (this.Tactical.isValidTileSquare(x, y - 1) && this.Tactical.getTileSquare(x, y - 1).Level == 1)
					{
						n = ++n;
					}

					tile.Level = 0;

					if (this.Math.rand(0, 100) > bumpyChance - n * 20)
					{
						tile.Level = 1;
					}

					local brush = this.Math.rand(0, 100) < otherTileChance ? otherTile : mainTile;
					brush.fill({
						X = x,
						Y = y,
						W = 1,
						H = 1,
						IsEmpty = _rect.IsEmpty || this.Math.rand(0, 100) < 33
					}, _properties);

					if (tile.IsEmpty && this.Math.rand(1, 100) <= 18)
					{
						tile.clear();
						tile.spawnObject("entity/tactical/objects/tundra_brush");
					}
				}
			}
		}
	}

});

