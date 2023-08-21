this.patch_hill <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.patch.hill";
		this.m.MinX = 10;
		this.m.MinY = 10;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local grassTile1 = this.MapGen.get("tactical.tile.grass1");
		local grassTile2 = this.MapGen.get("tactical.tile.grass2");
		local earthTile1 = this.MapGen.get("tactical.tile.stone2");
		local earthTile2 = this.MapGen.get("tactical.tile.stone1");

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
							  // [101]  OP_JMP            0    291    0    0
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
								  // [169]  OP_JMP            0    223    0    0
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
					local empty = true;

					if (tile.Level >= 2)
					{
						if (r <= 50)
						{
							grassTile1.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = empty
							}, _properties);
						}
						else if (r <= 80)
						{
							grassTile2.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = empty
							}, _properties);
						}
						else if (r <= 90)
						{
							earthTile1.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, _properties);
						}
						else
						{
							earthTile2.fill({
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
						grassTile1.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = empty
						}, _properties);
					}
					else
					{
						grassTile2.fill({
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

