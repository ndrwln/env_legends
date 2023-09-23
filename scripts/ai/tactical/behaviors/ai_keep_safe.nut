this.ai_keep_safe <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		TargetDanger = 0.0,
		IsTargetForNextTurn = false,
		IsTargetNextToUs = false,
		IsInDangerThisRound = false,
		Inertia = 0
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.KeepSafe;
		this.m.Order = this.Const.AI.Behavior.Order.KeepSafe;
		this.m.IsThreaded = true;
		this.behavior.create();
	}

	function onTurnStarted()
	{
		this.m.IsInDangerThisRound = false;
	}

	function onEvaluate( _entity )
	{
		// Function is a generator.
		this.m.TargetTile = null;
		this.m.TargetDanger = 0;
		this.m.IsTargetNextToUs = false;
		this.m.IsTargetForNextTurn = false;
		local scoreMult = this.getProperties().BehaviorMult[this.m.ID];

		if (scoreMult == 0.0)
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

		if (!this.getAgent().hasKnownOpponent())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.getAgent().getIntentions().IsEngaging)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local targets = this.queryTargetsInMeleeRange();

		if (targets.len() != 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local potentialDanger = this.getPotentialDanger(true);
		local currentDanger = 0.0;
		local myTile = _entity.getTile();
		yield null;

		foreach( t in potentialDanger )
		{
			local danger = this.getDangerFromActor(t, myTile, _entity);
			currentDanger = currentDanger + danger;
		}

		yield null;
		scoreMult = scoreMult * this.Math.maxf(1.0, this.Math.minf(this.Const.AI.Behavior.DefendInertiaMaxMult, this.m.Inertia * this.Const.AI.Behavior.DefendInertiaMult));
		this.m.IsInDangerThisRound = this.m.IsInDangerThisRound && potentialDanger.len() != 0 || currentDanger != 0;
		local func = this.selectBestTargetTile(_entity, this.Const.AI.Behavior.KeepSafeMaxRange, potentialDanger, currentDanger);

		while (resume func == null)
		{
			yield null;
		}

		if (this.m.TargetTile == null || this.m.IsTargetForNextTurn || this.m.TargetTile.isSameTileAs(_entity.getTile()) || !this.m.TargetTile.IsEmpty || this.m.TargetDanger >= currentDanger)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		scoreMult = scoreMult * this.Math.maxf(this.getProperties().OverallDefensivenessMult * 0.5, this.Math.maxf(1.0, currentDanger * 0.25) / this.Math.maxf(1.0, this.m.TargetDanger * 0.25));

		if (_entity.getAttackedCount() > 1)
		{
			scoreMult = scoreMult * (_entity.getAttackedCount() * this.Const.AI.Behavior.KeepSafeOverwhelmMult);
		}

		return this.Const.AI.Behavior.Score.KeepSafe * scoreMult * this.getProperties().OverallDefensivenessMult;
	}

	function onTurnStarted()
	{
		this.m.Inertia = this.Math.maxf(0, this.m.Inertia - 1);
	}

	function onBeforeExecute( _entity )
	{
		this.getAgent().getOrders().IsEngaging = false;
		this.getAgent().getOrders().IsDefending = true;
		this.getAgent().getIntentions().IsDefendingPosition = true;
		this.getAgent().getIntentions().IsEngaging = false;
		this.m.Inertia += 2;
	}

	function onExecute( _entity )
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
			this.m.Agent.adjustCameraToDestination(movement.End);

			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + _entity.getName() + ": Moving into safer position");
			}

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

	function getDangerFromActor( _actor, _target, _entity )
	{
		local d = this.queryActorTurnsNearTarget(_actor, _target, _entity);

		if (d.Turns <= this.Const.AI.Behavior.RangedEngageKeepMinTurnsAway)
		{
			if (d.InZonesOfControl != 0 || _actor.getCurrentProperties().IsStunned)
			{
				return 1.0;
			}
			else
			{
				return 2.0 + (1.0 - d.Turns) * 2.0;
			}
		}
		else
		{
			return 0.0;
		}
	}

	function selectBestTargetTile( _entity, _maxRange, _potentialDanger, _currentDanger )
	{
		// Function is a generator.
		local navigator = this.Tactical.getNavigator();
		local settings = navigator.createSettings();
		local myTile = _entity.getTile();
		local myFaction = _entity.getFaction();
		local tiles = {
			Actor = _entity,
			Origin = _entity.getTile(),
			Behavior = this,
			Range = _maxRange,
			IsInDanger = _currentDanger != 0,
			Tiles = []
		};
		this.onQueryTargetTile(_entity.getTile(), tiles);
		this.Tactical.queryTilesInRange(_entity.getTile(), 1, _maxRange, true, _entity.getAlliedFactions(), this.onQueryTargetTile, tiles);
		yield null;
		tiles.Tiles.sort(this.onSortByScore);
		local attempts = 0;
		local time = this.Time.getExactTime();
		local knownOpponents = this.getAgent().getKnownOpponents();
		local bestDestination;
		local bestScore = 9000;
		local bestDanger = 0;
		local bestIsNextToUs = false;
		local bestIsForNextTurn = false;
		local actionPointCosts = _entity.getActionPointCosts();
		local fatiguePointCosts = _entity.getFatigueCosts();

		foreach( t in tiles.Tiles )
		{
			if (this.isAllottedTimeReached(time))
			{
				yield null;
				time = this.Time.getExactTime();
			}

			if (!t.Tile.isSameTileAs(_entity.getTile()) && !t.Tile.IsEmpty)
			{
				continue;
			}

			local IsNextToUs = false;
			local IsForNextTurn = false;
			local apCost = 0;
			local finalTile = t.Tile;
			attempts = ++attempts;

			if (attempts > this.Const.AI.Behavior.KeepSafeMaxAttempts)
			{
				break;
			}

			local danger = 0;
			local skip = false;

			if (!t.Tile.isSameTileAs(_entity.getTile()))
			{
				settings.ActionPointCosts = actionPointCosts;
				settings.FatigueCosts = fatiguePointCosts;
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

					if (!movementCosts.IsComplete && movementCosts.Tiles == 0)
					{
						IsForNextTurn = true;
					}
					else if (movementCosts.IsComplete && movementCosts.Tiles <= 2)
					{
						IsNextToUs = true;
					}
					else
					{
						IsNextToUs = false;
					}
				}
				else
				{
					continue;
				}

				foreach( d in _potentialDanger )
				{
					if (finalTile.isSameTileAs(t.Tile))
					{
						danger = danger + this.getDangerFromActor(d, finalTile, _entity);
					}
					else
					{
						danger = danger + this.Math.maxf(this.getDangerFromActor(d, finalTile, _entity), this.getDangerFromActor(d, t.Tile, _entity));
					}
				}
			}
			else
			{
				danger = _currentDanger;
			}

			if (danger > _currentDanger)
			{
				continue;
			}

			if (skip)
			{
				continue;
			}

			local score = apCost - t.ScoreBonus + danger * this.Const.AI.Behavior.KeepSafeDangerMult;

			if (score < bestScore || score == bestScore && danger < bestDanger)
			{
				bestDestination = t.Tile;
				bestIsNextToUs = IsNextToUs;
				bestIsForNextTurn = IsForNextTurn;
				bestDanger = danger;
				bestScore = score;
			}
		}

		if (bestDestination)
		{
			if (this.Const.AI.VerboseMode && bestDestination.isSameTileAs(_entity.getTile()))
			{
				this.logInfo("* " + _entity.getName() + ": In fact, I would prefer to remain where I am");
			}

			this.m.TargetTile = bestDestination;
			this.m.TargetDanger = bestDanger;
			this.m.IsTargetNextToUs = bestIsNextToUs;
			this.m.IsTargetForNextTurn = bestIsForNextTurn;
			return true;
		}

		return false;
	}

	function onQueryTargetTile( _tile, _tag )
	{
		local dist = _tile.getDistanceTo(_tag.Origin);
		local score = _tile.Level * 2.0 + _tile.TVTotal - dist * 2.0;
		local scoreBonus = _tile.Level + _tile.TVTotal * this.Const.AI.Behavior.DefendTerrainValueMult;

		if (_tile.IsHidingEntity)
		{
			score = score + this.Const.AI.Behavior.KeepSafeHidingPlaceBonus;
			scoreBonus = scoreBonus + this.Const.AI.Behavior.KeepSafeHidingPlaceBonus;
		}

		local opponents = _tag.Behavior.queryOpponentMagnitude(_tile, this.Const.AI.Behavior.KeepSafeOpponentsMaxDist);
		score = score - opponents.Opponents * opponents.AverageDistanceScore * this.Const.AI.Behavior.KeepSafeOpponentsMult;
		scoreBonus = scoreBonus - opponents.Opponents * opponents.AverageDistanceScore * this.Const.AI.Behavior.KeepSafeOpponentsMult;
		_tag.Tiles.push({
			Tile = _tile,
			Score = score,
			ScoreBonus = scoreBonus,
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

