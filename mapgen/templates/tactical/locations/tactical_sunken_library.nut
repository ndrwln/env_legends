this.tactical_sunken_library <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.sunken_library";
		this.m.MinX = 32;
		this.m.MinY = 32;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local centerTile = this.Tactical.getTileSquare(_rect.W / 2 + _properties.ShiftX, _rect.H / 2 + _properties.ShiftY);
		local radius = this.Const.Tactical.Settings.CampRadius + 5;
		local statue = 3;

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);

				if (!tile.IsEmpty)
				{
					tile.removeObject();
				}

				local d = centerTile.getDistanceTo(tile);

				if (d > radius)
				{
				}
				else if (tile.IsEmpty)
				{
					if (this.Math.rand(1, 100) <= 11)
					{
						tile.clear();
						local r = this.Math.rand(1, 4);

						if (r == 1)
						{
							tile.spawnObject("entity/tactical/objects/southern_ruins");
						}
						else
						{
							tile.spawnObject("entity/tactical/objects/southern_ruins_big");
						}
					}

					if (statue > 0 && this.Math.rand(1, 100) <= 1)
					{
						statue = --statue;
						tile.clear();
						tile.spawnObject("entity/tactical/objects/southern_ruins_statue");
					}
					else if (this.Math.rand(1, 100) <= 20)
					{
						local deco = [
							"02",
							"03"
						];
						tile.clear();
						tile.spawnDetail("southern_ruins_" + deco[this.Math.rand(0, deco.len() - 1)]);
					}
				}
			}
		}
	}

});

