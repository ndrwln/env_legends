this.patch_forest_thick <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.patch.forest_thick";
		this.m.MinX = 10;
		this.m.MinY = 10;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local forestTile = this.MapGen.get("tactical.tile.forest1");

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
					local isTreeAllowed = true;
					local isSmallTree = false;

					if (this.Math.abs(x - _rect.X) <= 0 || this.Math.abs(x - (_rect.X + _rect.W - 1)) <= 0 || this.Math.abs(y - _rect.Y) <= 0 || this.Math.abs(y - (_rect.Y + _rect.H - 1)) <= 0)
					{
						if (_rect.W >= 3 && _rect.H >= 3 && this.Math.rand(1, 100) < 10)
						{
							continue;
						}
						else if (y != _rect.Y)
						{
							isTreeAllowed = false;
						}
						else if (this.Math.rand(1, 100) <= 50)
						{
							isTreeAllowed = false;
						}
					}

					if (this.Math.abs(y - (_rect.Y + _rect.H - 1)) <= 1)
					{
						isTreeAllowed = false;
					}

					if (y == _rect.Y + _rect.H - 2)
					{
						isTreeAllowed = true;
						isSmallTree = true;
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

					if (this.Tactical.isValidTileSquare(x + 1, y + 1) && this.Tactical.getTileSquare(x + 1, y + 1).Level == 1)
					{
						n = ++n;
					}

					if (this.Tactical.isValidTileSquare(x, y + 1) && this.Tactical.getTileSquare(x, y + 1).Level == 1)
					{
						n = ++n;
					}

					tile.Level = 0;
					forestTile.onFirstPass({
						X = x,
						Y = y,
						W = 1,
						H = 1,
						IsEmpty = false,
						IsTreeAllowed = isTreeAllowed,
						IsSmallTree = isSmallTree
					}, 100.0);
					tile.IsSpecialTerrain = true;
				}
			}
		}
	}

});

