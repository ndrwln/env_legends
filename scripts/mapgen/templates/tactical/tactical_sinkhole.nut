this.tactical_sinkhole <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.sinkhole";
		this.m.MinX = 32;
		this.m.MinY = 32;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local desertTile1 = this.MapGen.get("tactical.tile.desert1");
		local desertTile2 = this.MapGen.get("tactical.tile.desert2");
		local desertTile3 = this.MapGen.get("tactical.tile.desert7");
		local templates = [
			this.MapGen.get("tactical.patch.desert")
		];
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

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);

				if (tile.Type == 0)
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
						desertTile3.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = false
						}, _properties, 1);
						desertTile3.fill({
							X = x,
							Y = y,
							W = 1,
							H = 1,
							IsEmpty = false
						}, _properties, 2);
					}
				}

				if (x <= _rect.X || y <= _rect.Y || x >= _rect.X + _rect.W - 1 || y >= _rect.Y + _rect.H - 1)
				{
					tile.Level = 2;
				}
				else if (this.Math.rand(1, 100) <= 50 && (x <= _rect.X + 1 || y <= _rect.Y + 1 || x >= _rect.X + _rect.W - 2 || y >= _rect.Y + _rect.H - 2))
				{
					tile.Level = 2;
				}
				else if (x <= _rect.X + 2 || y <= _rect.Y + 2 || x >= _rect.X + _rect.W - 3 || y >= _rect.Y + _rect.H - 3)
				{
					tile.Level = 1;
				}
				else if (this.Math.rand(1, 100) <= 50 && (x <= _rect.X + 3 || y <= _rect.Y + 3 || x >= _rect.X + _rect.W - 4 || y >= _rect.Y + _rect.H - 4))
				{
					tile.Level = 1;
				}
				else
				{
					tile.Level = 0;
				}
			}
		}

		this.makeBordersImpassable(_rect);
	}

});

