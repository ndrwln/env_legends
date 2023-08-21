this.ai_indomitable <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		PossibleSkills = [
			"actives.indomitable"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Indomitable;
		this.m.Order = this.Const.AI.Behavior.Order.Indomitable;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.Skill = null;
		local score = this.getProperties().BehaviorMult[this.m.ID];

		if (_entity.getCurrentProperties().IsStunned)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getActionPointsMax() - _entity.getActionPoints() < 4)
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
		local dotDamage = 0;
		local effects = _entity.getSkills().getAllSkillsOfType(this.Const.SkillType.DamageOverTime);

		foreach( dot in effects )
		{
			dotDamage = dotDamage + dot.getDamage();
		}

		if (dotDamage >= _entity.getHitpoints())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local myTile = _entity.getTile();
		local targets = this.queryTargetsInMeleeRange(1, 1);

		if (targets.len() <= 2)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		foreach( target in targets )
		{
			if (target.getSkills().hasSkill("actives.puncture"))
			{
				score = score + 1.0;
			}

			if (target.getSkills().hasSkill("actives.knock_out") || target.getSkills().hasSkill("actives.strike_down"))
			{
				score = score + 1.0;
			}
		}

		score = score * (1.0 + _entity.getTile().getZoneOfControlCountOtherThan(_entity.getAlliedFactions()) * this.Const.AI.Behavior.IndomitableSurrounded);
		score = score * (1.0 + 1.0 - _entity.getHitpointsPct());

		if (_entity.getAttackedCount() > 3)
		{
			score = score * (_entity.getAttackedCount() / 3.0);
		}

		if (score < this.Const.AI.Behavior.IndomitableScoreCutoff)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		return this.Const.AI.Behavior.Score.Indomitable * score;
	}

	function onExecute( _entity )
	{
		if (this.Const.AI.VerboseMode)
		{
			this.logInfo("* " + _entity.getName() + ": Using Indomitable!");
		}

		this.m.Skill.use(_entity.getTile());

		if (!_entity.isHiddenToPlayer())
		{
			this.getAgent().declareAction();
		}

		this.m.Skill = null;
		return true;
	}

});

