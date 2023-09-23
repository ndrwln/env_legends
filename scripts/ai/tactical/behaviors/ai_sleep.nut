this.ai_sleep <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		TargetScore = 0,
		PossibleSkills = [
			"actives.sleep"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Sleep;
		this.m.Order = this.Const.AI.Behavior.Order.Sleep;
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

		if (!this.getAgent().hasKnownOpponent())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.Tactical.State.isAutoRetreat())
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

		if (this.m.TargetTile == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		return this.Const.AI.Behavior.Score.Sleep * score + this.m.TargetScore;
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
		local knownAllies = this.getAgent().getKnownAllies();
		local time = this.Time.getExactTime();

		foreach( o in _targets )
		{
			local target = o.Actor;
			local targetTile = target.getTile();

			if (myTile.getDistanceTo(targetTile) > this.m.Skill.getMaxRange())
			{
				continue;
			}

			if (!this.m.Skill.isUsableOn(targetTile))
			{
				continue;
			}

			if (o.Actor.getCurrentProperties().IsStunned)
			{
				continue;
			}

			if (this.isAllottedTimeReached(time))
			{
				yield null;
				time = this.Time.getExactTime();
			}

			local score = 10;
			score = score + (this.m.Skill.getMaxRange() - myTile.getDistanceTo(targetTile));
			score = score + this.Const.AI.Behavior.SleepZOCBonus * targetTile.getZoneOfOccupationCountOtherThan(target.getAlliedFactions());
			score = score * this.queryTargetValue(_entity, target, null);

			if (!target.isTurnDone())
			{
				score = score * this.Const.AI.Behavior.SleepStillToActMult;

				foreach( other_target in _targets )
				{
					local other = other_target.Actor;

					if (other.getID() == target.getID() || !this.isKindOf(other.get(), "player"))
					{
						continue;
					}

					local d = other.getTile().getDistanceTo(targetTile);

					if (other.getTile().getDistanceTo(targetTile) <= 2 && other.getSkills().hasSkill("effects.sleeping"))
					{
						score = score * this.Const.AI.Behavior.SleepCanWakeOthersMult;
					}
				}
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

