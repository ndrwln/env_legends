this.test_hill <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.test_hill";
		this.m.MinX = 10;
		this.m.MinY = 10;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local grassTile = this.MapGen.get("tactical.tile.grass1");
		local earthTile = this.MapGen.get("tactical.tile.earth1");

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
					local r = this.Math.rand(0, 100);

					if (x == _rect.X || x == _rect.X + _rect.W - 1 || y == _rect.Y || y == _rect.Y + _rect.H - 1)
					{
						if (tile.Level < 2)
						{
							if (r < 66)
							{
								tile.Level = 0;
							}
							else
							{
								tile.Level = 1;
							}
						}
					}
					else if (x <= _rect.X + 1 || x >= _rect.X + _rect.W - 2 || y <= _rect.Y + 1 || y >= _rect.Y + _rect.H - 2)
					{
						if (tile.Level < 2)
						{
							if (r < 33)
							{
								tile.Level = 0;
							}
							else
							{
								tile.Level = 1;
							}
						}
					}
					else if (x <= _rect.X + 2 || x >= _rect.X + _rect.W - 3 || y <= _rect.Y + 2 || y >= _rect.Y + _rect.H - 3)
					{
						if (tile.Level < 2)
						{
							if (r < 33)
							{
								tile.Level = 1;
							}
							else
							{
								tile.Level = 2;
							}
						}
					}
					else if (x <= _rect.X + 3 || x >= _rect.X + _rect.W - 4 || y <= _rect.Y + 3 || y >= _rect.Y + _rect.H - 4)
					{
						if (tile.Level < 2)
						{
							if (r < 10)
							{
								tile.Level = 1;
							}
							else
							{
								tile.Level = 2;
							}
						}
					}
					else if (r < 7)
					{
						tile.Level = 3;
					}
					else
					{
						tile.Level = 2;
					}

					if (this.Math.rand(0, 100) > 90)
					{
						earthTile.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = false
						}, _properties);
					}
					else
					{
						grassTile.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = false
						}, _properties);
					}
				}
			}
		}
	}

});

