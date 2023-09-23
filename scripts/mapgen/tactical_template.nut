this.tactical_template <- this.inherit("scripts/mapgen/map_template", {
	m = {},
	function init()
	{
		this.map_template.init();
	}

	function makeBordersImpassable( _rect )
	{
	}

	function campify( _rect, _properties )
	{
	}

	function addRoads( _rect, _properties )
	{
		if (_properties == null || _properties.Tile == null)
		{
			return;
		}

		local roadTile = this.MapGen.get("tactical.tile.road");

		if ((_properties.Tile.RoadDirections & this.Const.DirectionBit[this.Const.Direction.N]) != 0 && (_properties.Tile.RoadDirections & this.Const.DirectionBit[this.Const.Direction.S]) != 0)
		{
			local roadX = _rect.W / 2;
			local roadY = 0;
			local roadEndY = _rect.H - 1;

			for( local roadYMoved = false; true;  )
			{
				roadTile.fill({
					X = roadX,
					Y = roadY,
					W = 1,
					H = 1,
					IsEmpty = false
				}, _properties);
				roadTile.fill({
					X = roadX + 1,
					Y = roadY,
					W = 1,
					H = 1,
					IsEmpty = false
				}, _properties);

				if (roadY == roadEndY)
				{
					break;
				}

				local r = this.Math.rand(0, 100);

				if (!roadYMoved || r < 50)
				{
					roadY = ++roadY;
					roadYMoved = true;
				}
				else if (r < 66 && roadX + 1 < _rect.H - 1)
				{
					roadX = ++roadX;
					roadYMoved = false;
				}
				else if (roadY - 1 >= 1)
				{
					roadX = --roadX;
					roadYMoved = false;
				}
			}
		}

		if ((_properties.Tile.RoadDirections & this.Const.DirectionBit[this.Const.Direction.NW]) != 0 && (_properties.Tile.RoadDirections & this.Const.DirectionBit[this.Const.Direction.NE]) != 0)
		{
			local roadX = 0;
			local roadY = this.Math.round(_rect.H * 0.75);
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

		if ((_properties.Tile.RoadDirections & this.Const.DirectionBit[this.Const.Direction.SW]) != 0 && (_properties.Tile.RoadDirections & this.Const.DirectionBit[this.Const.Direction.SE]) != 0)
		{
			local roadX = 0;
			local roadY = this.Math.round(_rect.H * 0.25);
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
				else if (r < 66 && roadY - 1 >= 1)
				{
					roadY = --roadY;
					roadXMoved = false;
				}
				else if (roadY + 1 < _rect.H - 1)
				{
					roadY = ++roadY;
					roadXMoved = false;
				}
			}
		}

		if ((_properties.Tile.RoadDirections & this.Const.DirectionBit[this.Const.Direction.NW]) != 0 && (_properties.Tile.RoadDirections & this.Const.DirectionBit[this.Const.Direction.SE]) != 0)
		{
			local roadX = 0;
			local roadY = this.Math.round(_rect.H * 0.75);
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
				else if (r < 90 && roadY - 1 >= 1)
				{
					roadY = --roadY;
					roadXMoved = false;
				}
				else if (roadY + 1 < _rect.H - 1)
				{
					roadY = ++roadY;
					roadXMoved = false;
				}
			}
		}

		if ((_properties.Tile.RoadDirections & this.Const.DirectionBit[this.Const.Direction.SW]) != 0 && (_properties.Tile.RoadDirections & this.Const.DirectionBit[this.Const.Direction.NE]) != 0)
		{
			local roadX = 0;
			local roadY = this.Math.round(_rect.H * 0.25);
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
				else if (r < 90 && roadY + 1 < _rect.H - 1)
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
	}

});

