this.template_swipe <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.swipe";
		this.m.MinX = 32;
		this.m.MinY = 32;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local grassTile = this.MapGen.get("tactical.tile.grass1");
		local earthTile = this.MapGen.get("tactical.tile.earth1");
		local swampTile = this.MapGen.get("tactical.tile.swamp");
		local roadTile = this.MapGen.get("tactical.tile.road");
		local hill = this.MapGen.get("tactical.test_hill");
		local marshland = this.MapGen.get("tactical.test_marshland");
		local patches = 1;

		while (patches != 0)
		{
			patches = --patches;
			local rect = {
				X = 0,
				Y = 0,
				W = 10,
				H = 10,
				IsEmpty = false
			};
			rect.X = this.Math.rand(10, _rect.W - 10);
			rect.Y = this.Math.rand(10, _rect.H - 10);
			marshland.fill(rect, _properties);
		}

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

					if (this.Math.rand(0, 100) > 90)
					{
						tile.Level = 1;
					}

					if (this.Math.rand(0, 100) < 25)
					{
						earthTile.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = false
						}, _properties);
					}
					else
					{
						grassTile.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = false
						}, _properties);
					}
				}
			}
		}

		this.makeBordersImpassable(_rect);
	}

});

