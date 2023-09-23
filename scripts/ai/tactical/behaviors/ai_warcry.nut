this.ai_warcry <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		PossibleSkills = [
			"actives.warcry"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Warcry;
		this.m.Order = this.Const.AI.Behavior.Order.Warcry;
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
		local actors = this.Tactical.Entities.getAllInstances();
		local myTile = _entity.getTile();
		local useScore = 0.0;
		local numTargets = 0.0;
		local isInMelee = false;

		foreach( i in actors )
		{
			foreach( a in i )
			{
				if (!a.isAlive() || a.getID() == _entity.getID())
				{
					continue;
				}

				local thisScore = 0;
				local distance = a.getTile().getDistanceTo(myTile);

				if (a.getFaction() == _entity.getFaction())
				{
					if (a.getMoraleState() == this.Const.MoraleState.Ignore || a.getMoraleState() == this.Const.MoraleState.Confident)
					{
						continue;
					}

					thisScore = thisScore + this.Math.max(0, this.Const.MoraleState.Confident - a.getMoraleState() - distance * this.Const.AI.Behavior.WarcryDistanceMult);
				}
				else if (!a.isAlliedWith(_entity))
				{
					if (a.getMoraleState() == this.Const.MoraleState.Ignore || a.getMoraleState() == this.Const.MoraleState.Fleeing)
					{
						continue;
					}

					if (a.getCurrentProperties().MoraleCheckBraveryMult[this.Const.MoraleCheckType.MentalAttack] > 1.0 || a.getBravery() >= 80)
					{
						continue;
					}

					thisScore = thisScore + this.Math.max(0, a.getMoraleState() - distance * this.Const.AI.Behavior.WarcryDistanceMult) * (1.0 - this.Math.minf(1.0, a.getBravery() / 100.0));

					if (distance == 1)
					{
						isInMelee = true;
					}
				}

				if (thisScore > 0)
				{
					local hitpoints = a.getHitpoints() + a.getArmor(this.Const.BodyPart.Body) * 0.75 + a.getArmor(this.Const.BodyPart.Head) * 0.25;
					local hitpointsMax = a.getHitpointsMax() + a.getArmorMax(this.Const.BodyPart.Body) * 0.75 + a.getArmorMax(this.Const.BodyPart.Head) * 0.25;
					local hitpointPercentage = hitpoints / hitpointsMax;
					useScore = useScore + thisScore * hitpointPercentage;
					numTargets = ++numTargets;
				}
			}
		}

		score = score * useScore;

		if (isInMelee)
		{
			score = score * this.Const.AI.Behavior.WarCryInMeleeMult;
		}

		return this.Const.AI.Behavior.Score.Warcry * score;
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

	function onSortByScore( _a, _b )
	{
		if (_a.Score > _b.Score)
		{
			return -1;
		}
		else if (_a.Score < _b.Score)
		{
			return 1;
		}

		return 0;
	}

});

