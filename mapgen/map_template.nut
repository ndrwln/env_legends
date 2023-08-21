this.map_template <- {
	m = {
		Name = null,
		MinX = 4,
		MaxX = 100,
		MinY = 4,
		MaxY = 100
	},
	function getName()
	{
		return this.m.Name;
	}

	function getMinX()
	{
		return this.m.MinX;
	}

	function getMinY()
	{
		return this.m.MinY;
	}

	function getMaxX()
	{
		return this.m.MaxX;
	}

	function getMaxY()
	{
		return this.m.MaxY;
	}

	function init()
	{
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		switch(_pass)
		{
		case 1:
			this.onFirstPass(_rect);
			break;

		case 2:
			this.onSecondPass(_rect);
			break;

		case 3:
			this.onThirdPass(_rect);
			break;
		}
	}

	function makeTacticalBordersImpassable( _rect )
	{
	}

	function makeWorldBordersImpassable( _rect )
	{
		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			local tile = this.World.getTileSquare(x, _rect.Y).Type = this.Const.World.TerrainType.Impassable;
		}

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			local tile = this.World.getTileSquare(x, _rect.Y + _rect.H - 1).Type = this.Const.World.TerrainType.Impassable;
		}

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			local tile = this.World.getTileSquare(x, _rect.Y + _rect.H - 2).Type = this.Const.World.TerrainType.Impassable;
		}

		for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
		{
			local tile = this.World.getTileSquare(_rect.X, y).Type = this.Const.World.TerrainType.Impassable;
		}

		for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
		{
			local tile = this.World.getTileSquare(_rect.X + _rect.W - 1, y).Type = this.Const.World.TerrainType.Impassable;
		}
	}

	function onFirstPass( _rect )
	{
	}

	function onSecondPass( _rect )
	{
	}

	function onThirdPass( _rect )
	{
	}

};

