this.roam_order <- this.inherit("scripts/ai/world/world_behavior", {
	m = {
		Terrain = [],
		Pivot = null,
		TargetTile = null,
		MinRange = 3,
		MaxRange = 7,
		RoamTimeStart = 0.0,
		RoamTime = 0.0,
		Attempts = 0,
		IsAvoidingHeat = false
	},
	function setAvoidHeat( _h )
	{
		this.m.IsAvoidingHeat = _h;
	}

	function setTime( _t )
	{
		this.m.RoamTime = _t;
	}

	function setTerrain( _t, _v )
	{
		this.m.Terrain[_t] = _v;
	}

	function setAllTerrainAvailable()
	{
		for( local i = 0; i != this.Const.World.TerrainType.COUNT; i = ++i )
		{
			this.m.Terrain[i] = true;
		}
	}

	function setNoTerrainAvailable()
	{
		for( local i = 0; i != this.Const.World.TerrainType.COUNT; i = ++i )
		{
			this.m.Terrain[i] = false;
		}
	}

	function setPivot( _p )
	{
		if (_p == null)
		{
			this.m.Pivot = null;
		}
		else if (typeof _p == "instance")
		{
			this.m.Pivot = _p;
		}
		else
		{
			this.m.Pivot = this.WeakTableRef(_p);
		}
	}

	function setMinRange( _r )
	{
		this.m.MinRange = _r;
	}

	function setMaxRange( _r )
	{
		this.m.MaxRange = _r;
	}

	function create()
	{
		this.world_behavior.create();
		this.m.ID = this.Const.World.AI.Behavior.ID.Roam;
		this.m.Terrain.resize(this.Const.World.TerrainType.COUNT);

		for( local i = 0; i != this.Const.World.TerrainType.COUNT; i = ++i )
		{
			this.m.Terrain[i] = false;
		}
	}

	function onSerialize( _out )
	{
		this.world_behavior.onSerialize(_out);

		for( local i = 0; i != this.Const.World.TerrainType.COUNT; i = ++i )
		{
			_out.writeBool(this.m.Terrain[i]);
		}

		if (this.m.Pivot != null && !this.m.Pivot.isNull())
		{
			_out.writeU32(this.m.Pivot.getID());
		}
		else
		{
			_out.writeU32(0);
		}

		_out.writeU8(this.m.MinRange);
		_out.writeU8(this.m.MaxRange);
		_out.writeF32(this.m.RoamTimeStart);
		_out.writeF32(this.m.RoamTime);
		_out.writeBool(this.m.IsAvoidingHeat);
	}

	function onDeserialize( _in )
	{
		this.world_behavior.onDeserialize(_in);

		if (_in.getMetaData().getVersion() <= 49)
		{
			for( local i = 0; i <= this.Const.World.TerrainType.Shore; i = ++i )
			{
				this.m.Terrain[i] = _in.readBool();
			}
		}
		else
		{
			for( local i = 0; i != this.Const.World.TerrainType.COUNT; i = ++i )
			{
				this.m.Terrain[i] = _in.readBool();
			}
		}

		local pivotID = _in.readU32();

		if (pivotID != 0)
		{
			this.m.Pivot = this.WeakTableRef(this.World.getEntityByID(pivotID));
		}

		this.m.MinRange = _in.readU8();
		this.m.MaxRange = _in.readU8();
		this.m.RoamTimeStart = _in.readF32();
		this.m.RoamTime = _in.readF32();
		this.m.IsAvoidingHeat = _in.readBool();
	}

	function onExecute( _entity, _hasChanged )
	{
		if (this.m.RoamTimeStart == 0)
		{
			this.m.RoamTimeStart = this.Time.getVirtualTimeF();
		}
		else if (this.m.RoamTime != 0 && this.m.RoamTimeStart + this.m.RoamTime <= this.Time.getVirtualTimeF())
		{
			this.getController().popOrder();
		}

		if (_hasChanged || _entity.getPath() == null || this.m.TargetTile == null || this.m.TargetTile.ID == _entity.getTile().ID)
		{
			++this.m.Attempts;
			_entity.setOrders("Roaming");
			this.findTargetTile(_entity);

			if (this.m.TargetTile == null)
			{
				return true;
			}

			local navSettings = this.World.getNavigator().createSettings();
			navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost;
			navSettings.RoadMult = 1.0;
			navSettings.HeatCost = this.m.IsAvoidingHeat ? 100 : 0;
			local path = this.World.getNavigator().findPath(_entity.getTile(), this.m.TargetTile, navSettings, 0);

			if (!path.isEmpty())
			{
				_entity.setPath(path);
				this.m.Attempts = 0;
			}
			else
			{
				this.m.TargetTile = null;

				if (this.m.Attempts >= 100 && !_entity.isDiscovered() && _entity.isHiddenToPlayer() && !_entity.getSprite("selection").Visible)
				{
					_entity.die();
				}
			}
		}

		return true;
	}

	function findTargetTile( _entity )
	{
		local attempts = 0;
		local myTile = _entity.getTile();
		local path;
		local pivotTile;

		if (this.m.Pivot && !this.m.Pivot.isNull() && this.m.Pivot.isAlive())
		{
			pivotTile = this.m.Pivot.getTile();
		}
		else
		{
			pivotTile = myTile;
		}

		while (attempts < this.Const.World.AI.Behavior.RoamMaxAttempts)
		{
			attempts = ++attempts;
			local x = pivotTile.SquareCoords.X;
			local y = pivotTile.SquareCoords.Y;
			x = x + (this.Math.rand(0, this.m.MaxRange * 2) - this.m.MaxRange);
			y = y + (this.Math.rand(0, this.m.MaxRange * 2) - this.m.MaxRange);

			if (!this.World.isValidTileSquare(x, y))
			{
				continue;
			}

			local tile = this.World.getTileSquare(x, y);

			if (!this.m.Terrain[tile.Type])
			{
				continue;
			}

			if (tile.IsOccupied)
			{
				continue;
			}

			if (tile.getDistanceTo(pivotTile) < this.m.MinRange)
			{
				continue;
			}

			this.m.TargetTile = tile;
			return;
		}
	}

});

