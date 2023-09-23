this.ai_root <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		TargetScore = 0,
		PossibleSkills = [
			"actives.root"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Root;
		this.m.Order = this.Const.AI.Behavior.Order.Root;
		this.m.IsThreaded = true;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		// Function is a generator.
		this.m.Skill = null;
		this.m.TargetTile = null;
		this.m.TargetScore = 0;
		local score = this.getProperties().BehaviorMult[this.m.ID];

		if (_entity.getActionPoints() < this.Const.Movement.AutoEndTurnBelowAP)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (!this.Tactical.State.isScenarioMode() && !this.World.getTime().IsDaytime && this.Time.getRound() == 1)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (!this.getAgent().hasKnownOpponent())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getTile().hasZoneOfControlOtherThan(_entity.getAlliedFactions()))
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Skill = this.selectSkill(this.m.PossibleSkills);

		if (this.m.Skill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		score = score * this.getFatigueScoreMult(this.m.Skill);
		local opponents = this.getAgent().getKnownOpponents();
		local func = this.findBestTarget(_entity, opponents);

		while (resume func == null)
		{
			yield null;
		}

		local target = this.findBestTarget(_entity, opponents);

		if (this.m.TargetTile == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.getStrategy().getStats().RangedAlliedVSEnemies > 1)
		{
			score = score + this.getStrategy().getStats().RangedAlliedVSEnemies * 0.1;
		}

		return this.Const.AI.Behavior.Score.Root * score + this.m.TargetScore;
	}

	function onExecute( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToTarget(this.m.TargetTile);
			this.m.IsFirstExecuted = false;

			if (this.m.TargetTile.IsVisibleForPlayer && _entity.isHiddenToPlayer())
			{
				_entity.setDiscovered(true);
				_entity.getTile().addVisibilityForFaction(this.Const.Faction.Player);
			}

			return false;
		}

		this.m.Skill.use(this.m.TargetTile);

		if (!_entity.isHiddenToPlayer())
		{
			this.getAgent().declareAction();
			this.getAgent().declareEvaluationDelay(500);
		}

		this.m.Skill = null;
		this.m.TargetTile = null;
		return true;
	}

	function findBestTarget( _entity, _targets )
	{
		// Function is a generator.
		local myTile = _entity.getTile();
		local bestScore = 0.0;
		local bestTarget;
		local knownAllies = this.getAgent().getKnownAllies();
		local time = this.Time.getExactTime();

		foreach( o in _targets )
		{
			local opponentTile = o.Actor.getTile();

			if (myTile.getDistanceTo(opponentTile) > this.m.Skill.getMaxRange())
			{
				continue;
			}

			if (!this.m.Skill.isUsableOn(opponentTile))
			{
				continue;
			}

			if (this.isAllottedTimeReached(time))
			{
				yield null;
				time = this.Time.getExactTime();
			}

			local score = 0.0;
			local targets = [
				o.Actor
			];

			for( local i = 0; i < 6; i = ++i )
			{
				if (!opponentTile.hasNextTile(i))
				{
				}
				else
				{
					local adjacentTile = opponentTile.getNextTile(i);

					if (!adjacentTile.IsOccupiedByActor)
					{
					}
					else
					{
						local entity = adjacentTile.getEntity();

						if (entity.getCurrentProperties().IsRooted)
						{
						}
						else if (entity.isAlliedWith(_entity))
						{
						}
						else
						{
							targets.push(entity);
						}
					}
				}
			}

			local numAffected = 0;

			foreach( target in targets )
			{
				if (target.getCurrentProperties().IsRooted || target.getCurrentProperties().IsImmuneToRoot)
				{
					continue;
				}

				local target_score = this.m.Skill.getMaxRange() - myTile.getDistanceTo(opponentTile);

				if (target.getMoraleState() == this.Const.MoraleState.Fleeing)
				{
					target_score = target_score + this.Const.AI.Behavior.RootFleeingBonus;
				}

				if (!target.hasRangedWeapon())
				{
					target_score = target_score + this.Const.AI.Behavior.RootNoRangedWeaponBonus;
				}

				if (!target.getTile().hasZoneOfControlOtherThan(target.getAlliedFactions()))
				{
					target_score = target_score + this.Const.AI.Behavior.RootNotEngagedBonus;

					if (this.queryActorTurnsNearTarget(target, myTile, _entity).Turns <= 1.0)
					{
						target_score = target_score + this.Const.AI.Behavior.RootDangerBonus;
					}

					local canHit = false;

					foreach( ally in knownAllies )
					{
						if (target.getTile().getDistanceTo(ally.getTile()) <= target.getIdealRange())
						{
							canHit = true;
							break;
						}
					}

					if (!canHit)
					{
						target_score = target_score + this.Const.AI.Behavior.RootCantAttackAnyoneBonus;
					}

					if (!canHit && target.isTurnDone() && target.getSkills().hasSkill("effects.adrenaline"))
					{
						target_score = target_score + this.Const.AI.Behavior.RootAdrenalineBonus;
					}
				}

				if (target.getTile().IsBadTerrain)
				{
					target_score = target_score + this.Const.AI.Behavior.RootBadTerrain;
				}

				if (target.getTile().Properties.Effect != null && !target.getTile().Properties.Effect.IsPositive && target.getTile().Properties.Effect.Applicable(target))
				{
					target_score = target_score + this.Const.AI.Behavior.RootBadTerrain;
				}

				target_score = target_score * target.getCurrentProperties().TargetAttractionMult;
				score = score + target_score;
				numAffected = ++numAffected;
			}

			if (numAffected > 1)
			{
				score = score * this.Math.pow(this.Const.AI.Behavior.RootNumAffectedPOW, numAffected - 1);
			}

			if (score > bestScore)
			{
				bestScore = score;
				bestTarget = o.Actor;
			}
		}

		if (bestTarget != null)
		{
			this.m.TargetTile = bestTarget.getTile();
			this.m.TargetScore = bestScore;
		}

		return true;
	}

});

