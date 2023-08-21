this.ai_hide <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		TargetInfo = null,
		IsHoldingPosition = false,
		Inertia = 0
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Hide;
		this.m.Order = this.Const.AI.Behavior.Order.Hide;
		this.m.IsThreaded = true;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		// Function is a generator.
		this.m.TargetTile = null;
		this.m.TargetInfo = null;
		this.m.IsHoldingPosition = false;
		local score = this.getProperties().BehaviorMult[this.m.ID];

		if (_entity.getActionPoints() < this.Const.Movement.AutoEndTurnBelowAP)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.queryTargetsInMeleeRange(this.getProperties().EngageRangeMin, this.getProperties().EngageRangeMax).len() != 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.getAgent().getIntentions().IsRecuperating)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local func = this.selectBestTargetTile(_entity, this.Const.AI.Behavior.HideMaxSearchRange);

		while (resume func == null)
		{
			yield null;
		}

		if (this.m.TargetTile == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		score = score * this.Math.maxf(1.0, this.Math.minf(this.Const.AI.Behavior.HideInertiaMaxMult, this.m.Inertia * this.Const.AI.Behavior.HideInertiaMult));
		this.logWarning("hide after inertia: " + score);
		score = score * (1.0 - _entity.getTile().getDistanceTo(this.m.TargetTile) / (this.Const.AI.Behavior.HideMaxSearchRange + 1.0));
		this.logWarning("hide after distance?: " + score);
		score = score * (1.0 - this.Const.AI.Behavior.HideTerrainValueMult + this.Math.maxf(0.0, this.m.TargetTile.TVTotal / 14.0) * this.Const.AI.Behavior.HideTerrainValueMult);
		this.logWarning("hide after tactical value?: " + score);
		local myTile = _entity.getTile();
		local allies = this.queryAllyMagnitude(myTile, this.Const.AI.Behavior.HideMaxOpponentToAllyDistance);
		local opponents = this.queryOpponentMagnitude(myTile, this.Const.AI.Behavior.HideMaxOpponentToAllyDistance);

		if (opponents.Opponents != 0 && this.m.TargetInfo.Allies.Allies != 0)
		{
			score = score * this.Math.minf(2.0, opponents.Opponents * opponents.AverageDistanceScore / (allies.Allies * allies.AverageDistanceScore));
		}

		this.logWarning("hide after numbers advantage?: " + score);
		score = score * (1.0 - this.Const.AI.Behavior.HideBreakBecauseOpponentCloseMult + opponents.AverageDistanceScore * this.Const.AI.Behavior.HideBreakBecauseOpponentCloseMult);
		this.logWarning("hide after opponent close enough?: " + score);
		local engagedPct = this.Math.maxf(allies.AverageEngaged, opponents.AverageEngaged);
		local engagedMult = this.Math.pow(2 - engagedPct, 5) / this.Math.pow(2, 5);
		score = score * engagedMult;
		this.logWarning("hide after everyone engaged?: " + score);
		this.m.IsHoldingPosition = _entity.getTile().isSameTileAs(this.m.TargetTile);

		if (this.m.IsHoldingPosition && this.getAgent().getIntentions().IsRecuperating)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		return this.Const.AI.Behavior.Score.Hide * score * this.getProperties().OverallHideMult;
	}

	function onTurnStarted()
	{
		this.m.Inertia = this.Math.maxf(0, this.m.Inertia - 1);
	}

	function onBeforeExecute( _entity )
	{
		this.getAgent().getOrders().IsEngaging = false;
		this.getAgent().getOrders().IsDefending = false;
		this.getAgent().getIntentions().IsDefendingPosition = false;
		this.getAgent().getIntentions().IsEngaging = false;
		this.getAgent().getIntentions().IsHiding = true;
		this.m.Inertia += 2;
	}

	function onExecute( _entity )
	{
		if (!this.m.IsHoldingPosition)
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
				navigator.findPath(_entity.getTile(), this.m.TargetTile, settings, 0);

				if (this.Const.AI.PathfindingDebugMode)
				{
					navigator.buildVisualisation(_entity, settings, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue());
				}

				local movement = navigator.getCostForPath(_entity, settings, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue());

				if (movement.Tiles == 0)
				{
					this.getAgent().getIntentions().IsRecuperating = true;
					return true;
				}

				this.m.Agent.adjustCameraToDestination(movement.End);

				if (this.Const.AI.VerboseMode)
				{
					this.logInfo("* " + _entity.getName() + ": Hiding!");
				}

				this.m.IsFirstExecuted = false;
				return;
			}

			if (!navigator.travel(_entity, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue()))
			{
				this.m.TargetTile = null;
				this.m.TargetInfo = null;
				return true;
			}
		}
		else
		{
			this.getAgent().getIntentions().IsRecuperating = true;

			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + _entity.getName() + ": Holding hidden position.");
			}

			return true;
		}

		return false;
	}

	function selectBestTargetTile( _entity, _maxRange )
	{
		// Function is a generator.
		local navigator = this.Tactical.getNavigator();
		local settings = navigator.createSettings();
		local myTile = _entity.getTile();
		local myFaction = _entity.getFaction();
		local tiles = {
			Behavior = this,
			Actor = _entity,
			Origin = myTile,
			Range = _maxRange,
			Tiles = []
		};
		this.onQueryTargetTile(_entity.getTile(), tiles);
		yield null;
		this.Tactical.queryTilesInRange(_entity.getTile(), 1, _maxRange, true, 0, _entity.getAlliedFactions(), this.onQueryTargetTile, tiles);
		yield null;
		tiles.Tiles.sort(this.onSortByScore);
		local attempts = 0;
		local time = this.Time.getExactTime();
		local bestDestination;
		local bestDestinationInfo;
		local bestScore = -9000;

		foreach( t in tiles.Tiles )
		{
			if (this.isAllottedTimeReached(time))
			{
				yield null;
				time = this.Time.getExactTime();
			}

			local apCost = 0;
			local finalTile = t.Tile;
			attempts = ++attempts;

			if (attempts > this.Const.AI.Behavior.HideMaxAttempts)
			{
				break;
			}

			if (!t.Tile.isSameTileAs(_entity.getTile()))
			{
				settings.ActionPointCosts = _entity.getActionPointCosts();
				settings.FatigueCosts = _entity.getFatigueCosts();
				settings.FatigueCostFactor = 0.0;
				settings.ActionPointCostPerLevel = _entity.getLevelActionPointCost();
				settings.FatigueCostPerLevel = _entity.getLevelFatigueCost();
				settings.AllowZoneOfControlPassing = false;
				settings.ZoneOfControlCost = this.Const.AI.Behavior.ZoneOfControlAPPenalty;
				settings.AlliedFactions = _entity.getAlliedFactions();
				settings.Faction = _entity.getFaction();

				if (navigator.findPath(_entity.getTile(), t.Tile, settings, 0))
				{
					local movementCosts = navigator.getCostForPath(_entity, settings, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue());
					apCost = apCost + movementCosts.ActionPointsRequired;
					finalTile = movementCosts.End;
				}
				else
				{
					continue;
				}
			}

			local score = -apCost + t.ScoreBonus;

			if (score > bestScore)
			{
				bestDestination = t.Tile;
				bestDestinationInfo = t;
				bestScore = score;
			}
		}

		if (bestDestination)
		{
			if (this.Const.AI.VerboseMode && bestDestination.isSameTileAs(_entity.getTile()))
			{
				this.logInfo("* " + _entity.getName() + ": In fact, I would prefer to remain where I am");
			}

			this.m.TargetInfo = bestDestinationInfo;
			this.m.TargetTile = bestDestination;
			return true;
		}

		return false;
	}

	function onQueryTargetTile( _tile, _tag )
	{
		if (!_tile.IsHidingEntity || _tile.IsVisibleForPlayer && !this.Const.AI.SecretSpectatorMode)
		{
			return;
		}

		local dist = _tile.getDistanceTo(_tag.Origin);
		local score = _tile.Level * 2.0 + _tile.TVTotal - dist * 2.0;
		local scoreBonus = _tile.TVTotal * this.Const.AI.Behavior.DefendTerrainValueMult;
		local allies = _tag.Behavior.queryAllyMagnitude(_tile, this.Const.AI.Behavior.HideMaxOpponentToAllyDistance);
		score = score + allies.Allies * allies.AverageDistanceScore * _tag.Behavior.getProperties().OverallFormationMult;
		scoreBonus = scoreBonus + allies.Allies * allies.AverageDistanceScore * _tag.Behavior.getProperties().OverallFormationMult;
		local opponents = _tag.Behavior.queryOpponentMagnitude(_tile, this.Const.AI.Behavior.HideMaxOpponentToAllyDistance);
		score = score - opponents.Opponents * opponents.AverageDistanceScore * this.Const.AI.Behavior.HideOpponentImportanceMult;
		scoreBonus = scoreBonus - opponents.Opponents * opponents.AverageDistanceScore * this.Const.AI.Behavior.HideOpponentImportanceMult;
		_tag.Tiles.push({
			Tile = _tile,
			Score = score,
			ScoreBonus = scoreBonus,
			Allies = allies,
			Opponents = opponents
		});
	}

	function onSortByScore( _a, _b )
	{
		if (_a.Score > _b.Score)
		{
			return -1;
		}
		else if (_a.Score < _b.Score)
		{
			return 1;
		}

		return 0;
	}

});

