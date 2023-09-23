this.tactical_hills <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.hills";
		this.m.MinX = 32;
		this.m.MinY = 32;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local grassTile1 = this.MapGen.get("tactical.tile.grass1");
		local grassTile2 = this.MapGen.get("tactical.tile.grass2");
		local earthTile1 = this.MapGen.get("tactical.tile.earth1");
		this.addRoads(_rect, _properties);
		local templates = [];
		local mainPatch = this.MapGen.get("tactical.patch.clearing_leveled");
		local clearingPatch = this.MapGen.get("tactical.patch.clearing");
		local hillPatch = this.MapGen.get("tactical.patch.hill");
		templates.push(mainPatch);
		templates.push(mainPatch);
		templates.push(mainPatch);
		templates.push(mainPatch);
		templates.push(mainPatch);
		templates.push(clearingPatch);

		if (this.Math.rand(1, 100) <= 50)
		{
			templates.push(this.MapGen.get("tactical.patch.flower_sea"));
		}

		if (this.Math.rand(1, 100) <= 50)
		{
			templates.push(this.MapGen.get("tactical.patch.clover_sea"));
		}

		local hillPatches = this.Math.rand(2, 3);
		local hillAttempts = 0;

		while (hillPatches != 0 && hillAttempts < 2000)
		{
			hillAttempts = ++hillAttempts;
			local sizeX = this.Math.rand(10, 20);
			local sizeY = this.Math.rand(10, 20);
			local rect = {
				X = 0,
				Y = 0,
				W = sizeX,
				H = sizeY,
				IsEmpty = false
			};
			rect.X = this.Math.rand(1, _rect.W - sizeX);
			rect.Y = this.Math.rand(1, _rect.H - sizeY);
			local skip = false;

			for( local x = rect.X - 1; x != rect.X + sizeX + 1; x = ++x )
			{
				for( local y = rect.Y - 1; y != rect.Y + sizeY + 1; y = ++y )
				{
					if (!this.Tactical.isValidTileSquare(x, y))
					{
					}
					else
					{
						local tile = this.Tactical.getTileSquare(x, y);

						if (tile.IsSpecialTerrain)
						{
							skip = true;
							break;
						}
					}
				}

				if (skip)
				{
					break;
				}
			}

			if (skip)
			{
				continue;
			}

			hillPatch.fill(rect, _properties);
			hillPatches = --hillPatches;
		}

		local patches = 6;

		while (patches != 0)
		{
			patches = --patches;
			local selectedTemplate = templates[this.Math.rand(0, templates.len() - 1)];
			local sizeX = this.Math.rand(this.Math.min(selectedTemplate.getMinX(), 8), this.Math.min(selectedTemplate.getMaxX(), 20));
			local sizeY = this.Math.rand(this.Math.min(selectedTemplate.getMinY(), 8), this.Math.min(selectedTemplate.getMaxY(), 20));
			local rect = {
				X = 0,
				Y = 0,
				W = sizeX,
				H = sizeY,
				IsEmpty = this.Math.rand(0, 2) != 2
			};
			rect.X = this.Math.rand(1, _rect.W - sizeX);
			rect.Y = this.Math.rand(1, _rect.H - sizeY);
			selectedTemplate.fill(rect, _properties);
		}

		local bumpyChance = 100;

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
					local n = 0;

					if (this.Tactical.isValidTileSquare(x - 1, y) && this.Tactical.getTileSquare(x - 1, y).Level == 1)
					{
						n = ++n;
					}

					if (this.Tactical.isValidTileSquare(x - 1, y + 1) && this.Tactical.getTileSquare(x - 1, y + 1).Level == 1)
					{
						n = ++n;
					}

					if (this.Tactical.isValidTileSquare(x, y - 1) && this.Tactical.getTileSquare(x, y - 1).Level == 1)
					{
						n = ++n;
					}

					tile.Level = 0;

					if (this.Math.rand(1, 100) > bumpyChance - n * 10)
					{
						tile.Level = 1;
					}

					n = this.Math.rand(1, 100);

					if (n < 50)
					{
						grassTile1.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = this.Math.rand(1, 5) != 1
						}, _properties);
					}
					else if (n < 90)
					{
						grassTile2.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = this.Math.rand(1, 5) != 1
						}, _properties);
					}
					else
					{
						earthTile1.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = this.Math.rand(1, 5) != 1
						}, _properties);
					}
				}
			}
		}

		this.makeBordersImpassable(_rect);
	}

	function campify( _rect, _properties )
	{
		local earthTile1 = this.MapGen.get("tactical.tile.earth1");
		local earthTile2 = this.MapGen.get("tactical.tile.grass2");
		local earthTile4 = this.MapGen.get("tactical.tile.stone2");
		local centerTile = this.Tactical.getTileSquare(_rect.X + _rect.W / 2 + _properties.ShiftX, _rect.Y + _rect.H / 2 + _properties.ShiftY);
		local radius = this.Const.Tactical.Settings.CampRadius + _properties.AdditionalRadius;

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);
				local d = centerTile.getDistanceTo(tile);

				if (d > radius + 3)
				{
				}
				else
				{
					if (d <= radius)
					{
						tile.Level = 3;
					}
					else if (d <= radius + 1 && tile.Level != 3)
					{
						if (this.Math.rand(1, 100) <= 50)
						{
							tile.Level = 3;
						}
						else
						{
							tile.Level = 2;
						}
					}
					else if (d <= radius + 2 && tile.Level != 3)
					{
						tile.Level = 2;
					}
					else if (d >= radius && this.Math.rand(1, 100) <= 33 && tile.Level != 3)
					{
						tile.Level = 1;
					}

					if (this.Math.rand(1, 100) <= 50 + (7 - d) * 7)
					{
						tile.Type = 0;
						tile.clear();
						local r = this.Math.rand(1, 100);

						if (r <= 40)
						{
							earthTile1.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, null);
						}
						else if (r <= 80)
						{
							earthTile2.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, null);
						}
						else
						{
							earthTile4.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, null);
						}
					}

					if (tile.IsHidingEntity)
					{
						tile.clear();
					}

					if (!tile.IsEmpty && this.Math.rand(1, 100) <= 50)
					{
						tile.removeObject();
					}
				}
			}
		}
	}

});

