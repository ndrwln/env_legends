this.ai_attack_deathblow <- this.inherit("scripts/ai/tactical/behaviors/ai_attack_default", {
	m = {},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Deathblow;
		this.m.Order = this.Const.AI.Behavior.Order.Deathblow;
		this.m.PossibleSkills = [
			"actives.deathblow"
		];
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		local score = this.ai_attack_default.onEvaluate(_entity) / this.Const.AI.Behavior.Score.Attack * this.Const.AI.Behavior.Score.Deathblow;

		if (score > 0)
		{
			this.getAgent().getBehavior(this.Const.AI.Behavior.ID.AttackDefault).m.Score *= 0.25;
		}

		return score;
	}

	function queryBestMeleeTarget( _entity, _skill, _targets )
	{
		for( local i = _targets.len() - 1; i >= 0; i = --i )
		{
			local targetStatus = _targets[i].getSkills();

			if (!targetStatus.hasSkill("effects.dazed") && !targetStatus.hasSkill("effects.stunned") && !targetStatus.hasSkill("effects.sleeping") && !_targets[i].getCurrentProperties().IsRooted)
			{
				_targets.remove(i);
			}
		}

		return this.behavior.queryBestMeleeTarget(_entity, _skill, _targets);
	}

	function queryBestRangedTarget( _entity, _skill, _targets, _maxRange = 0 )
	{
		for( local i = _targets.len() - 1; i >= 0; i = --i )
		{
			local targetStatus = _targets[i].getSkills();

			if (!targetStatus.hasSkill("effects.dazed") && !targetStatus.hasSkill("effects.stunned") && !targetStatus.hasSkill("effects.sleeping") && !_targets[i].getCurrentProperties().IsRooted)
			{
				_targets.remove(i);
			}
		}

		return this.behavior.queryBestRangedTarget(_entity, _skill, _targets, _maxRange);
	}

});

