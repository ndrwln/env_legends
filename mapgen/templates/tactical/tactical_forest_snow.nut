this.tactical_forest_snow <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.forest_snow";
		this.m.MinX = 32;
		this.m.MinY = 32;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local mossTile = this.MapGen.get("tactical.tile.snow1");
		this.addRoads(_rect, _properties);
		local templates = [];
		local forestThickPatch = this.MapGen.get("tactical.patch.forest_thick_snow");
		local forestPatch = this.MapGen.get("tactical.patch.forest_snow");
		templates.push(forestPatch);
		templates.push(forestPatch);
		templates.push(forestPatch);
		templates.push(forestPatch);
		templates.push(forestPatch);
		local thickPatches = 100;
		local thickAttempts = 0;

		while (thickPatches != 0 && thickAttempts < 5000)
		{
			thickAttempts = ++thickAttempts;
			local sizeX = this.Math.rand(2, 5);
			local sizeY = this.Math.rand(2, 5);
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

			forestThickPatch.fill(rect, _properties);
			thickPatches = --thickPatches;
		}

		local patches = 20;

		while (patches != 0)
		{
			patches = --patches;
			local selectedTemplate = templates[this.Math.rand(0, templates.len() - 1)];
			local sizeX = this.Math.rand(this.Math.max(selectedTemplate.getMinX(), this.Math.min(selectedTemplate.getMaxX(), 6)), this.Math.min(selectedTemplate.getMaxX(), 12));
			local sizeY = this.Math.rand(this.Math.max(selectedTemplate.getMinY(), this.Math.min(selectedTemplate.getMaxY(), 6)), this.Math.min(selectedTemplate.getMaxY(), 12));
			local rect = {
				X = 0,
				Y = 0,
				W = sizeX,
				H = sizeY,
				IsEmpty = false
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

					if (this.Math.rand(1, 100) > bumpyChance - n * 25)
					{
						tile.Level = 1;
					}

					mossTile.fill({
						X = x,
						Y = y,
						W = 1,
						H = 1,
						IsEmpty = false
					}, _properties);
				}
			}
		}

		this.makeBordersImpassable(_rect);
	}

	function campify( _rect, _properties )
	{
		local snowTile3 = this.MapGen.get("tactical.tile.snow3");
		local centerTile = this.Tactical.getTileSquare(_rect.X + _rect.W / 2 + _properties.ShiftX, _rect.Y + _rect.H / 2 + _properties.ShiftY);
		local radius = this.Const.Tactical.Settings.CampRadius + _properties.AdditionalRadius;

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);
				local d = centerTile.getDistanceTo(tile);

				if (_properties.CutDownTrees && !tile.IsEmpty && this.Math.rand(1, 100) <= 20)
				{
					tile.clear();
					tile.removeObject();
					tile.spawnObject("entity/tactical/objects/tree_stump3");
				}

				if (d <= radius + 3)
				{
					tile.Level = 0;

					if (this.Math.rand(1, 100) <= 40 + (7 - d) * 7)
					{
						tile.Type = 0;
						tile.clear();
						snowTile3.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = false
						}, null);
					}

					if (tile.IsHidingEntity)
					{
						tile.clear();
					}

					if (!tile.IsEmpty && this.Math.rand(1, 100) <= 66)
					{
						tile.removeObject();
					}
				}

				if (d > 10 && x < centerTile.SquareCoords.X && x > 4 && y > 10 && y < 30 && this.Math.rand(1, 100) <= 66)
				{
					tile.removeObject();
				}
			}
		}
	}

});

