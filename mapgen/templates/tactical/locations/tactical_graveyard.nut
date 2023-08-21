this.tactical_graveyard <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.graveyard";
		this.m.MinX = 32;
		this.m.MinY = 32;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local centerTile = this.Tactical.getTileSquare(_rect.W / 2 + _properties.ShiftX, _rect.H / 2 + _properties.ShiftY);
		local minDist = 0;
		local isOnHill = centerTile.Level == 3;
		local hasPalisade = !isOnHill && this.Math.rand(1, 100) <= 80;
		local radius = this.Const.Tactical.Settings.CampRadius + _properties.AdditionalRadius;

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);
				local d = centerTile.getDistanceTo(tile);

				if (d < minDist || d > radius)
				{
				}
				else
				{
					if (this.Math.rand(1, 100) <= 50)
					{
						tile.removeObject();
					}

					if (hasPalisade && d == radius && y != centerTile.SquareCoords.Y)
					{
						tile.clear();

						if ((!isOnHill || tile.Level == 0) && this.Math.rand(1, 100) < 50)
						{
							tile.removeObject();
							local o = tile.spawnObject("entity/tactical/objects/graveyard_wall");
							o.setDirBasedOnCenter(centerTile, radius);
						}
					}
					else if (d < radius - 1 && tile.IsEmpty)
					{
						if (this.Math.rand(1, 100) <= 2)
						{
							tile.clear();
							local r = this.Math.rand(1, 4);

							if (r == 1)
							{
								tile.spawnObject("entity/tactical/objects/graveyard_ruins");
							}
							else if (r == 2)
							{
								tile.spawnObject("entity/tactical/objects/graveyard_sarcophagus");
							}
							else
							{
								tile.spawnObject("entity/tactical/objects/graveyard_ruins_big");
							}
						}
						else if (this.Math.rand(1, 100) <= 4)
						{
							tile.clear();
							tile.spawnObject("entity/tactical/objects/graveyard_grave");
						}
						else if (this.Math.rand(1, 100) <= 20)
						{
							local deco = [
								"01",
								"02",
								"04",
								"05",
								"06",
								"07",
								"07",
								"13",
								"14",
								"15",
								"19",
								"28",
								"28"
							];
							tile.clear();
							tile.spawnDetail("graveyard_" + deco[this.Math.rand(0, deco.len() - 1)]);
						}
					}
				}
			}
		}
	}

});

