this.test_dry_marshland <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.test_dry_marshland";
		this.m.MinX = 10;
		this.m.MinY = 10;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local earthTile = this.MapGen.get("tactical.tile.earth1");
		local swampTile = this.MapGen.get("tactical.tile.swamp");

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
					tile.Level = 0;
					local r = this.Math.rand(0, 100);

					if (x == _rect.X || x == _rect.X + _rect.W - 1 || y == _rect.Y || y == _rect.Y + _rect.H - 1)
					{
						if (r < 40)
						{
							earthTile.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, _properties, 1);
						}
						else
						{
							swampTile.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, _properties, 1);
						}
					}
					else if (x == _rect.X + 1 || x == _rect.X + _rect.W - 2 || y == _rect.Y + 1 || y == _rect.Y + _rect.H - 2)
					{
						if (r < 33)
						{
							earthTile.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, _properties, 1);
						}
						else
						{
							swampTile.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, _properties, 1);
						}
					}
					else if (r < 15)
					{
						earthTile.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = false
						}, _properties, 1);
					}
					else
					{
						swampTile.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = false
						}, _properties, 1);
					}
				}
			}
		}

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);

				if (tile.Type != this.Const.Tactical.TerrainType.Swamp)
				{
				}
				else if (!tile.IsEmpty)
				{
				}
				else
				{
					swampTile.fill({
						X = x,
						Y = y,
						W = 1,
						H = 1
					}, _properties, 2);
				}
			}
		}
	}

});

