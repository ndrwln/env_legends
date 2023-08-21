this.tactical_oasis <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.oasis";
		this.m.MinX = 32;
		this.m.MinY = 32;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local desertTile1 = this.MapGen.get("tactical.tile.desert1");
		local desertTile2 = this.MapGen.get("tactical.tile.desert2");
		local desertTile7 = this.MapGen.get("tactical.tile.desert7");
		local desertTile4 = this.MapGen.get("tactical.tile.desert4");
		local desertTile7Oasis = this.MapGen.get("tactical.tile.desert7_oasis");
		this.addRoads(_rect, _properties);
		local templates = [];
		local desertPatch = this.MapGen.get("tactical.patch.desert");
		local oasisPatch = this.MapGen.get("tactical.patch.oasis");
		templates.push(desertPatch);

		for( local i = 0; i < 5; i = ++i )
		{
			templates.push(oasisPatch);
		}

		local patches = 12;

		while (patches != 0)
		{
			patches = --patches;
			local selectedTemplate = templates[this.Math.rand(0, templates.len() - 1)];
			local sizeX = this.Math.rand(this.Math.max(selectedTemplate.getMinX(), this.Math.min(selectedTemplate.getMaxX(), 8)), this.Math.min(selectedTemplate.getMaxX(), 16));
			local sizeY = this.Math.rand(this.Math.max(selectedTemplate.getMinY(), this.Math.min(selectedTemplate.getMaxY(), 8)), this.Math.min(selectedTemplate.getMaxY(), 16));
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

					for( local i = 0; i < 6; i = ++i )
					{
						if (!tile.hasNextTile(i))
						{
						}
						else if (tile.getNextTile(i).Subtype == this.Const.Tactical.TerrainSubtype.PlashyGrass || tile.getNextTile(i).Subtype == this.Const.Tactical.TerrainSubtype.ShallowWater)
						{
							n = ++n;
						}
					}

					tile.Level = 0;

					if (n >= 2)
					{
						local r = this.Math.rand(1, 5);

						if (r == 1)
						{
							desertTile7Oasis.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, _properties, 1);
							desertTile7Oasis.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, _properties, 2);
						}
						else
						{
							desertTile4.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, _properties, 1);
							desertTile4.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, _properties, 2);
						}
					}
					else
					{
						local r = this.Math.rand(1, 3);

						if (r == 1)
						{
							desertTile1.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, _properties, 1);
							desertTile1.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, _properties, 2);
						}
						else if (r == 2)
						{
							desertTile2.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, _properties, 1);
							desertTile2.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, _properties, 2);
						}
						else if (r == 3)
						{
							desertTile7.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, _properties, 1);
							desertTile7.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = false
							}, _properties, 2);
						}
					}
				}
			}
		}

		this.makeBordersImpassable(_rect);
	}

	function campify( _rect, _properties )
	{
		local desertTile1 = this.MapGen.get("tactical.tile.desert7_oasis");
		local oasisTile1 = this.MapGen.get("tactical.tile.desert4");
		local centerTile = this.Tactical.getTileSquare(_rect.X + _rect.W / 2 + _properties.ShiftX, _rect.Y + _rect.H / 2 + _properties.ShiftY);
		local radius = this.Const.Tactical.Settings.CampRadius + _properties.AdditionalRadius;

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);
				local d = centerTile.getDistanceTo(tile);

				if (d > radius + 1)
				{
				}
				else if (tile.Subtype == this.Const.Tactical.TerrainSubtype.ShallowWater)
				{
					tile.clear();
					tile.Type = 0;
					oasisTile1.fill({
						X = x,
						Y = y,
						W = 1,
						H = 1,
						IsEmpty = false
					}, null);

					if (this.Math.rand(1, 100) <= (_properties.CutDownTrees ? 80 : 66))
					{
						tile.clear();
					}
				}
			}
		}
	}

});

