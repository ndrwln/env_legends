this.faction_action <- {
	m = {
		ID = "",
		Faction = null,
		Score = 0,
		Cooldown = 0.0,
		CooldownUntil = 0.0,
		IsRunOnNewCampaign = false,
		IsStartingOnCooldown = true,
		IsSettlementsRequired = false
	},
	function getID()
	{
		return this.m.ID;
	}

	function setFaction( _f )
	{
		this.m.Faction = this.WeakTableRef(_f);
	}

	function getFaction()
	{
		return this.m.Faction;
	}

	function getScore()
	{
		return this.m.Score;
	}

	function getCooldownUntil()
	{
		return this.m.CooldownUntil;
	}

	function setCooldownUntil( _c )
	{
		this.m.CooldownUntil = _c;
	}

	function resetCooldown()
	{
		this.m.CooldownUntil = 0.0;
	}

	function create()
	{
		if (this.m.IsStartingOnCooldown)
		{
			this.m.CooldownUntil = this.Time.getVirtualTimeF() + this.Math.min(300.0, this.Math.rand(0, this.m.Cooldown * 0.5));
		}
	}

	function update( _isNewCampaign = false )
	{
		this.m.Score = 0;
		this.onClear();

		if (this.m.IsSettlementsRequired && this.m.Faction.getSettlements().len() == 0)
		{
			return;
		}

		if (_isNewCampaign && this.m.IsRunOnNewCampaign || this.Time.getVirtualTimeF() >= this.m.CooldownUntil)
		{
			this.onUpdate(this.m.Faction);
		}
	}

	function execute( _isNewCampaign = false )
	{
		this.onExecute(this.m.Faction);
		this.onClear();

		if (!_isNewCampaign)
		{
			this.m.CooldownUntil = this.Time.getVirtualTimeF() + this.m.Cooldown;
		}
	}

	function onExecute( _faction )
	{
	}

	function onUpdate( _faction )
	{
	}

	function onClear()
	{
	}

	function isPathBetween( _start, _dest, _roadOnly = false )
	{
		local navSettings = this.World.getNavigator().createSettings();
		navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost;
		navSettings.RoadOnly = _roadOnly;
		local path = this.World.getNavigator().findPath(_start, _dest, navSettings, 0);
		return !path.isEmpty();
	}

	function getRandomConnectedSettlements( _num, _startList, _destList = null, _roadOnly = false )
	{
		if (_destList == null)
		{
			_destList = _startList;
		}

		local ret = [];
		local start = _startList[this.Math.rand(0, _startList.len() - 1)];

		if (start.isIsolated() || _roadOnly && start.isIsolatedFromRoads())
		{
			return ret;
		}

		for( local i = 0; i < _num - 1; i = ++i )
		{
			local tries = 0;
			local dest;
			local pathOk;

			do
			{
				tries = ++tries;

				if (tries > 10)
				{
					return ret;
				}

				dest = _destList[this.Math.rand(0, _destList.len() - 1)];

				if (dest.getID() != start.getID() && !dest.isIsolated() && (!_roadOnly || !dest.isIsolatedFromRoads()))
				{
					if (start.isLocationType(this.Const.World.LocationType.Settlement))
					{
						pathOk = _roadOnly ? start.isConnectedToByRoads(dest) : start.isConnectedTo(dest);
					}
					else
					{
						pathOk = this.isPathBetween(start.getTile(), dest.getTile(), _roadOnly);
					}

					if (pathOk)
					{
						break;
					}
				}
			}
			while (true);

			if (pathOk)
			{
				ret.push(dest);
			}
		}

		if (ret.len() != 0)
		{
			ret.push(start);
			ret.reverse();
		}

		return ret;
	}

	function getDistanceToNextAlly( _tile )
	{
		local ret = 999999;

		foreach( u in this.m.Faction.getUnits() )
		{
			if (!u.isAlive())
			{
				continue;
			}

			local d = _tile.getDistanceTo(u.getTile());

			if (d < ret)
			{
				d = ret;
			}
		}

		return ret;
	}

	function getTileToSpawnLocation( _maxTries = 10, _notOnTerrain = [], _minDistToSettlements = 7, _maxDistToSettlements = 1000, _maxDistanceToAllies = 1000, _minDistToEnemyLocations = 7, _minDistToAlliedLocations = 7, _nearTile = null, _minY = 0.0, _maxY = 1.0 )
	{
		local mapSize = this.World.getMapSize();
		local navSettings = this.World.getNavigator().createSettings();
		navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost;
		navSettings.RoadMult = 1.0;
		local used = [];
		local tries = 0;

		while (tries++ < _maxTries)
		{
			local x;
			local y;

			if (_nearTile != null)
			{
				x = this.Math.rand(this.Math.max(3, _nearTile.SquareCoords.X - 10), this.Math.min(mapSize.X - 3, _nearTile.SquareCoords.X + 10));
				y = this.Math.rand(this.Math.max(3, _nearTile.SquareCoords.Y - 10), this.Math.min(mapSize.Y - 4, _nearTile.SquareCoords.Y + 10));
			}
			else
			{
				x = this.Math.rand(3, mapSize.X - 3);
				y = this.Math.rand(this.Math.max(3, mapSize.Y * _minY), this.Math.min(mapSize.Y - 4, mapSize.Y * _maxY));
			}

			local tile = this.World.getTileSquare(x, y);

			if (used.find(tile.ID) != null)
			{
				continue;
			}

			used.push(tile.ID);

			if (tile.IsOccupied || tile.HasRoad || tile.HasRiver)
			{
				continue;
			}

			if (tile.Type == this.Const.World.TerrainType.Ocean || tile.Type == this.Const.World.TerrainType.Shore)
			{
				continue;
			}

			if (this.World.State.getPlayer() != null && this.World.State.getPlayer().getTile().getDistanceTo(tile) < 6)
			{
				continue;
			}

			local abort = false;

			foreach( t in _notOnTerrain )
			{
				if (tile.Type == t)
				{
					abort = true;
					break;
				}
			}

			if (abort)
			{
				continue;
			}

			for( local i = 0; i != 6; i = ++i )
			{
				if (!tile.hasNextTile(i))
				{
				}
				else
				{
					local next = tile.getNextTile(i);

					if (next.HasRoad || next.Type == this.Const.World.TerrainType.Ocean || _maxDistanceToAllies > 1000 && next.Type == this.Const.World.TerrainType.Shore)
					{
						abort = true;
						break;
					}
				}
			}

			if (abort)
			{
				continue;
			}

			local settlements = this.World.EntityManager.getSettlements();
			local dist = 1000;

			foreach( s in settlements )
			{
				local d = s.getTile().getDistanceTo(tile);

				if (d < dist)
				{
					dist = d;
				}
			}

			if (dist < _minDistToSettlements || dist > _maxDistToSettlements)
			{
				continue;
			}

			local locations = this.World.EntityManager.getLocations();

			if (_minDistToAlliedLocations != 0 || _minDistToEnemyLocations != 0)
			{
				foreach( v in locations )
				{
					local d = tile.getDistanceTo(v.getTile());

					if (v.getFaction() == this.m.Faction.getID() && d < _minDistToAlliedLocations || v.getFaction() != this.m.Faction.getID() && d < _minDistToEnemyLocations)
					{
						abort = true;
						break;
					}
				}

				if (abort)
				{
					continue;
				}
			}

			if (this.m.Faction.getSettlements().len() != 0 && _maxDistanceToAllies != 0 && _maxDistanceToAllies != 1000)
			{
				local dist = 1000;

				foreach( s in this.m.Faction.getSettlements() )
				{
					local d = s.getTile().getDistanceTo(tile);

					if (d < dist)
					{
						dist = d;
					}
				}

				for( ; dist > _maxDistanceToAllies;  )
				{
				}
			}

			for( local i = x - 3; i < x + 3; i = ++i )
			{
				for( local j = y - 3; j < y + 3; j = ++j )
				{
					if (!this.World.isValidTileSquare(i, j))
					{
					}
					else if (this.World.getTileSquare(i, j).HasRoad)
					{
						abort = true;
						break;
					}
				}
			}

			if (abort)
			{
				continue;
			}

			abort = true;

			foreach( v in locations )
			{
				if (v.isIsolated())
				{
					continue;
				}

				local path = this.World.getNavigator().findPath(tile, v.getTile(), navSettings, 0);

				if (!path.isEmpty())
				{
					abort = false;
					break;
				}
			}

			if (abort)
			{
				continue;
			}

			return tile;
		}

		return null;
	}

	function getAppropriateBanner( _for, _list, _maxDist, _alternativeBanners )
	{
		local best;
		local bestDist = 9000;
		local tile = _for.getTile();
		local alternativeBanners = clone _alternativeBanners;

		foreach( s in _list )
		{
			local d = s.getTile().getDistanceTo(tile);

			if (d < bestDist)
			{
				best = s;
				bestDist = d;
			}

			for( local i = 0; i != alternativeBanners.len(); i = ++i )
			{
				if (alternativeBanners[i] == s.getBanner())
				{
					alternativeBanners.remove(i);
					break;
				}
			}
		}

		if (best != null && bestDist <= _maxDist)
		{
			return best.getBanner();
		}
		else if (alternativeBanners.len() != 0)
		{
			return alternativeBanners[this.Math.rand(0, alternativeBanners.len() - 1)];
		}
		else
		{
			return best.getBanner();
		}
	}

	function getNearestLocationTo( _to, _list, _removeFromList = false )
	{
		local bestDist = 9000;
		local best;
		local bestIdx = 0;

		foreach( i, s in _list )
		{
			local d = _to.getTile().getDistanceTo(s.getTile());

			if (d < bestDist)
			{
				bestDist = d;
				best = s;
				bestIdx = i;
			}
		}

		if (_removeFromList && best != null)
		{
			_list.remove(bestIdx);
		}

		return best;
	}

	function getDistanceToSettlements( _from )
	{
		local settlements = this.World.EntityManager.getSettlements();
		local dist = 1000;

		foreach( s in settlements )
		{
			local d = _from.getDistanceTo(s.getTile());

			if (d < dist)
			{
				dist = d;
			}
		}

		return dist;
	}

	function pickWeightedRandom( _list )
	{
		local chance = 0;

		for( local i = 0; i < _list.len(); i = ++i )
		{
			chance = chance + _list[i].P;
		}

		local pick = this.Math.rand(1, chance);

		for( local i = 0; i < _list.len(); i = ++i )
		{
			if (pick <= _list[i].P)
			{
				return _list[i].D;
			}

			pick = pick - _list[i].P;
		}

		return null;
	}

	function getScaledDifficultyMult()
	{
		local s = this.Math.maxf(0.5, 0.6 * this.Math.pow(0.01 * this.World.State.getPlayer().getStrength(), 0.9));
		local d = this.Math.minf(4.0, s + this.Math.minf(1.0, this.World.getTime().Days * 0.01));
		return d * this.Const.Difficulty.EnemyMult[this.World.Assets.getCombatDifficulty()];
	}

	function getReputationToDifficultyLightMult()
	{
		local d = 1.0 + this.Math.minf(2.0, this.World.getTime().Days * 0.014) - 0.1;
		return d * this.Const.Difficulty.EnemyMult[this.World.Assets.getCombatDifficulty()];
	}

};

