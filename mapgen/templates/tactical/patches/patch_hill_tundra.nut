this.patch_hill_tundra <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.patch.hill_tundra";
		this.m.MinX = 10;
		this.m.MinY = 10;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local tile0 = this.MapGen.get("tactical.tile.stone2");
		local tile1 = this.MapGen.get("tactical.tile.stone1");
		local tile2 = this.MapGen.get("tactical.tile.tundra2");
		local tile3 = this.MapGen.get("tactical.tile.tundra3");
		local tile4 = this.MapGen.get("tactical.tile.tundra4");
		local tile5 = this.MapGen.get("tactical.tile.tundra5");

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
							  // [111]  OP_JMP            0    293    0    0
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
								  // [179]  OP_JMP            0    225    0    0
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
						if (r <= 10)
						{
							tile5.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = true
							}, _properties);
						}
						else if (r <= 20)
						{
							tile1.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = true
							}, _properties);
						}
						else if (r <= 70)
						{
							tile2.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, _properties);
						}
						else
						{
							tile3.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, _properties);
						}
					}
					else if (r <= 50)
					{
						tile2.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = false
						}, _properties);
					}
					else
					{
						tile3.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = true
						}, _properties);
					}
				}
			}
		}
	}

});

