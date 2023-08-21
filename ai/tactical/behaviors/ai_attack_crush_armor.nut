this.ai_attack_crush_armor <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		PossibleSkills = [
			"actives.crush_armor",
			"actives.demolish_armor"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.CrushArmor;
		this.m.Order = this.Const.AI.Behavior.Order.CrushArmor;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.TargetTile = null;
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

		if (!this.getAgent().hasVisibleOpponent())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Skill = this.selectSkill(this.m.PossibleSkills);

		if (this.m.Skill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		score = score * this.getFatigueScoreMult(this.m.Skill);
		local targets = this.queryTargetsInMeleeRange(this.m.Skill.getMinRange(), this.m.Skill.getMaxRange(), this.m.Skill.getMaxLevelDifference());

		if (targets.len() == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local bestTarget = this.getBestTarget(_entity, this.m.Skill, targets);

		if (bestTarget.Target == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.TargetTile = bestTarget.Target.getTile();
		score = score * bestTarget.Score;

		if (targets.len() > 1)
		{
			local targetValue = this.queryTargetValue(_entity, bestTarget.Target, null);

			foreach( t in targets )
			{
				if (this.queryTargetValue(_entity, t, null) >= targetValue * this.Const.AI.Behavior.CrushArmorBetterTargetPct)
				{
					score = score * this.Const.AI.Behavior.CrushArmorBetterTargetMult;
				}
			}
		}

		return this.Const.AI.Behavior.Score.CrushArmor * score;
	}

	function onExecute( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToTarget(this.m.TargetTile);
			this.m.IsFirstExecuted = false;
			return false;
		}

		if (this.m.TargetTile != null && this.m.TargetTile.IsOccupiedByActor)
		{
			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + _entity.getName() + ": Using Crush Armor against " + this.m.TargetTile.getEntity().getName() + "!");
			}

			this.m.Skill.use(this.m.TargetTile);

			if (_entity.isAlive() && (!_entity.isHiddenToPlayer() || this.m.TargetTile.IsVisibleForPlayer))
			{
				this.getAgent().declareAction();
			}

			this.m.TargetTile = null;
		}

		return true;
	}

	function getBestTarget( _entity, _skill, _targets )
	{
		local bestTarget;
		local bestScore = 0.0;

		foreach( target in _targets )
		{
			if (_skill.onVerifyTarget(_entity.getTile(), target.getTile()))
			{
				for( ; target.getArmor(this.Const.BodyPart.Body) <= 40;  )
				{
				}

				local p = _entity.getCurrentProperties();
				local armor = target.getArmor(this.Const.BodyPart.Body) * p.getHitchance(this.Const.BodyPart.Body) * 0.01 + target.getArmor(this.Const.BodyPart.Head) * p.getHitchance(this.Const.BodyPart.Head) * 0.01;
				local damage = _skill.getExpectedDamage(target).ArmorDamage;

				for( ; armor <= damage;  )
				{
				}

				local score = damage / _entity.getCurrentProperties().getArmorDamageAverage();
				score = score * (target.getHitpoints() / target.getHitpointsMax());
				score = score * (_skill.getHitchance(target) * 0.01);

				if (score > bestScore)
				{
					bestTarget = target;
					bestScore = score;
				}
			}
		}

		return {
			Target = bestTarget,
			Score = bestScore
		};
	}

});

