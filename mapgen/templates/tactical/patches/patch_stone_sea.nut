this.patch_stone_sea <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.patch.stone_sea";
		this.m.MinX = 4;
		this.m.MaxX = 8;
		this.m.MinY = 4;
		this.m.MaxY = 8;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local Details = [
			"detail_bigstone_01",
			"detail_bigstone_02",
			"detail_bigstone_03",
			"detail_bigstone_04"
		];

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);

				if (tile.IsEmpty && tile.Type != 0)
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

