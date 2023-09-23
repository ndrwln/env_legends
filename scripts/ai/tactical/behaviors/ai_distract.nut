this.ai_distract <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		PossibleSkills = [
			"actives.throw_dirt"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Distract;
		this.m.Order = this.Const.AI.Behavior.Order.Distract;
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

		if (_entity.getActionPoints() == _entity.getActionPointsMax())
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

		if (_entity.getActionPoints() == _entity.getActionPointsMax())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Skill = this.selectSkill(this.m.PossibleSkills);

		if (this.m.Skill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		score = score * this.getFatigueScoreMult(this.m.Skill);
		local myTile = _entity.getTile();
		local targets = this.queryTargetsInMeleeRange(this.m.Skill.getMinRange(), this.m.Skill.getMaxRange() + (this.m.Skill.isRanged() ? myTile.Level : 0), this.m.Skill.getMaxLevelDifference());

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
		local zoc = _entity.getTile().getZoneOfControlCountOtherThan(_entity.getAlliedFactions());

		if (zoc > 1)
		{
			score = score * (1.0 + (zoc - 1) * this.Const.AI.Behavior.DistractSurroundedMult);
		}

		return this.Const.AI.Behavior.Score.Distract * score;
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
				this.logInfo("* " + _entity.getName() + ": Using " + this.m.Skill.getName() + " against " + this.m.TargetTile.getEntity().getName() + "!");
			}

			this.m.Skill.use(this.m.TargetTile);

			if (_entity.isAlive() && (!_entity.isHiddenToPlayer() || this.m.TargetTile.IsVisibleForPlayer))
			{
				this.getAgent().declareAction();

				if (this.m.Skill.getDelay() != 0)
				{
					this.getAgent().declareEvaluationDelay(this.m.Skill.getDelay());
				}
			}

			this.m.TargetTile = null;
		}

		return true;
	}

	function getBestTarget( _entity, _skill, _targets )
	{
		local myTile = _entity.getTile();
		local attackSkill = _entity.getSkills().getAttackOfOpportunity();
		local apRequiredForAttack = attackSkill != null ? attackSkill.getActionPointCost() : 4;
		local bestTarget;
		local bestScore = 0.0;

		foreach( target in _targets )
		{
			if (target.isNonCombatant())
			{
				continue;
			}

			if (_skill.onVerifyTarget(_entity.getTile(), target.getTile()))
			{
				if (target.getMoraleState() == this.Const.MoraleState.Fleeing)
				{
					continue;
				}

				for( ; target.getFatigue() >= target.getFatigueMax() - 5;  )
				{
				}

				if (target.getCurrentProperties().IsStunned || !target.getCurrentProperties().IsAbleToUseWeaponSkills || target.getSkills().hasSkill("effects.dazed") || target.getSkills().hasSkill("effects.distracted"))
				{
					continue;
				}

				local zoc = target.getTile().getZoneOfControlCountOtherThan(target.getAlliedFactions());

				if (target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isItemType(this.Const.Items.ItemType.RangedWeapon) && zoc > 0)
				{
					continue;
				}

				if (myTile.getZoneOfControlCountOtherThan(_entity.getAlliedFactions()) == 1 && target.getTile().getZoneOfControlCountOtherThan(target.getAlliedFactions()) == 1 && _entity.getActionPoints() >= apRequiredForAttack && attackSkill != null && attackSkill.getHitchance(target) >= 20)
				{
					continue;
				}

				local score = target.getHitpoints() / target.getHitpointsMax();
				score = score * (_skill.getHitchance(target) * 0.01);

				if (attackSkill != null)
				{
					local damage = attackSkill.getExpectedDamage(target);

					for( ; target.getHitpoints() <= damage.HitpointDamage + damage.DirectDamage;  )
					{
					}

					if (damage.HitpointDamage >= this.Const.Combat.InjuryMinDamage)
					{
						local threshold = _entity.getCurrentProperties().ThresholdToInflictInjuryMult * this.Const.Combat.InjuryThresholdMult * target.getCurrentProperties().ThresholdToReceiveInjuryMult;
						local dmg = damage.HitpointDamage / (target.getHitpointsMax() * 1.0);

						if (threshold * 0.25 <= dmg)
						{
							score = score * this.Const.AI.Behavior.DistractPreferInjuryMult;
						}
					}
				}

				score = score * (0.5 + target.getCurrentProperties().getMeleeSkill() * 0.01 * 0.5);
				score = score * (0.5 + target.getCurrentProperties().getRegularDamageAverage() * 0.01 * 0.5);
				score = score * this.Math.maxf(0.5, 1.5 - target.getCurrentProperties().TargetAttractionMult);

				if (!target.isTurnDone())
				{
					score = score * this.Const.AI.Behavior.DistractYetToActMult;
				}

				if (target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isItemType(this.Const.Items.ItemType.TwoHanded) && target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isItemType(this.Const.Items.ItemType.MeleeWeapon))
				{
					score = score * this.Const.AI.Behavior.DistractPriorityMult;
				}

				if (target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isAoE())
				{
					score = score * this.Const.AI.Behavior.DistractPriorityMult;
				}

				if (target.getSkills().hasSkill("perk.dodge") || target.getSkills().hasSkill("perk.overwhelm") || target.getSkills().hasSkill("actives.lunge"))
				{
					score = score * this.Const.AI.Behavior.DistractInitiativeMult;
				}

				if (target.getSkills().hasSkill("perk.berserk") || target.getSkills().hasSkill("effects.killing_frenzy"))
				{
					score = score * this.Const.AI.Behavior.DistractInitiativeMult;
				}

				if (target.getSkills().hasSkill("effects.shieldwall"))
				{
					score = score * this.Const.AI.Behavior.DistractVSShieldwallMult;
				}

				score = score * target.getCurrentProperties().DamageReceivedTotalMult;

				if (target.getSkills().hasSkill("actives.taunt"))
				{
					score = score * this.Const.AI.Behavior.DistractVSTaunterMult;
				}

				if (apRequiredForAttack <= _entity.getActionPoints() && _entity.getXPValue() >= 300)
				{
					score = score * this.Const.AI.Behavior.DistractAsEliteMult;
				}

				local targetTile = target.getTile();

				for( local i = 0; i < 6; i = ++i )
				{
					if (!targetTile.hasNextTile(i))
					{
					}
					else
					{
						local adjacent = targetTile.getNextTile(i);

						if (adjacent.IsOccupiedByActor && adjacent.getEntity().isAlliedWith(_entity))
						{
							if (adjacent.getEntity().getCurrentProperties().TargetAttractionMult > 1.0)
							{
								score = score * this.Const.AI.Behavior.DistractPriorityMult;
							}
						}
					}
				}

				if (target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isAoE() && zoc > 1)
				{
					score = score * this.Math.pow(this.Const.AI.Behavior.DistractSurroundedTargetMult, zoc - 1);
				}

				if (this.getStrategy().getStats().AlliesVSEnemiesRatio < 1.0)
				{
					score = score * this.Math.maxf(0.5, this.getStrategy().getStats().AlliesVSEnemiesRatio);
				}

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

