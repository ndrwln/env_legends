this.ai_boost_morale <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		PossibleSkills = [
			"actives.goblin_whip"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.BoostMorale;
		this.m.Order = this.Const.AI.Behavior.Order.BoostMorale;
		this.m.IsThreaded = false;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
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
		local target = this.findBestTarget(_entity, allies);

		if (target.Target == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.TargetTile = target.Target.getTile();
		return this.Const.AI.Behavior.Score.BoostMorale * score + target.Score;
	}

	function onExecute( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToTarget(this.m.TargetTile);
			this.m.IsFirstExecuted = false;
			return false;
		}

		this.m.Skill.use(this.m.TargetTile);

		if (!_entity.isHiddenToPlayer())
		{
			this.getAgent().declareAction();
			this.getAgent().declareEvaluationDelay(350);
		}

		this.m.Skill = null;
		this.m.TargetTile = null;
		return true;
	}

	function findBestTarget( _entity, _targets )
	{
		local myTile = _entity.getTile();
		local bestScore = 0.0;
		local bestTarget;

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

			local score = 5.0;
			local isEngaged = allyTile.hasZoneOfOccupationOtherThan(ally.getAlliedFactions());

			if (ally.getMoraleState() == this.Const.MoraleState.Fleeing)
			{
				score = score + this.Const.AI.Behavior.BoostMoraleFleeingBonus;

				if (isEngaged)
				{
					score = score + this.Const.AI.Behavior.BoostMoraleFleeingEngagedBonus;
				}
			}
			else if (isEngaged)
			{
				score = score + this.Const.AI.Behavior.BoostMoraleEngagedBonus;
			}

			if (score > bestScore)
			{
				bestScore = score;
				bestTarget = ally;
			}
		}

		return {
			Target = bestTarget,
			Score = bestScore
		};
	}

});

