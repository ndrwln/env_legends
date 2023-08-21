this.tactical_goblin_camp <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.goblin_camp";
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
		local heads00 = 1;
		local heads01 = 1;

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
					if (this.Math.rand(1, 100) <= (hasPalisade ? 50 : 75))
					{
						tile.removeObject();
					}

					if ((hasPalisade && d < radius || !hasPalisade && d < 6) && tile.IsEmpty && d > 1)
					{
						local n = 0;

						for( local i = 0; i < 6; i = ++i )
						{
							if (!tile.hasNextTile(i))
							{
							}
							else if (!tile.getNextTile(i).IsEmpty)
							{
								n = ++n;
							}
						}

						if (this.Math.rand(1, 100) <= 2 + n * 2)
						{
							tile.clear();
							local r = this.Math.rand(1, 3);

							if (r == 1)
							{
								tile.spawnObject("entity/tactical/objects/orc_camp_large_remains");
							}
							else
							{
								tile.spawnObject("entity/tactical/objects/goblin_camp_supplies");
							}
						}
					}
				}
			}
		}

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);
				local d = centerTile.getDistanceTo(tile);
				local k = !hasPalisade || isOnHill ? -2 : 0;

				if (heads00 > 0 && d > 9 + k && d < 16 + k && this.Math.rand(1, 100) <= 1)
				{
					heads00 = --heads00;
					tile.removeObject();
					local o = tile.spawnObject("entity/tactical/objects/orc_camp_head");
					o.setVariant(0);
					o.setFlipped(x < (_rect.X + _rect.W) / 2);
				}

				if (heads01 > 0 && d > 9 + k && d < 16 + k && this.Math.rand(1, 100) <= 1)
				{
					heads01 = --heads01;
					tile.removeObject();
					local o = tile.spawnObject("entity/tactical/objects/orc_camp_head");
					o.setVariant(1);
					o.setFlipped(x < (_rect.X + _rect.W) / 2);
				}

				if (d < minDist || d > radius)
				{
				}
				else if (hasPalisade && d == radius && y != centerTile.SquareCoords.Y && x != centerTile.SquareCoords.X - 4)
				{
					tile.clear();

					if ((!isOnHill || tile.Level >= 2) && (this.Math.rand(1, 100) < 60 + (isOnHill ? -10 : 0) || y == centerTile.SquareCoords.Y + 2 || y == centerTile.SquareCoords.Y - 2))
					{
						tile.removeObject();
						local o;

						if (_properties.Fortification == this.Const.Tactical.FortificationType.Palisade)
						{
							o = tile.spawnObject("entity/tactical/objects/orc_camp_wall");
						}
						else if (_properties.Fortification == this.Const.Tactical.FortificationType.Walls)
						{
							o = tile.spawnObject("entity/tactical/objects/graveyard_wall");
						}
						else if (this.Math.rand(1, 100) <= 50)
						{
							o = tile.spawnObject("entity/tactical/objects/orc_camp_wall");
						}
						else
						{
							o = tile.spawnObject("entity/tactical/objects/graveyard_wall");
						}

						o.setDirBasedOnCenter(centerTile, radius);

						for( local i = 0; i < 6; i = ++i )
						{
							if (!tile.hasNextTile(i))
							{
							}
							else if (tile.getNextTile(i).getDistanceTo(centerTile) > d && tile.getNextTile(i).Level > tile.Level)
							{
								tile.getNextTile(i).Level = tile.Level;
							}
							else if (tile.getNextTile(i).getDistanceTo(centerTile) == d)
							{
								tile.IsSpecialTerrain = true;
							}
						}
					}
				}
				else if ((hasPalisade && d < radius - 1 || !hasPalisade && d < 6) && tile.IsEmpty)
				{
					local n = 0;

					for( local i = 0; i < 6; i = ++i )
					{
						if (!tile.hasNextTile(i))
						{
						}
						else if (!tile.getNextTile(i).IsEmpty)
						{
							n = ++n;
						}
					}

					if (d == 0 || n == 0 && this.Math.rand(1, 100) <= 1)
					{
						tile.clear();
						tile.spawnObject("entity/tactical/objects/orc_camp_fireplace");
					}
					else if (hasPalisade && this.Math.rand(1, 100) <= 1)
					{
						tile.clear();
						tile.spawnObject("entity/tactical/objects/goblin_camp_brazier");
					}
					else if (d > 1 && this.Math.rand(1, 100) <= 1)
					{
						tile.clear();
						tile.spawnObject("entity/tactical/objects/goblin_camp_weapon_display");
					}
					else if (d >= 5 && this.Math.rand(1, 100) <= 1)
					{
						tile.clear();
						tile.spawnObject("entity/tactical/objects/goblin_camp_standard");
					}
					else if (d >= 6 + k && this.Math.rand(1, 100) <= 1)
					{
						tile.clear();
						tile.spawnObject("entity/tactical/objects/goblin_camp_cage");
					}
					else if (d <= 6 + k && this.Math.rand(1, 100) <= (hasPalisade ? 9 : 6))
					{
						local deco = [
							"02"
						];
						tile.clear();
						tile.spawnDetail("goblins_" + deco[this.Math.rand(0, deco.len() - 1)]);
					}
					else if (d >= 7 + k && this.Math.rand(1, 100) <= (hasPalisade ? 4 : 2))
					{
						local deco = [
							"01"
						];
						tile.clear();
						tile.spawnDetail("goblins_" + deco[this.Math.rand(0, deco.len() - 1)]);
					}
				}
			}
		}
	}

	function spawnDetail( _tile, _distance, _hasPalisade, _isOnHill )
	{
		local k = !_hasPalisade || _isOnHill ? -2 : 0;

		if (_distance <= 6 + k && this.Math.rand(1, 100) <= (_hasPalisade ? 9 : 6))
		{
			local deco = [
				"02"
			];
			_tile.clear();
			_tile.spawnDetail("goblins_" + deco[this.Math.rand(0, deco.len() - 1)]);
		}
		else if (_distance >= 7 + k && this.Math.rand(1, 100) <= (_hasPalisade ? 4 : 2))
		{
			local deco = [
				"01"
			];
			_tile.clear();
			_tile.spawnDetail("goblins_" + deco[this.Math.rand(0, deco.len() - 1)]);
		}
	}

});

