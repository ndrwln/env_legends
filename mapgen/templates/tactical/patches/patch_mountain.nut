this.patch_mountain <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.patch.mountain";
		this.m.MinX = 10;
		this.m.MinY = 10;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local tile1 = this.MapGen.get("tactical.tile.stone1");
		local tile2 = this.MapGen.get("tactical.tile.stone2");
		local tile3 = this.MapGen.get("tactical.tile.stone3");

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
						if (this.Math.rand(1, 100) < 50)
						{
							  // [096]  OP_JMP            0    247    0    0
						}
						else
						{
							tile.Level = 1;
						}
					}
					else if (this.Math.abs(x - _rect.X) <= 2 || this.Math.abs(x - (_rect.X + _rect.W - 1)) <= 2 || this.Math.abs(y - _rect.Y) <= 2 || this.Math.abs(y - (_rect.Y + _rect.H - 1)) <= 2)
					{
						if (this.Math.rand(1, 100) < 50)
						{
							if (this.Math.rand(1, 100) < 25)
							{
								  // [164]  OP_JMP            0    179    0    0
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
					else if (this.Math.abs(x - _rect.X) <= 4 || this.Math.abs(x - (_rect.X + _rect.W - 1)) <= 4 || this.Math.abs(y - _rect.Y) <= 4 || this.Math.abs(y - (_rect.Y + _rect.H - 1)) <= 4)
					{
						if (this.Math.rand(1, 100) < 50)
						{
							if (this.Math.rand(1, 100) < 25)
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
					local empty = true;

					if (tile.Level >= 2)
					{
						if (r <= 60)
						{
							tile1.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = empty
							}, _properties);
						}
						else
						{
							tile2.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = empty
							}, _properties);
						}
					}
					else if (r <= 50)
					{
						tile1.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = empty
						}, _properties);
					}
					else
					{
						tile3.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = empty
						}, _properties);
					}
				}
			}
		}
	}

});

