this.patch_dry <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.patch.dry";
		this.m.MinX = 10;
		this.m.MinY = 10;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local tile1 = this.MapGen.get("tactical.tile.steppe3");
		local tile2 = this.Math.rand(0, 1) == 0 ? this.MapGen.get("tactical.tile.steppe1") : this.MapGen.get("tactical.tile.steppe1");
		local bumpyChance = 98;

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
					if (x == _rect.X || x == _rect.X + _rect.W - 1 || y == _rect.Y || y == _rect.Y + _rect.H - 1)
					{
						if (this.Math.rand(0, 100) < 25)
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

					local brush = this.Math.rand(0, 100) < 90 ? tile1 : tile2;
					brush.fill({
						X = x,
						Y = y,
						W = 1,
						H = 1,
						IsEmpty = _rect.IsEmpty || this.Math.rand(0, 100) < 33
					}, _properties);
				}
			}
		}
	}

});

