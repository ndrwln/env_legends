this.ai_retreat_always <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.RetreatAlways;
		this.m.Order = this.Const.AI.Behavior.Order.RetreatAlways;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.TargetTile = null;

		if (_entity.getCurrentProperties().IsRooted)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (!this.isAtMapBorder(_entity))
		{
			this.findRetreatToPosition(_entity);

			if (this.m.TargetTile == null)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}
		}

		return this.Const.AI.Behavior.Score.Flee;
	}

	function onExecute( _entity )
	{
		if (this.m.TargetTile == null && (this.isAtMapBorder(_entity) || _entity.isHiddenToPlayer()))
		{
			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + this.getAgent().getActor().getName() + ": Retreated!");
			}

			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(this.getAgent().getActor()) + " has retreated from battle");
			this.getAgent().setFinished(true);
			_entity.retreat();
			return true;
		}

		if (this.m.TargetTile != null)
		{
			local navigator = this.Tactical.getNavigator();

			if (this.m.IsFirstExecuted)
			{
				local settings = navigator.createSettings();
				settings.ActionPointCosts = _entity.getActionPointCosts();
				settings.FatigueCosts = _entity.getFatigueCosts();
				settings.FatigueCostFactor = 0.0;
				settings.ActionPointCostPerLevel = _entity.getLevelActionPointCost();
				settings.FatigueCostPerLevel = _entity.getLevelFatigueCost();
				settings.AllowZoneOfControlPassing = false;
				settings.ZoneOfControlCost = this.Const.AI.Behavior.ZoneOfControlAPPenalty;
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
					if (this.isAtMapBorder(_entity) || _entity.isHiddenToPlayer())
					{
						if (this.Const.AI.VerboseMode)
						{
							this.logInfo("* " + this.getAgent().getActor().getName() + ": Retreated!");
						}

						this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(this.getAgent().getActor()) + " has retreated from battle");
						this.getAgent().setFinished(true);
						_entity.retreat();
					}
					else if (!_entity.isHiddenToPlayer())
					{
						this.getAgent().declareAction();
					}
				}

				this.m.TargetTile = null;
			}
			else
			{
				return false;
			}
		}

		this.getAgent().setFinished(true);
		return true;
	}

	function isAtMapBorder( _entity )
	{
		local myTile = _entity.getTile();

		for( local i = 0; i < 6; i = ++i )
		{
			if (!myTile.hasNextTile(i))
			{
				return true;
			}
		}

		return false;
	}

	function findRetreatToPosition( _entity )
	{
		local myTile = _entity.getTile();
		local targets = [];
		local mapSize = this.Tactical.getMapSize();

		if (myTile.SquareCoords.X > mapSize.X / 2)
		{
			for( local y = 0; y < mapSize.Y; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(mapSize.X - 1, y);

				if (tile.IsEmpty)
				{
					targets.push({
						Tile = tile,
						Score = myTile.getDistanceTo(tile)
					});
				}
			}
		}
		else
		{
			for( local y = 0; y < mapSize.Y; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(0, y);

				if (tile.IsEmpty)
				{
					targets.push({
						Tile = tile,
						Score = myTile.getDistanceTo(tile)
					});
				}
			}
		}

		if (myTile.SquareCoords.Y > mapSize.Y / 2)
		{
			for( local x = 0; x < mapSize.X; x = ++x )
			{
				local tile = this.Tactical.getTileSquare(x, mapSize.Y - 1);

				if (tile.IsEmpty)
				{
					targets.push({
						Tile = tile,
						Score = myTile.getDistanceTo(tile)
					});
				}
			}
		}
		else
		{
			for( local x = 0; x < mapSize.X; x = ++x )
			{
				local tile = this.Tactical.getTileSquare(x, 0);

				if (tile.IsEmpty)
				{
					targets.push({
						Tile = tile,
						Score = myTile.getDistanceTo(tile)
					});
				}
			}
		}

		targets.sort(this.onSortByLowestScore);
		local navigator = this.Tactical.getNavigator();
		local settings = navigator.createSettings();
		settings.ActionPointCosts = _entity.getActionPointCosts();
		settings.FatigueCosts = _entity.getFatigueCosts();
		settings.FatigueCostFactor = 0.0;
		settings.ActionPointCostPerLevel = _entity.getLevelActionPointCost();
		settings.FatigueCostPerLevel = _entity.getLevelFatigueCost();
		settings.AllowZoneOfControlPassing = false;
		settings.ZoneOfControlCost = this.Const.AI.Behavior.ZoneOfControlAPPenalty;
		settings.AlliedFactions = _entity.getAlliedFactions();
		settings.Faction = _entity.getFaction();
		local attempts = 0;
		local bestTarget;
		local bestCost = 9000;

		foreach( target in targets )
		{
			attempts = ++attempts;

			if (attempts > this.Const.AI.Behavior.RetreatSoftMaxAttempts)
			{
				break;
			}

			if (!navigator.findPath(myTile, target.Tile, settings, 0))
			{
				continue;
			}

			local movementCosts = navigator.getCostForPath(_entity, settings, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue());

			if (movementCosts.Tiles == 0 || movementCosts.End.isSameTileAs(myTile))
			{
				continue;
			}

			if (movementCosts.ActionPointsRequired < bestCost)
			{
				bestTarget = target.Tile;
				bestCost = movementCosts.ActionPointsRequired;
			}
		}

		if (bestTarget != null)
		{
			this.m.TargetTile = bestTarget;
		}
	}

	function onSortByLowestScore( _d1, _d2 )
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

});

