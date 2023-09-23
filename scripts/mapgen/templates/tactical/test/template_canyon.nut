this.template_canyon <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.canyon";
		this.m.MinX = 32;
		this.m.MinY = 32;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local grassTile = this.MapGen.get("tactical.tile.grass2");
		local earthTile = this.MapGen.get("tactical.tile.earth1");
		local marshland = this.MapGen.get("tactical.test_dry_marshland");
		local patches = 4;

		while (patches != 0)
		{
			patches = --patches;
			local sizeX = this.Math.rand(5, 10);
			local sizeY = this.Math.rand(5, 10);
			local rect = {
				X = 0,
				Y = 0,
				W = sizeX,
				H = sizeY,
				IsEmpty = false
			};
			rect.X = this.Math.rand(1, _rect.W - sizeX);
			rect.Y = this.Math.rand(1, _rect.H - sizeY);
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
					local m = this.Math.rand(1, 100);

					if (m < 10)
					{
						tile.Level = 2;
					}
					else if (m < 15)
					{
						tile.Level = 3;
					}

					earthTile.fill({
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

});

