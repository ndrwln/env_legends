this.patch_snow_less <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.patch.snow_less";
		this.m.MinX = 10;
		this.m.MinY = 10;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local snow1Tile = this.MapGen.get("tactical.tile.snow3");
		local snow2Tile = this.MapGen.get("tactical.tile.snow1");
		local earthTile = this.MapGen.get("tactical.tile.earth2");
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
					if (this.Math.abs(x - _rect.X) <= 2 || this.Math.abs(x - (_rect.X + _rect.W - 1)) <= 2 || this.Math.abs(y - _rect.Y) <= 2 || this.Math.abs(y - (_rect.Y + _rect.H - 1)) <= 2)
					{
						if (this.Math.rand(0, 100) < 33)
						{
						}
					}

					local r = this.Math.rand(1, 100);

					if (r <= 70)
					{
						snow1Tile.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = _rect.IsEmpty || this.Math.rand(0, 100) < 33
						}, _properties);
					}
					else
					{
						snow2Tile.fill({
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
	}

});

