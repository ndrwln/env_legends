this.ai_nightmare <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		ScoreBonus = 0,
		PossibleSkills = [
			"actives.nightmare"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Nightmare;
		this.m.Order = this.Const.AI.Behavior.Order.Nightmare;
		this.m.IsThreaded = true;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		// Function is a generator.
		this.m.Skill = null;
		this.m.TargetTile = null;
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

		return this.Const.AI.Behavior.Score.Nightmare * score + this.m.ScoreBonus;
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
		this.getAgent().declareEvaluationDelay(550);
		this.getAgent().declareAction();
		this.m.Skill = null;
		this.m.TargetTile = null;
		return true;
	}

	function findBestTarget( _entity, _targets )
	{
		// Function is a generator.
		local myTile = _entity.getTile();
		local knownAllies = this.getAgent().getKnownAllies();
		local bestScore = 0.0;
		local bestTarget;
		local time = this.Time.getExactTime();

		foreach( opponent in _targets )
		{
			if (this.isAllottedTimeReached(time))
			{
				yield null;
				time = this.Time.getExactTime();
			}

			local target = opponent.Actor;
			local opponentTile = opponent.Actor.getTile();

			if (!this.m.Skill.isUsableOn(opponentTile))
			{
				continue;
			}

			local score = 30.0;
			local distanceToTarget = myTile.getDistanceTo(opponentTile);

			if (target.getMoraleState() == this.Const.MoraleState.Fleeing)
			{
				continue;
			}

			if (target.isArmedWithRangedWeapon() && distanceToTarget <= target.getIdealRange())
			{
				score = score + this.Const.AI.Behavior.NightmareDangerOfRangedTarget;
			}

			score = score - myTile.getDistanceTo(opponentTile) * this.Const.AI.Behavior.NightmareDistanceMult;
			local minDist = distanceToTarget;

			foreach( ally in knownAllies )
			{
				local d = ally.getTile().getDistanceTo(opponentTile);
				score = score + this.Math.max(0, 7 - d) * this.Const.AI.Behavior.NightmareAllyDistanceMult;

				if (d < minDist)
				{
					d = minDist;
				}
			}

			if (opponentTile.getZoneOfOccupationCount(opponent.Actor.getFaction()) == 0)
			{
				score = score + this.Const.AI.Behavior.NightmareIsolatedBonus;
			}

			foreach( o in _targets )
			{
				local helper = o.Actor;
				local dist = helper.getTile().getDistanceTo(opponentTile);

				if (dist >= 8)
				{
					continue;
				}

				if (helper.getCurrentProperties().IsStunned || helper.getCurrentProperties().IsRooted || helper.getTile().getZoneOfControlCountOtherThan(helper.getAlliedFactions()) > 1)
				{
					continue;
				}

				local turns = this.queryActorTurnsNearTarget(helper, opponentTile, _entity).Turns;

				if (turns <= 1.0)
				{
					score = score - this.Const.AI.Behavior.NightmareHelperPenalty;
				}
			}

			if (opponentTile.hasZoneOfOccupationOtherThan(target.getAlliedFactions()))
			{
				score = score * this.Const.AI.Behavior.NightmareEngagedMult;
			}

			score = score * target.getCurrentProperties().TargetAttractionMult;

			if (_entity.getAttackers().find(target.getID()) != null)
			{
				score = score * this.Const.AI.Behavior.NightmareAttackingMeMult;
			}

			score = score * this.queryTargetValue(_entity, target);

			if (score > bestScore)
			{
				bestScore = score;
				bestTarget = target;
			}
		}

		if (bestTarget != null)
		{
			this.m.TargetTile = bestTarget.getTile();
			this.m.ScoreBonus = bestScore * 0.1;
		}

		return true;
	}

});

