this.tactical_mountain <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.mountain";
		this.m.MinX = 32;
		this.m.MinY = 32;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local tile1 = this.MapGen.get("tactical.tile.stone1");
		local tile2 = this.MapGen.get("tactical.tile.stone2");
		this.addRoads(_rect, _properties);
		local templates = [];
		local hillPatch = this.MapGen.get("tactical.patch.mountain");
		local hillPatches = 20;
		local hillAttempts = 0;

		while (hillPatches != 0 && hillAttempts < 3000)
		{
			hillAttempts = ++hillAttempts;
			local sizeX = this.Math.rand(8, 16);
			local sizeY = this.Math.rand(8, 16);
			local rect = {
				X = 0,
				Y = 0,
				W = sizeX,
				H = sizeY,
				IsEmpty = false
			};
			rect.X = this.Math.rand(1, _rect.W - sizeX);
			rect.Y = this.Math.rand(1, _rect.H - sizeY);
			hillPatch.fill(rect, _properties);
			hillPatches = --hillPatches;
		}

		local bumpyChance = 100;

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
					n = this.Math.rand(1, 100);

					if (n < 60)
					{
						tile1.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = this.Math.rand(1, 5) != 1
						}, _properties);
					}
					else
					{
						tile2.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = this.Math.rand(1, 5) != 1
						}, _properties);
					}
				}
			}
		}

		this.makeBordersImpassable(_rect);
	}

	function campify( _rect, _properties )
	{
		local centerTile = this.Tactical.getTileSquare(_rect.X + _rect.W / 2 + _properties.ShiftX, _rect.Y + _rect.H / 2 + _properties.ShiftY);
		local radius = this.Const.Tactical.Settings.CampRadius + _properties.AdditionalRadius;

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);
				local d = centerTile.getDistanceTo(tile);

				if (d > radius + 3)
				{
				}
				else if (d <= radius)
				{
					tile.Level = 3;
				}
				else if (d <= radius + 1 && tile.Level != 3)
				{
					if (this.Math.rand(1, 100) <= 50)
					{
						tile.Level = 3;
					}
					else
					{
						tile.Level = 2;
					}
				}
				else if (d <= radius + 2 && tile.Level != 3)
				{
					tile.Level = 2;
				}
				else if (d >= radius && this.Math.rand(1, 100) <= 33 && tile.Level != 3)
				{
					tile.Level = 1;
				}
			}
		}
	}

});

