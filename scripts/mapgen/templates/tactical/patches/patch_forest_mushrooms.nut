this.patch_forest_mushrooms <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.patch.forest_mushrooms";
		this.m.MinX = 6;
		this.m.MaxX = 10;
		this.m.MinY = 6;
		this.m.MaxY = 10;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local forestTile = this.MapGen.get("tactical.tile.forest1");
		local Details = [
			"detail_mushrooms_01",
			"detail_mushrooms_02",
			"detail_mushrooms_04",
			"detail_mushrooms_05",
			"detail_forest_01",
			"detail_forest_02",
			"detail_forest_03",
			"detail_forest_04",
			"detail_forest_06",
			"detail_mushrooms_01",
			"detail_mushrooms_02",
			"detail_mushrooms_04",
			"detail_mushrooms_05",
			"detail_mushrooms_01",
			"detail_mushrooms_02",
			"detail_mushrooms_04",
			"detail_mushrooms_05"
		];

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);
				forestTile.fill({
					X = x,
					Y = y,
					W = 1,
					H = 1,
					IsEmpty = this.Math.rand(0, 1) == 0
				}, _properties, 1);

				if (tile.IsEmpty && tile.Type == this.Const.Tactical.TerrainType.Forest)
				{
					local r = this.Math.rand(0, 5);

					if (r != 0)
					{
						tile.clear();

						for( local i = 0; i < r; i = ++i )
						{
							tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
						}
					}
				}
			}
		}
	}

});

