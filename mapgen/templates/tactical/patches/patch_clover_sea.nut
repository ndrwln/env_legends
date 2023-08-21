this.patch_clover_sea <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.patch.clover_sea";
		this.m.MinX = 4;
		this.m.MaxX = 8;
		this.m.MinY = 4;
		this.m.MaxY = 8;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local Details = [
			"detail_clover_01",
			"detail_clover_02",
			"detail_clover_03",
			"detail_clover_04",
			"detail_clover_05"
		];
		local grassTile1 = this.MapGen.get("tactical.tile.grass1");

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				if (this.Math.abs(x - _rect.X) <= 2 || this.Math.abs(x - (_rect.X + _rect.W - 1)) <= 2 || this.Math.abs(y - _rect.Y) <= 2 || this.Math.abs(y - (_rect.Y + _rect.H - 1)) <= 2)
				{
					if (this.Math.rand(0, 100) < 33)
					{
					}
				}

				local tile = this.Tactical.getTileSquare(x, y);

				if (tile.Type == 0)
				{
					grassTile1.fill({
						X = x,
						Y = y,
						W = 1,
						H = 1,
						IsEmpty = true
					}, _properties);
				}

				if (tile.IsEmpty)
				{
					local r = this.Math.rand(1, 100);
					tile.clear();

					if (r < 15)
					{
						tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
					}

					if (r < 30)
					{
						tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
					}

					if (r < 45)
					{
						tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
					}
				}
			}
		}
	}

});

