this.ai_line_breaker <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		PossibleSkills = [
			"actives.line_breaker",
			"actives.fling_back"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.LineBreaker;
		this.m.Order = this.Const.AI.Behavior.Order.LineBreaker;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.TargetTile = null;
		this.m.Skill = null;
		local scoreMult = this.getProperties().BehaviorMult[this.m.ID];

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

		if (!this.getAgent().hasVisibleOpponent())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Skill = this.selectSkill(this.m.PossibleSkills);

		if (this.m.Skill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		scoreMult = scoreMult * this.getFatigueScoreMult(this.m.Skill);
		local myTile = _entity.getTile();
		local bestScore = 0;
		local bestTargetValue = 0;
		local bestTarget;
		local targets = this.queryTargetsInMeleeRange();

		foreach( t in targets )
		{
			local targetValue = this.queryTargetValue(_entity, t);

			if (targetValue > bestTargetValue)
			{
				bestTargetValue = targetValue;
			}
		}

		foreach( t in targets )
		{
			if (t.getCurrentProperties().IsImmuneToKnockBackAndGrab)
			{
				continue;
			}

			if (t.isArmedWithRangedWeapon())
			{
				continue;
			}

			if (t.getCurrentProperties().IsStunned || t.getCurrentProperties().IsRooted)
			{
				continue;
			}

			local targetTile = t.getTile();

			if (!this.m.Skill.isUsableOn(targetTile))
			{
				continue;
			}

			local pushTile = this.m.Skill.findTileToKnockBackTo(myTile, targetTile);
			local isGoodReason = false;

			if (pushTile == null)
			{
				continue;
			}

			local score = 1.0;

			if (t.getHitpoints() <= 10 && this.m.Skill.getID() == "actives.fling_back")
			{
				isGoodReason = true;
				score = score * this.Const.AI.Behavior.LineBreakerExecuteMult;
			}

			if (t.getSkills().hasSkill("effects.riposte"))
			{
				isGoodReason = true;
				score = score * this.Const.AI.Behavior.LineBreakerVSRiposteMult;
			}

			local numAllyZOC = pushTile.getZoneOfControlCountOtherThan(t.getAlliedFactions());

			if (numAllyZOC - 1 >= 2 && numAllyZOC - 1 > pushTile.getZoneOfControlCount(t.getFaction()))
			{
				score = score * (1.0 + (numAllyZOC - 1) * this.Const.AI.Behavior.LineBreakerSetupAlliesBonus);
				isGoodReason = true;
			}

			local numPotentialNewTargets = 0;

			for( local i = 0; i < 6; i = ++i )
			{
				if (!targetTile.hasNextTile(i))
				{
				}
				else
				{
					local adjacentTile = targetTile.getNextTile(i);

					if (adjacentTile.IsOccupiedByActor && this.Math.abs(adjacentTile.Level - targetTile.Level) <= 1 && !adjacentTile.getEntity().isAlliedWith(_entity) && adjacentTile.getDistanceTo(myTile) > 1)
					{
						local adjacentTarget = adjacentTile.getEntity();
						local adjacentTargetValue = this.queryTargetValue(_entity, adjacentTarget);
						numPotentialNewTargets = ++numPotentialNewTargets;

						if (adjacentTarget.getSkills().hasSkill("perks.rally_the_troops"))
						{
							adjacentTargetValue = adjacentTargetValue * this.Const.AI.Behavior.LineBreakerVSRallyMult;
						}

						if (adjacentTargetValue > bestTargetValue + this.Const.AI.Behavior.LineBreakerBetterTargetThreshold)
						{
							score = score * (1.0 + (adjacentTargetValue - bestTargetValue));
							isGoodReason = true;
						}
					}
				}
			}

			if (this.getProperties().EngageTargetMultipleOpponentsMult < 1.0 && this.getProperties().EngageTargetMultipleOpponentsMult > 0.0 && numPotentialNewTargets > targets.len() + 1)
			{
				score = score * (1.0 / this.getProperties().EngageTargetMultipleOpponentsMult);
				isGoodReason = true;
			}

			if (!isGoodReason)
			{
				score = score * this.Const.AI.Behavior.LineBreakerForPositionMult;

				if (targetTile.Level > myTile.Level && pushTile.Level <= targetTile.Level)
				{
					isGoodReason = true;
				}

				if (!targetTile.IsBadTerrain && myTile.IsBadTerrain && targetTile.Level >= myTile.Level && pushTile.Level <= targetTile.Level)
				{
					isGoodReason = true;
				}

				if (!targetTile.IsBadTerrain && pushTile.IsBadTerrain && targetTile.Level >= myTile.Level && pushTile.Level <= targetTile.Level)
				{
					isGoodReason = true;
				}
			}

			if (isGoodReason)
			{
				if (t.getSkills().hasSkill("effects.shieldwall"))
				{
					score = score * this.Const.AI.Behavior.LineBreakerCounterSkillMult;
				}

				if (targetTile.Level < myTile.Level || targetTile.Level < pushTile.Level)
				{
					score = score * this.Const.AI.Behavior.LineBreakerWorsePositionMult;
				}

				if (targetTile.IsBadTerrain && !myTile.IsBadTerrain || targetTile.IsBadTerrain && !pushTile.IsBadTerrain)
				{
					score = score * this.Const.AI.Behavior.LineBreakerWorsePositionMult;
				}
			}

			if (isGoodReason && score > bestScore)
			{
				bestScore = score;
				bestTarget = targetTile;
			}
		}

		if (bestTarget != null)
		{
			this.m.TargetTile = bestTarget;
			return this.Const.AI.Behavior.Score.LineBreaker * bestScore * scoreMult;
		}

		return this.Const.AI.Behavior.Score.Zero;
	}

	function onExecute( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToTarget(this.m.TargetTile);
			this.m.IsFirstExecuted = false;
			return false;
		}

		if (this.Const.AI.VerboseMode)
		{
			this.logInfo("* " + _entity.getName() + ": Using Line Breaker!");
		}

		this.m.Skill.use(this.m.TargetTile);

		if (!_entity.isHiddenToPlayer() || this.m.TargetTile.IsVisibleForPlayer)
		{
			this.getAgent().declareEvaluationDelay();
			this.getAgent().declareAction();
		}

		this.m.TargetTile = null;
		this.m.Skill = null;
		return true;
	}

});

