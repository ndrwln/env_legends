this.ai_roam <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Roam;
		this.m.Order = this.Const.AI.Behavior.Order.Roam;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.TargetTile = null;
		local scoreMult = this.getProperties().BehaviorMult[this.m.ID];

		if (!this.Tactical.State.isScenarioMode())
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

		if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.getAgent().hasKnownOpponent())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getTile().hasZoneOfControlOtherThan(_entity.getAlliedFactions()))
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.TargetTile = this.findRandomPosition(_entity);

		if (this.m.TargetTile != null && this.Math.rand(1, 100) <= this.Const.AI.Behavior.RoamChance)
		{
			return this.Const.AI.Behavior.Score.Roam * scoreMult;
		}

		return this.Const.AI.Behavior.Score.Zero;
	}

	function onBeforeExecute( _entity )
	{
		this.getAgent().getOrders().IsEngaging = false;
		this.getAgent().getOrders().IsDefending = false;
	}

	function onExecute( _entity )
	{
		local navigator = this.Tactical.getNavigator();

		if (this.m.IsFirstExecuted)
		{
			local settings = navigator.createSettings();
			settings.ActionPointCosts = _entity.getActionPointCosts();
			settings.FatigueCosts = _entity.getFatigueCosts();
			settings.FatigueCostFactor = this.Const.Movement.FatigueCostFactor;
			settings.ActionPointCostPerLevel = _entity.getLevelActionPointCost();
			settings.FatigueCostPerLevel = _entity.getLevelFatigueCost();
			settings.Faction = _entity.getFaction();

			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + _entity.getName() + ": Roaming.");
			}

			navigator.findPath(_entity.getTile(), this.m.TargetTile, settings, 0);

			if (this.Const.AI.PathfindingDebugMode)
			{
				navigator.buildVisualisation(_entity, settings, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue());
			}

			local movement = navigator.getCostForPath(_entity, settings, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue());
			this.m.Agent.adjustCameraToDestination(movement.End);
			this.m.IsFirstExecuted = false;
			return;
		}

		if (!navigator.travel(_entity, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue()))
		{
			this.m.TargetTile = null;
			return true;
		}

		return false;
	}

	function findRandomPosition( _entity )
	{
		local navigator = this.Tactical.getNavigator();
		local settings = navigator.createSettings();
		settings.ActionPointCosts = _entity.getActionPointCosts();
		settings.FatigueCosts = _entity.getFatigueCosts();
		settings.FatigueCostFactor = this.Const.Movement.FatigueCostFactor;
		settings.ActionPointCostPerLevel = _entity.getLevelActionPointCost();
		settings.FatigueCostPerLevel = _entity.getLevelFatigueCost();
		settings.Faction = _entity.getFaction();
		settings.HiddenCost = this.getProperties().OverallHideMult >= 1 ? -1 : 0;
		local currentTile = _entity.getTile();
		local currentTries = 0;

		while (currentTries++ < this.Const.AI.Behavior.RoamMaxAttempts)
		{
			local x = currentTile.X;
			local y = currentTile.Y + x / 2;
			local dirX = this.Math.rand(-this.Const.AI.Behavior.RoamMaxRange, this.Const.AI.Behavior.RoamMaxRange);
			local dirY = this.Math.rand(-this.Const.AI.Behavior.RoamMaxRange, this.Const.AI.Behavior.RoamMaxRange);
			x = x + dirX;
			y = y + dirY;
			y = y - x / 2;

			if (!this.Tactical.isValidTile(x, y))
			{
				continue;
			}

			local tile = this.Tactical.getTile(x, y);

			if (!tile.IsEmpty || tile.Type == this.Const.Tactical.TerrainType.Impassable)
			{
				continue;
			}

			if (navigator.findPath(_entity.getTile(), tile, settings, 0))
			{
				local movementCosts = navigator.getCostForPath(_entity, settings, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue());

				if (movementCosts.Tiles == 0)
				{
					continue;
				}

				return tile;
			}
		}

		return null;
	}

});

