this.test_road <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.test_road";
		this.m.MinX = 8;
		this.m.MinY = 8;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local roadTile = this.MapGen.get("tactical.tile.road");
		local roadX = 0;
		local roadY = this.Math.rand(5, _rect.H - 5);
		local roadEndX = _rect.W - 1;

		for( local roadXMoved = false; true;  )
		{
			roadTile.fill({
				X = roadX,
				Y = roadY,
				W = 1,
				H = 1,
				IsEmpty = false
			}, _properties, 1);
			roadTile.fill({
				X = roadX,
				Y = roadY + 1,
				W = 1,
				H = 1,
				IsEmpty = false
			}, _properties, 1);

			if (roadX == roadEndX)
			{
				break;
			}

			local r = this.Math.rand(0, 100);

			if (!roadXMoved || r < 33)
			{
				roadX = ++roadX;
				roadXMoved = true;
			}
			else if (r < 66 && roadY + 1 < _rect.H - 1)
			{
				roadY = ++roadY;
				roadXMoved = false;
			}
			else if (roadY - 1 >= 1)
			{
				roadY = --roadY;
				roadXMoved = false;
			}
		}
	}

});

