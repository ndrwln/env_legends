this.patch_hill_desert <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.patch.hill_desert";
		this.m.MinX = 10;
		this.m.MinY = 10;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local tile1 = this.MapGen.get("tactical.tile.desert1");
		local tile2 = this.MapGen.get("tactical.tile.desert2");
		local tile3 = this.MapGen.get("tactical.tile.desert7");
		local tile4 = this.MapGen.get("tactical.tile.desert3");
		local tile5 = this.MapGen.get("tactical.tile.desert5");

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
					tile.IsSpecialTerrain = true;

					if (this.Math.abs(x - _rect.X) <= 1 || this.Math.abs(x - (_rect.X + _rect.W - 1)) <= 1 || this.Math.abs(y - _rect.Y) <= 1 || this.Math.abs(y - (_rect.Y + _rect.H - 1)) <= 1)
					{
						if (this.Math.rand(1, 100) < 35)
						{
							  // [106]  OP_JMP            0    249    0    0
						}
						else
						{
							tile.Level = 1;
						}
					}
					else if (this.Math.abs(x - _rect.X) <= 2 || this.Math.abs(x - (_rect.X + _rect.W - 1)) <= 2 || this.Math.abs(y - _rect.Y) <= 2 || this.Math.abs(y - (_rect.Y + _rect.H - 1)) <= 2)
					{
						if (this.Math.rand(1, 100) < 35)
						{
							if (this.Math.rand(1, 100) < 15)
							{
								  // [174]  OP_JMP            0    181    0    0
							}
							else
							{
								tile.Level = 1;
							}
						}
						else
						{
							tile.Level = 2;
						}
					}
					else if (this.Math.abs(x - _rect.X) <= 3 || this.Math.abs(x - (_rect.X + _rect.W - 1)) <= 3 || this.Math.abs(y - _rect.Y) <= 3 || this.Math.abs(y - (_rect.Y + _rect.H - 1)) <= 3)
					{
						if (this.Math.rand(1, 100) < 35)
						{
							if (this.Math.rand(1, 100) < 15)
							{
								tile.Level = 1;
							}
							else
							{
								tile.Level = 2;
							}
						}
						else
						{
							tile.Level = 3;
						}
					}
					else
					{
						tile.Level = 3;
					}

					local r = this.Math.rand(1, 100);

					if (tile.Level >= 2)
					{
						if (r <= 33)
						{
							tile4.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, _properties);
						}
						else
						{
							tile5.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, _properties);
						}
					}
					else if (r <= 25)
					{
						tile4.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = false
						}, _properties);
					}
					else
					{
						tile5.fill({
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

