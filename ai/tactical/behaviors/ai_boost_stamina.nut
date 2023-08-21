this.ai_boost_stamina <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		PossibleSkills = [
			"actives.drums_of_war"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.BoostStamina;
		this.m.Order = this.Const.AI.Behavior.Order.BoostStamina;
		this.m.IsThreaded = false;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
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

		this.m.Skill = this.selectSkill(this.m.PossibleSkills);

		if (this.m.Skill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		score = score * this.getFatigueScoreMult(this.m.Skill);
		local actors = this.Tactical.Entities.getInstancesOfFaction(_entity.getFaction());
		local myTile = _entity.getTile();
		local useScore = 0.0;
		local numTargets = 0;

		foreach( a in actors )
		{
			if (a.getID() == _entity.getID())
			{
				continue;
			}

			local thisScore = 0;
			local distance = a.getTile().getDistanceTo(myTile);

			if (distance > 8)
			{
				continue;
			}

			if (a.getMoraleState() == this.Const.MoraleState.Ignore || a.getMoraleState() == this.Const.MoraleState.Fleeing)
			{
				continue;
			}

			if (a.getFatigue() <= 20)
			{
				continue;
			}

			if (a.getSkills().hasSkill("effects.drums_of_war"))
			{
				continue;
			}

			thisScore = 4;
			numTargets = ++numTargets;
			useScore = useScore + thisScore;
		}

		if (numTargets == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		score = score * (useScore * 0.1);
		return this.Const.AI.Behavior.Score.Rally * score;
	}

	function onExecute( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToTarget(_entity.getTile());
			this.m.IsFirstExecuted = false;
			return false;
		}

		this.m.Skill.use(_entity.getTile());

		if (!_entity.isHiddenToPlayer())
		{
			this.getAgent().declareAction();
			this.getAgent().declareEvaluationDelay(1500);
		}

		this.m.Skill = null;
		this.m.TargetTile = null;
		return true;
	}

});

