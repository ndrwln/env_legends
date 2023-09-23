this.tactical_ruins <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.ruins";
		this.m.MinX = 32;
		this.m.MinY = 32;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local centerTile = this.Tactical.getTileSquare(_rect.W / 2 + _properties.ShiftX, _rect.H / 2 + _properties.ShiftY);
		local minDist = 0;
		local isOnHill = centerTile.Level == 3;
		local hasPalisade = _properties.Fortification != 0;
		local radius = this.Const.Tactical.Settings.CampRadius + _properties.AdditionalRadius;
		local bonus = _properties.Template[1] != null ? this.MapGen.get(_properties.Template[1]) : null;
		local statue = this.Math.rand(0, 1);

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

						if ((!isOnHill || tile.Level >= 2) && (this.Math.rand(1, 100) < 40 + (_properties.Fortification == this.Const.Tactical.FortificationType.WallsAndPalisade ? 10 : 0) + (isOnHill ? -10 : 0) || y == centerTile.SquareCoords.Y + 2))
						{
							tile.removeObject();
							local o;

							if (_properties.Fortification == this.Const.Tactical.FortificationType.Palisade)
							{
								o = tile.spawnObject("entity/tactical/objects/human_camp_wall");
							}
							else if (_properties.Fortification == this.Const.Tactical.FortificationType.Walls)
							{
								o = tile.spawnObject("entity/tactical/objects/graveyard_wall");
							}
							else if (this.Math.rand(1, 100) <= 30)
							{
								o = tile.spawnObject("entity/tactical/objects/human_camp_wall");
							}
							else
							{
								o = tile.spawnObject("entity/tactical/objects/graveyard_wall");
							}

							o.setDirBasedOnCenter(centerTile, radius);
						}
					}
					else if (d < radius - 1 && tile.IsEmpty)
					{
						if (this.Math.rand(1, 100) <= 11)
						{
							tile.clear();
							local r = this.Math.rand(1, 3);

							if (r == 1)
							{
								tile.spawnObject("entity/tactical/objects/graveyard_ruins");
							}
							else
							{
								tile.spawnObject("entity/tactical/objects/graveyard_ruins_big");
							}
						}

						if (statue > 0 && this.Math.rand(1, 100) <= 1)
						{
							statue = --statue;
							tile.clear();
							tile.spawnObject("entity/tactical/objects/graveyard_ruins_statue");
						}
						else if (this.Math.rand(1, 100) <= 20)
						{
							local deco = [
								"05",
								"06"
							];
							tile.clear();
							tile.spawnDetail("graveyard_" + deco[this.Math.rand(0, deco.len() - 1)]);
						}
						else if (bonus != null)
						{
							bonus.spawnDetail(tile, d, hasPalisade, isOnHill);
						}
					}
				}
			}
		}
	}

});

