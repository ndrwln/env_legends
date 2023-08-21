this.ai_attack_reap <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		PossibleSkills = [
			"actives.reap"
		],
		Skill = null,
		MinTargets = 2
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Reap;
		this.m.Order = this.Const.AI.Behavior.Order.Reap;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.TargetTile = null;
		this.m.Skill = null;
		local score = this.getProperties().BehaviorMult[this.m.ID];

		if (_entity.getActionPoints() < this.Const.Movement.AutoEndTurnBelowAP)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (!this.getAgent().hasVisibleOpponent())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Skill = this.selectSkill(this.m.PossibleSkills);

		if (this.m.Skill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		score = score * this.getFatigueScoreMult(this.m.Skill);
		local targets = this.queryTargetsInMeleeRange(this.m.Skill.getMinRange(), this.m.Skill.getMaxRange());

		if (targets.len() < this.m.MinTargets)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local bestTarget = this.getBestTarget(_entity, this.m.Skill, targets);

		if (bestTarget.Target == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.TargetTile = bestTarget.Target.getTile();
		return this.Const.AI.Behavior.Score.Swing * bestTarget.Score * score;
	}

	function onExecute( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToTarget(this.m.TargetTile);
			this.m.IsFirstExecuted = false;
			return false;
		}

		if (this.m.TargetTile != null && this.m.TargetTile.IsOccupiedByActor)
		{
			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + _entity.getName() + ": Using Reap against " + this.m.TargetTile.getEntity().getName() + "!");
			}

			this.m.Skill.use(this.m.TargetTile);

			if (_entity.isAlive() && (!_entity.isHiddenToPlayer() || this.m.TargetTile.IsVisibleForPlayer))
			{
				this.getAgent().declareAction();
			}

			this.m.TargetTile = null;
		}

		return true;
	}

	function getBestTarget( _entity, _skill, _targets )
	{
		local myTile = _entity.getTile();
		local bestTarget;
		local bestScore = 1;
		local bestCombinedValue = 0;

		foreach( target in _targets )
		{
			local targetTile = target.getTile();

			if (!_skill.onVerifyTarget(_entity.getTile(), target.getTile()))
			{
				continue;
			}

			local d = myTile.getDistanceTo(targetTile);
			local result = {
				Tiles = [],
				MyTile = myTile,
				TargetTile = targetTile,
				Num = 0
			};
			this.Tactical.queryTilesInRange(myTile, d, d, false, [], this.onQueryTilesHittable, result);
			local tiles = [];

			for( local i = 0; i != result.Tiles.len(); i = ++i )
			{
				if (result.Tiles[i].ID == targetTile.ID)
				{
					tiles.push(result.Tiles[i]);
					local idx = i - 1;

					if (idx < 0)
					{
						idx = idx + result.Tiles.len();
					}

					tiles.push(result.Tiles[idx]);
					idx = i - 2;

					if (idx < 0)
					{
						idx = idx + result.Tiles.len();
					}

					tiles.push(result.Tiles[idx]);
					break;
				}
			}

			local score = 0;
			local combinedValue = this.queryTargetValue(_entity, target, _skill);

			foreach( t in tiles )
			{
				if (!t.IsVisibleForEntity)
				{
					continue;
				}

				if (this.Math.abs(t.Level - myTile.Level) > 1 || this.Math.abs(t.Level - targetTile.Level) > 1)
				{
					continue;
				}

				if (!t.IsEmpty && t.getEntity().isAttackable())
				{
					if (t.getEntity().isAlliedWith(_entity))
					{
						combinedValue = combinedValue - (1.0 - this.getProperties().TargetPriorityHittingAlliesMult) * t.getEntity().getCurrentProperties().TargetAttractionMult;
					}
					else
					{
						combinedValue = combinedValue + this.queryTargetValue(_entity, t.getEntity(), _skill);
						score = score + 1;
					}
				}
			}

			if (score < this.m.MinTargets)
			{
				continue;
			}

			if (score > bestScore || score == bestScore && combinedValue > bestCombinedValue)
			{
				bestTarget = target;
				bestCombinedValue = combinedValue;
				bestScore = score;
			}
		}

		local score = this.Math.maxf(0.0, bestCombinedValue / 2.0);
		return {
			Target = bestTarget,
			Score = score
		};
	}

	function onQueryTilesHittable( _tile, _result )
	{
		_result.Tiles.push(_tile);
	}

});

