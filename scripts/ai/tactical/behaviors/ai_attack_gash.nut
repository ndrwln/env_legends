this.ai_attack_gash <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		PossibleSkills = [
			"actives.gash"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Gash;
		this.m.Order = this.Const.AI.Behavior.Order.Gash;
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
		local targets = this.queryTargetsInMeleeRange();

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
		return this.Const.AI.Behavior.Score.Gash * score;
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
				this.logInfo("* " + _entity.getName() + ": Using Gash against " + this.m.TargetTile.getEntity().getName() + "!");
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
			if (!_skill.isUsableOn(target.getTile()))
			{
				continue;
			}

			if (!target.getCurrentProperties().IsAffectedByInjuries || !target.getCurrentProperties().IsAffectedByFreshInjuries || target.getCurrentProperties().ThresholdToReceiveInjuryMult == 0)
			{
				continue;
			}

			local damage = this.m.Skill.getExpectedDamage(target);

			if (target.getHitpoints() <= damage.HitpointDamage + damage.DirectDamage)
			{
				continue;
			}

			if (target.getHitpointsPct() <= 0.4)
			{
				continue;
			}

			if (damage.HitpointDamage + damage.DirectDamage < this.Const.Combat.InjuryMinDamage)
			{
				continue;
			}

			local score = this.queryTargetValue(_entity, target, _skill);
			local threshold = _entity.getCurrentProperties().ThresholdToInflictInjuryMult * this.Const.Combat.InjuryThresholdMult * target.getCurrentProperties().ThresholdToReceiveInjuryMult;
			local thresholdWithGash = threshold * (_entity.getCurrentProperties().IsSpecializedInSwords ? 0.5 : 0.66);
			local dmg = (damage.HitpointDamage + damage.DirectDamage) / (target.getHitpointsMax() * 1.0);

			if (!(dmg < threshold * 0.25 && dmg > thresholdWithGash * 0.25 || dmg < threshold * 0.5 && dmg > thresholdWithGash * 0.5))
			{
				continue;
			}

			if (dmg < threshold * 0.25 && dmg > thresholdWithGash * 0.5)
			{
				score = score * this.Const.AI.Behavior.GashHeavyInjuryInsteadOfNoneMult;
			}

			local injuries = target.getSkills().getAllSkillsOfType(this.Const.SkillType.Injury);

			if (injuries.len() >= this.Const.AI.Behavior.GashMaxInjuries)
			{
				continue;
			}

			if (injuries.len() == 0)
			{
				score = score * this.Const.AI.Behavior.GashTargetUninjuredMult;
			}

			if (score > bestScore)
			{
				bestTarget = target;
				bestScore = score;
			}
		}

		return {
			Target = bestTarget,
			Score = bestScore
		};
	}

});

