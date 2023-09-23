this.ai_retreat <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		IsDone = false
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Retreat;
		this.m.Order = this.Const.AI.Behavior.Order.Retreat;
		this.m.IsThreaded = true;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		// Function is a generator.
		this.m.TargetTile = null;

		if ((this.Const.AI.NoRetreatMode || this.Tactical.State.getStrategicProperties() != null && this.Tactical.State.getStrategicProperties().IsArenaMode) && _entity.getFaction() != this.Const.Faction.Player)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getActionPoints() < this.Const.Movement.AutoEndTurnBelowAP)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getCurrentProperties().IsRooted)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.m.IsDone)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getTile().hasZoneOfControlOtherThan(_entity.getAlliedFactions()) && _entity.getFaction() != this.Const.Faction.Player)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getType() == this.Const.EntityType.Lindwurm && _entity.getTile().getDistanceTo(_entity.getTail().getTile()) > 1)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local score = this.getProperties().BehaviorMult[this.m.ID];

		if (_entity.getFaction() != this.Const.Faction.Player)
		{
			local allyInstances = 0.0;
			local allyInstancesMax = 0.0;
			local hostileInstances = 0.0;

			foreach( i, faction in this.Tactical.Entities.getAllInstances() )
			{
				if (faction.len() == 0)
				{
					continue;
				}

				if (i == _entity.getFaction() || _entity.isAlliedWith(i))
				{
					foreach( e in faction )
					{
						if (e.getXPValue() > 0)
						{
							allyInstances = allyInstances + 1.0;
						}
					}
				}
				else
				{
					hostileInstances = hostileInstances + faction.len() * 1.0;
				}
			}

			foreach( i, numPerFaction in this.Tactical.Entities.getAllInstancesMax() )
			{
				if (i == _entity.getFaction() || _entity.isAlliedWith(i))
				{
					allyInstancesMax = allyInstancesMax + numPerFaction;
				}
			}

			if (_entity.getBaseProperties().Bravery != 0 && allyInstances / allyInstancesMax >= this.Const.AI.Behavior.RetreatMinAllyRatio)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			if (_entity.getBaseProperties().Bravery != 0 && allyInstances >= hostileInstances)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			score = score * (1.0 + this.Const.AI.Behavior.RetreatMinAllyRatio - allyInstances / allyInstancesMax);
		}

		if (this.isAtMapBorder(_entity))
		{
			score = score * this.Const.AI.Behavior.RetreatAtMapBorderMult;
		}
		else
		{
			local func = this.findRetreatToPosition(_entity);

			while (resume func == null)
			{
				yield null;
			}

			if (this.m.TargetTile == null)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}
		}

		if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			score = score * this.Const.AI.Behavior.RetreatFleeingMult;
		}

		if (_entity.getBaseProperties().Bravery == 0)
		{
			score = score * 10.0;
		}

		return this.Const.AI.Behavior.Score.Retreat * score;
	}

	function onTurnStarted()
	{
		this.m.IsDone = false;
	}

	function onTurnResumed()
	{
		this.m.IsDone = false;
	}

	function onExecute( _entity )
	{
		if (this.m.TargetTile == null && this.isAtMapBorder(_entity))
		{
			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + this.getAgent().getActor().getName() + ": Retreated!");
			}

			this.getAgent().setFinished(true);
			_entity.retreat();
			return true;
		}

		if (this.m.TargetTile != null)
		{
			local navigator = this.Tactical.getNavigator();

			if (this.m.IsFirstExecuted)
			{
				this.getAgent().getOrders().IsRetreating = true;
				local settings = navigator.createSettings();
				settings.ActionPointCosts = _entity.getActionPointCosts();
				settings.FatigueCosts = _entity.getFatigueCosts();
				settings.FatigueCostFactor = this.Const.Movement.FatigueCostFactor;
				settings.ActionPointCostPerLevel = _entity.getLevelActionPointCost();
				settings.FatigueCostPerLevel = _entity.getLevelFatigueCost();
				settings.AllowZoneOfControlPassing = true;
				settings.ZoneOfControlCost = this.Const.AI.Behavior.ZoneOfControlAPPenalty * 4;
				settings.AlliedFactions = _entity.getAlliedFactions();
				settings.Faction = _entity.getFaction();

				if (this.Const.AI.VerboseMode)
				{
					this.logInfo("* " + this.getAgent().getActor().getName() + ": Retreating.");
				}

				navigator.findPath(_entity.getTile(), this.m.TargetTile, settings, 0);

				if (this.Const.AI.PathfindingDebugMode)
				{
					navigator.buildVisualisation(_entity, settings, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue());
				}

				local movement = navigator.getCostForPath(_entity, settings, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue());
				this.m.Agent.adjustCameraToDestination(movement.End);
				this.m.IsFirstExecuted = false;
			}

			if (!navigator.travel(_entity, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue()))
			{
				if (_entity.isAlive())
				{
					if (this.isAtMapBorder(_entity))
					{
						if (this.Const.AI.VerboseMode)
						{
							this.logInfo("* " + this.getAgent().getActor().getName() + ": Retreated!");
						}

						this.getAgent().setFinished(true);
						_entity.retreat();
					}
					else if (!_entity.isHiddenToPlayer())
					{
						this.getAgent().declareAction();
					}
				}

				this.m.TargetTile = null;
				this.m.IsDone = true;
			}
			else
			{
				return false;
			}
		}

		if (_entity.getActionPoints() < this.Const.Movement.AutoEndTurnBelowAP)
		{
			this.getAgent().setFinished(true);
		}

		return true;
	}

	function isAtMapBorder( _entity )
	{
		local myTile = _entity.getTile();

		for( local i = 0; i < 6; i = i )
		{
			if (!myTile.hasNextTile(i))
			{
				return true;
			}

			i = ++i;
		}

		return false;
	}

	function findRetreatToPosition( _entity )
	{
		// Function is a generator.
		local time = this.Time.getExactTime();
		local myTile = _entity.getTile();
		local targets = [];
		local opponents = [];
		local mapSize = this.Tactical.getMapSize();
		local instances = this.Tactical.Entities.getAllInstances();
		local myTile = _entity.getTile();
		local dirs = [
			0,
			0,
			0,
			0,
			0,
			0
		];

		for( local i = 1; i < instances.len(); i = i )
		{
			if (_entity.getAlliedFactions().find(i) != null)
			{
			}
			else
			{
				foreach( opponent in instances[i] )
				{
					if (myTile.getDistanceTo(opponent.getTile()) <= 20 && !this.isKindOf(opponent, "alp"))
					{
						opponents.push(opponent);
					}

					local dir = myTile.getDirection8To(opponent.getTile());

					switch(dir)
					{
					case this.Const.Direction8.W:
						dirs[this.Const.Direction.NW] += 4;
						dirs[this.Const.Direction.SW] += 4;
						break;

					case this.Const.Direction8.E:
						dirs[this.Const.Direction.NE] += 4;
						dirs[this.Const.Direction.SE] += 4;
						break;

					default:
						local dir = myTile.getDirectionTo(opponent.getTile());
						local dir_left = dir - 1 >= 0 ? dir - 1 : 6 - 1;
						local dir_right = dir + 1 < 6 ? dir + 1 : 0;
						dirs[dir] += 4;
						dirs[dir_left] += 3;
						dirs[dir_right] += 3;
						break;
					}
				}
			}

			i = ++i;
		}

		local ap = _entity.getActionPoints();

		for( local y = 0; y < mapSize.Y; y = y )
		{
			local tile = this.Tactical.getTileSquare(mapSize.X - 1, y);

			if (tile.IsEmpty)
			{
				local d = myTile.getDistanceTo(tile);
				targets.push({
					Tile = tile,
					Score = d * 2 <= ap ? 0 : d,
					Dir = d * 2 <= ap ? 0 : dirs[myTile.getDirectionTo(tile)]
				});
			}

			y = ++y;
		}

		for( local y = 0; y < mapSize.Y; y = y )
		{
			local tile = this.Tactical.getTileSquare(0, y);

			if (tile.IsEmpty)
			{
				local d = myTile.getDistanceTo(tile);
				targets.push({
					Tile = tile,
					Score = d * 2 <= ap ? 0 : d,
					Dir = d * 2 <= ap ? 0 : dirs[myTile.getDirectionTo(tile)]
				});
			}

			y = ++y;
		}

		for( local x = 1; x < mapSize.X - 1; x = x )
		{
			local tile = this.Tactical.getTileSquare(x, mapSize.Y - 1);

			if (tile.IsEmpty)
			{
				local d = myTile.getDistanceTo(tile);
				targets.push({
					Tile = tile,
					Score = d * 2 <= ap ? 0 : d,
					Dir = d * 2 <= ap ? 0 : dirs[myTile.getDirectionTo(tile)]
				});
			}

			x = ++x;
		}

		for( local x = 1; x < mapSize.X - 1; x = x )
		{
			local tile = this.Tactical.getTileSquare(x, 0);

			if (tile.IsEmpty)
			{
				local d = myTile.getDistanceTo(tile);
				targets.push({
					Tile = tile,
					Score = d * 2 <= ap ? 0 : d,
					Dir = d * 2 <= ap ? 0 : dirs[myTile.getDirectionTo(tile)]
				});
			}

			x = ++x;
		}

		targets.sort(this.onSortByLowestScore);
		local navigator = this.Tactical.getNavigator();
		local attempts = 0;
		local bestTarget;
		local bestCost = 9000;
		local bestDanger = 9000;

		foreach( target in targets )
		{
			attempts = ++attempts;
			attempts = attempts;

			if (attempts > this.Const.AI.Behavior.RetreatSoftMaxAttempts && (bestDanger == 0 || attempts > this.Const.AI.Behavior.RetreatHardMaxAttempts))
			{
				break;
			}

			if (this.isAllottedTimeReached(time))
			{
				yield null;
				time = this.Time.getExactTime();
			}

			local settings = navigator.createSettings();
			settings.ActionPointCosts = _entity.getActionPointCosts();
			settings.FatigueCosts = _entity.getFatigueCosts();
			settings.FatigueCostFactor = this.Const.Movement.FatigueCostFactor;
			settings.ActionPointCostPerLevel = _entity.getLevelActionPointCost();
			settings.FatigueCostPerLevel = _entity.getLevelFatigueCost();
			settings.AllowZoneOfControlPassing = true;
			settings.ZoneOfControlCost = this.Const.AI.Behavior.ZoneOfControlAPPenalty * 4;
			settings.AlliedFactions = _entity.getAlliedFactions();
			settings.Faction = _entity.getFaction();
			settings.HeatCost = this.getAgent().isUsingHeat() ? this.Const.AI.Behavior.EngageHeatCost : 0;

			if (!navigator.findPath(myTile, target.Tile, settings, 0))
			{
				continue;
			}

			local movementCosts = navigator.getCostForPath(_entity, settings, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue());

			if (movementCosts.Tiles == 0 || movementCosts.End.isSameTileAs(myTile))
			{
				continue;
			}

			if (movementCosts.ActionPointsRequired <= bestCost && (movementCosts.End.Coords.X == 0 || movementCosts.End.Coords.Y == 0 || movementCosts.End.Coords.X == mapSize.X - 1 || movementCosts.End.Coords.Y == mapSize.Y - 1))
			{
				bestTarget = target.Tile;
				bestCost = movementCosts.ActionPointsRequired;
				bestDanger = 0;
				continue;
			}

			if (movementCosts.ActionPointsRequired <= bestCost || bestDanger > 0)
			{
				local danger = 0.0;

				if (!movementCosts.IsComplete)
				{
					foreach( opponent in opponents )
					{
						local turns = this.queryActorTurnsNearTarget(opponent, movementCosts.End, _entity);

						if (turns.Turns <= 2.0)
						{
							danger = danger + (2.0 - turns.Turns);
						}

						if (turns.Turns <= 1.0)
						{
							danger = danger + 1.0;
						}
					}
				}

				if (danger < bestDanger || danger <= bestDanger && movementCosts.ActionPointsRequired < bestCost)
				{
					bestTarget = target.Tile;
					bestCost = movementCosts.ActionPointsRequired;
					bestDanger = danger;
				}
			}
		}

		if (bestTarget != null)
		{
			this.m.TargetTile = bestTarget;
		}

		return true;
	}

	function onSortByLowestScore( _d1, _d2 )
	{
		if (_d1.Dir > _d2.Dir)
		{
			return 1;
		}
		else if (_d1.Dir < _d2.Dir)
		{
			return -1;
		}
		else
		{
			if (_d1.Score > _d2.Score)
			{
				return 1;
			}
			else if (_d1.Score < _d2.Score)
			{
				return -1;
			}

			return 0;
		}
	}

});

