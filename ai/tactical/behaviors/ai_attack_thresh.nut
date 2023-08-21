this.ai_attack_thresh <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		PossibleSkills = [
			"actives.thresh",
			"actives.round_swing",
			"actives.tail_slam_big"
		],
		Skill = null,
		MinTargets = 2
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Thresh;
		this.m.Order = this.Const.AI.Behavior.Order.Thresh;
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
		local bestTarget = this.getBestTarget(_entity, this.m.Skill);

		if (bestTarget.Target == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.TargetTile = bestTarget.Target;
		return this.Const.AI.Behavior.Score.Thresh * bestTarget.Score * score;
	}

	function onExecute( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToTarget(this.m.TargetTile);
			this.m.IsFirstExecuted = false;
			return false;
		}

		if (this.m.TargetTile != null)
		{
			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + _entity.getName() + ": Using Round Swing / Thresh!");
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

	function getBestTarget( _entity, _skill )
	{
		local ourTile = _entity.getTile();
		local bestTarget;
		local score = 0;
		local numTargets = 0;
		local numAllies = 0;

		for( local i = 0; i != 6; i = ++i )
		{
			if (!ourTile.hasNextTile(i))
			{
			}
			else
			{
				local tile = ourTile.getNextTile(i);

				if (!tile.IsOccupiedByActor)
				{
				}
				else if (this.Math.abs(tile.Level - ourTile.Level) > 1)
				{
				}
				else
				{
					local target = tile.getEntity();

					if (target.isAlliedWith(_entity))
					{
						local relief = target.getCurrentProperties().getMeleeDefense() * 0.01;
						score = score - this.Math.max(0, 1.0 - this.getProperties().TargetPriorityHittingAlliesMult - relief) * target.getCurrentProperties().TargetAttractionMult;
						numAllies = ++numAllies;
					}
					else
					{
						score = score + this.queryTargetValue(_entity, target, _skill);
						numTargets = ++numTargets;

						if (bestTarget == null && _skill.onVerifyTarget(ourTile, tile))
						{
							bestTarget = tile;
						}
					}
				}
			}
		}

		if (numTargets < this.m.MinTargets || numAllies >= numTargets || numAllies >= 2)
		{
			return {
				Target = null,
				Score = 0.0
			};
		}
		else
		{
			return {
				Target = bestTarget,
				Score = score
			};
		}
	}

});

