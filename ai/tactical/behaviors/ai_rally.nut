this.ai_rally <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		PossibleSkills = [
			"actives.rally_the_troops"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Rally;
		this.m.Order = this.Const.AI.Behavior.Order.Rally;
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

			if (distance > 4)
			{
				continue;
			}

			if (a.getMoraleState() == this.Const.MoraleState.Ignore || a.getMoraleState() >= this.Const.MoraleState.Steady)
			{
				continue;
			}

			if (a.getSkills().hasSkill("effects.rallied"))
			{
				continue;
			}

			thisScore = this.Math.max(0, this.Const.MoraleState.Confident - a.getMoraleState());
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

