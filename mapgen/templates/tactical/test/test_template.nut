this.test_template <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.test_template";
		this.m.MinX = 32;
		this.m.MinY = 32;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local grassTile = this.MapGen.get("tactical.tile.grass1");
		local earthTile = this.MapGen.get("tactical.tile.earth1");
		local swampTile = this.MapGen.get("tactical.tile.swamp");
		local roadTile = this.MapGen.get("tactical.tile.road");
		local hill = this.MapGen.get("tactical.test_hill");
		local marshland = this.MapGen.get("tactical.test_marshland");
		local forest = this.MapGen.get("tactical.test_forest");
		local clearing = this.MapGen.get("tactical.test_clearing");

		if (this.Math.rand(1, 100) <= 50)
		{
			local roadX = 0;
			local roadY = this.Math.rand(5, _rect.H - 5);
			local roadEndX = _rect.W - 1;

			for( local roadXMoved = false; true;  )
			{
				roadTile.fill({
					X = roadX,
					Y = roadY,
					W = 1,
					H = 1,
					IsEmpty = false
				}, _properties);
				roadTile.fill({
					X = roadX,
					Y = roadY + 1,
					W = 1,
					H = 1,
					IsEmpty = false
				}, _properties);

				if (roadX == roadEndX)
				{
					break;
				}

				local r = this.Math.rand(0, 100);

				if (!roadXMoved || r < 33)
				{
					roadX = ++roadX;
					roadXMoved = true;
				}
				else if (r < 66 && roadY + 1 < _rect.H - 1)
				{
					roadY = ++roadY;
					roadXMoved = false;
				}
				else if (roadY - 1 >= 1)
				{
					roadY = --roadY;
					roadXMoved = false;
				}
			}
		}

		local templates = [];

		do
		{
			templates = [];

			if (this.Math.rand(1, 100) <= 50)
			{
				templates.push(hill);
			}

			if (this.Math.rand(1, 100) <= 33)
			{
				templates.push(marshland);
			}

			if (this.Math.rand(1, 100) <= 33)
			{
				templates.push(forest);
			}

			if (this.Math.rand(1, 100) <= 33)
			{
				templates.push(clearing);
			}
		}
		while (templates.len() <= 1);

		local patches = 8;

		while (patches != 0)
		{
			patches = --patches;
			local sizeX = this.Math.rand(8, 16);
			local sizeY = this.Math.rand(8, 16);
			local rect = {
				X = 0,
				Y = 0,
				W = sizeX,
				H = sizeY,
				IsEmpty = false
			};
			rect.X = this.Math.rand(1, _rect.W - sizeX);
			rect.Y = this.Math.rand(1, _rect.H - sizeY);
			templates[this.Math.rand(0, templates.len() - 1)].fill(rect, _properties);
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

					if (this.Math.rand(0, 100) > bumpyChance - n * 25)
					{
						tile.Level = 1;
					}

					if (this.Math.rand(0, 100) < 20)
					{
						earthTile.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = true
						}, _properties);
					}
					else
					{
						grassTile.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = this.Math.rand(1, 100) < 50
						}, _properties);
					}
				}
			}
		}

		this.makeBordersImpassable(_rect);
	}

});

