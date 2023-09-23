this.tactical_tundra <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.tundra";
		this.m.MinX = 32;
		this.m.MinY = 32;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local tundraTile1 = this.MapGen.get("tactical.tile.tundra1");
		local tundraTile2 = this.MapGen.get("tactical.tile.tundra2");
		local tundraTile3 = this.MapGen.get("tactical.tile.tundra3");
		local tundraTile4 = this.MapGen.get("tactical.tile.tundra4");
		this.addRoads(_rect, _properties);
		local templates = [];
		local tundraPatch1 = this.MapGen.get("tactical.patch.tundra_grass");
		local tundraPatch2 = this.MapGen.get("tactical.patch.tundra_stony");
		templates.push(tundraPatch1);
		templates.push(tundraPatch1);
		templates.push(tundraPatch1);
		templates.push(tundraPatch2);
		templates.push(tundraPatch2);
		templates.push(this.MapGen.get("tactical.patch.tundra_brushes"));
		local patches = 12;

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

		local bumpyChance = this.Math.rand(90, 100);

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

					local r = this.Math.rand(1, 4);

					if (r == 1)
					{
						tundraTile1.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = false
						}, _properties);
					}
					else if (r == 2)
					{
						tundraTile2.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = false
						}, _properties);
					}
					else if (r == 3)
					{
						tundraTile3.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = false
						}, _properties);
					}
					else if (r == 4)
					{
						tundraTile4.fill({
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

	function campify( _rect, _properties )
	{
		local tundraTile2 = this.MapGen.get("tactical.tile.tundra2");
		local tundraTile3 = this.MapGen.get("tactical.tile.tundra3");
		local centerTile = this.Tactical.getTileSquare(_rect.X + _rect.W / 2 + _properties.ShiftX, _rect.Y + _rect.H / 2 + _properties.ShiftY);
		local radius = this.Const.Tactical.Settings.CampRadius + _properties.AdditionalRadius;

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);
				local d = centerTile.getDistanceTo(tile);

				if (d <= radius)
				{
					tile.Level = 0;

					if (this.Math.rand(1, 100) <= 50)
					{
						tile.Type = 0;
						tile.clear();
						local r = this.Math.rand(1, 2);

						if (r == 1)
						{
							tundraTile2.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, null);
						}
						else if (r == 2)
						{
							tundraTile3.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, null);
						}
					}
				}

				if (_properties.CutDownTrees && tile.IsEmpty && d < 15 && this.Math.rand(1, 100) <= 4)
				{
					local alone = true;

					for( local i = 0; i < 6; i = ++i )
					{
						if (!tile.hasNextTile(i))
						{
						}
						else if (!tile.getNextTile(i).IsEmpty)
						{
							alone = false;
							break;
						}
					}

					if (alone)
					{
						tile.spawnObject("entity/tactical/objects/tree_stump2");
					}
				}
			}
		}
	}

});

