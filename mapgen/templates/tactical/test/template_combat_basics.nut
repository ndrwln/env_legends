this.template_combat_basics <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.combat_basics";
		this.m.MinX = 32;
		this.m.MinY = 32;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local grassTile = this.MapGen.get("tactical.tile.grass1");
		local earthTile = this.MapGen.get("tactical.tile.earth1");

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
					local rect = {
						X = x,
						Y = y,
						W = 1,
						H = 1,
						IsEmpty = x >= 10 && x <= 20 && y >= 10 && y <= 20 ? true : false
					};

					if (this.Math.rand(0, 100) < 15)
					{
						earthTile.fill(rect, _properties);
					}
					else
					{
						grassTile.fill(rect, _properties);
					}
				}
			}
		}

		this.makeBordersImpassable(_rect);
	}

});

