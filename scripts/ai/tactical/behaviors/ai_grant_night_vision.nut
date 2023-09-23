this.ai_grant_night_vision <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		TargetScore = 0,
		PossibleSkills = [
			"actives.grant_night_vision"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.GrantNightVision;
		this.m.Order = this.Const.AI.Behavior.Order.GrantNightVision;
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

		if (this.Tactical.State.isScenarioMode() || this.World.getTime().IsDaytime)
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
		local allies = this.getAgent().getKnownAllies();
		local func = this.findBestTarget(_entity, allies);

		while (resume func == null)
		{
			yield null;
		}

		if (this.m.TargetTile == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		return this.Const.AI.Behavior.Score.GrantNightVision * score + this.m.TargetScore;
	}

	function onExecute( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToTarget(this.m.TargetTile);
			this.m.IsFirstExecuted = false;
			_entity.setDiscovered(true);
			_entity.getTile().addVisibilityForFaction(this.Const.Faction.Player);
			return false;
		}

		this.m.Skill.use(this.m.TargetTile);

		if (!_entity.isHiddenToPlayer())
		{
			this.getAgent().declareAction();
		}

		this.m.Skill = null;
		this.m.TargetTile = null;
		return true;
	}

	function findBestTarget( _entity, _targets )
	{
		// Function is a generator.
		local myTile = _entity.getTile();
		local bestScore = -9000.0;
		local bestTarget;
		local time = this.Time.getExactTime();

		foreach( ally in _targets )
		{
			local allyTile = ally.getTile();

			if (myTile.getDistanceTo(allyTile) > this.m.Skill.getMaxRange())
			{
				continue;
			}

			if (!this.m.Skill.isUsableOn(allyTile))
			{
				continue;
			}

			if (this.isAllottedTimeReached(time))
			{
				yield null;
				time = this.Time.getExactTime();
			}

			local score = 0.0;
			local targets = [];

			if (this.m.Skill.isViableTarget(_entity, ally))
			{
				targets.push(ally);
			}

			for( local i = 0; i < 6; i = ++i )
			{
				if (!allyTile.hasNextTile(i))
				{
				}
				else
				{
					local adjacentTile = allyTile.getNextTile(i);

					if (!adjacentTile.IsOccupiedByActor)
					{
					}
					else
					{
						local entity = adjacentTile.getEntity();

						if (!this.m.Skill.isViableTarget(_entity, entity))
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
				local target_score = 1.0;
				target_score = target_score * target.getHitpointsPct();
				target_score = target_score * target.getCurrentProperties().TargetAttractionMult;

				if (!target.isTurnDone())
				{
					target_score = target_score * this.Const.AI.Behavior.GrantNightVisionStillToActMult;
				}

				if (this.isRangedUnit(target))
				{
					target_score = target_score * this.Const.AI.Behavior.GrantNightVisionRangedMult;
				}
				else
				{
					target_score = target_score * this.Const.AI.Behavior.GrantNightVisionMeleeMult;
				}

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
				bestTarget = ally;
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

