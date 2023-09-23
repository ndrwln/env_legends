this.ai_attack_knock_out <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		BestTarget = null,
		PossibleSkills = [
			"actives.knock_out",
			"actives.strike_down",
			"actives.disarm",
			"actives.serpent_disarm"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.KnockOut;
		this.m.Order = this.Const.AI.Behavior.Order.KnockOut;
		this.m.IsThreaded = true;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		// Function is a generator.
		this.m.TargetTile = null;
		this.m.Skill = null;
		this.m.BestTarget = null;
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
		local myTile = _entity.getTile();
		local targets = this.queryTargetsInMeleeRange(this.m.Skill.getMinRange(), this.m.Skill.getMaxRange() + (this.m.Skill.isRanged() ? myTile.Level : 0), this.m.Skill.getMaxLevelDifference());

		if (targets.len() == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local func = this.getBestTarget(_entity, this.m.Skill, targets);

		while (resume func == null)
		{
			yield null;
		}

		if (this.m.BestTarget.Target == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.TargetTile = this.m.BestTarget.Target.getTile();
		score = score * this.m.BestTarget.Score;
		return this.Const.AI.Behavior.Score.KnockOut * score;
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
		// Function is a generator.
		local time = this.Time.getExactTime();
		local myTile = _entity.getTile();
		local attackSkill = _entity.getSkills().getAttackOfOpportunity();
		local apRequiredForAttack = attackSkill != null ? attackSkill.getActionPointCost() : 4;
		local canAttackNext = this.m.Skill.getActionPointCost() + apRequiredForAttack <= _entity.getActionPointsMax();
		local bestTarget;
		local bestScore = 0.0;
		local isDisarm = _skill.getID() == "actives.disarm" || _skill.getID() == "actives.serpent_disarm";
		local zoc = myTile.getZoneOfControlCountOtherThan(_entity.getAlliedFactions());
		local isEntityRangedUnit = this.isRangedUnit(_entity);
		local bestTargetValue = 0.0;
		local opponents = this.getAgent().getKnownOpponents();

		foreach( target in _targets )
		{
			local targetValue = this.queryTargetValue(_entity, target, null);

			if (targetValue > bestTargetValue)
			{
				bestTargetValue = targetValue;
			}
		}

		local knownAllies = this.getAgent().getKnownAllies();
		local navigator = this.Tactical.getNavigator();

		foreach( target in _targets )
		{
			if (this.isAllottedTimeReached(time))
			{
				yield null;
				time = this.Time.getExactTime();
			}

			if (_skill.onVerifyTarget(_entity.getTile(), target.getTile()))
			{
				for( ; target.getFatigue() >= target.getFatigueMax() - 5;  )
				{
				}

				if (isDisarm && (target.getCurrentProperties().IsImmuneToDisarm || !target.getCurrentProperties().IsAbleToUseWeaponSkills || target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) == null || target.getMoraleState() == this.Const.MoraleState.Fleeing))
				{
					continue;
				}
				else if (!isDisarm && (target.getCurrentProperties().IsStunned || target.getCurrentProperties().IsImmuneToStun))
				{
					continue;
				}

				if (isDisarm)
				{
					local hasTarget = false;

					foreach( ally in knownAllies )
					{
						if (target.getTile().getDistanceTo(ally.getTile()) <= target.getIdealRange())
						{
							hasTarget = true;
							break;
						}
					}

					if (!hasTarget)
					{
						continue;
					}
				}

				if (!isDisarm && !canAttackNext && target.getCurrentProperties().TargetAttractionMult <= 1.0 && target.getTile().getZoneOfControlCountOtherThan(target.getAlliedFactions()) <= 1)
				{
					continue;
				}

				local expectedDamage = attackSkill.getExpectedDamage(target);

				for( ; target.getHitpoints() <= expectedDamage.HitpointDamage + expectedDamage.DirectDamage;  )
				{
				}

				local targetTile = target.getTile();
				local score = target.getHitpoints() / target.getHitpointsMax();
				score = score * (_skill.getHitchance(target) * 0.01);
				score = score * target.getCurrentProperties().TargetAttractionMult;

				if (target.getMoraleState() == this.Const.MoraleState.Fleeing)
				{
					score = score * this.Const.AI.Behavior.KnockoutFleeingMult;
				}

				if (target.getSkills().hasSkill("effects.distracted"))
				{
					score = score * this.Const.AI.Behavior.KnockoutDistractedMult;
				}

				if (target.isTurnDone() && target.getSkills().hasSkill("effects.adrenaline"))
				{
					score = score * this.Const.AI.Behavior.KnockoutPriorityMult;
				}

				if (target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isItemType(this.Const.Items.ItemType.TwoHanded) && target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isItemType(this.Const.Items.ItemType.MeleeWeapon))
				{
					score = score * this.Const.AI.Behavior.KnockoutPriorityMult;
				}

				if (target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isAoE())
				{
					score = score * this.Const.AI.Behavior.KnockoutPriorityMult;
				}

				if (isDisarm && target.getSkills().hasSkill("perk.quick_hands"))
				{
					score = score * this.Const.AI.Behavior.KnockoutTargetWithQuickHandsMult;
				}

				if (!isDisarm && target.getTile().Properties.Effect != null && !target.getTile().Properties.Effect.IsPositive)
				{
					score = score * this.Const.AI.Behavior.KnockoutPriorityMult;
				}

				if (isEntityRangedUnit)
				{
					score = score * this.Const.AI.Behavior.KnockoutPriorityMult;
				}

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
								score = score * this.Const.AI.Behavior.KnockoutPriorityMult;
							}

							if (adjacent.getEntity().getSkills().hasSkill("actives.deathblow"))
							{
								score = score * this.Const.AI.Behavior.KnockoutSetupDeathblowMult;
							}
						}
					}
				}

				if (targetTile.getZoneOfControlCount(_entity.getFaction()) == 0)
				{
					foreach( ally in knownAllies )
					{
						if (ally.getCurrentProperties().TargetAttractionMult <= 1.0 && !this.isRangedUnit(ally))
						{
							continue;
						}

						local d = this.queryActorTurnsNearTarget(target, ally.getTile(), target);

						if (d.Turns <= 1.0)
						{
							score = score * this.Const.AI.Behavior.KnockoutProtectPriorityTargetMult;
						}
					}
				}

				if (!isDisarm && zoc == 1 && targetTile.getDistanceTo(myTile) == 1 && target.isExertingZoneOfControl() && _entity.getActionPoints() - _skill.getActionPointCost() >= 2)
				{
					local settings = navigator.createSettings();
					settings.ActionPointCosts = _entity.getActionPointCosts();
					settings.FatigueCosts = _entity.getFatigueCosts();
					settings.FatigueCostFactor = 0.0;
					settings.ActionPointCostPerLevel = _entity.getLevelActionPointCost();
					settings.FatigueCostPerLevel = _entity.getLevelFatigueCost();
					settings.AllowZoneOfControlPassing = false;
					settings.ZoneOfControlCost = 0;
					settings.AlliedFactions = _entity.getAlliedFactions();
					settings.Faction = _entity.getFaction();
					local bestValue = 0.0;

					foreach( o in opponents )
					{
						if (o.Actor.isNull() || o.Actor.getID() == target.getID())
						{
							continue;
						}

						local opponentTile = o.Actor.getTile();
						local opponentZOCs = opponentTile.getZoneOfOccupationCountOtherThan(o.Actor.getAlliedFactions());

						if (opponentZOCs > 2)
						{
							continue;
						}

						if (opponentTile.getDistanceTo(myTile) <= this.getProperties().EngageRangeIdeal && this.Math.abs(opponentTile.Level - myTile.Level) <= 1)
						{
							continue;
						}

						local value = this.queryTargetValue(_entity, o.Actor, null);

						if (value > bestValue)
						{
							settings.TileToConsiderEmpty = target.getTile();

							if (navigator.findPath(myTile, opponentTile, settings, 1))
							{
								local turnsRequired = navigator.getTurnsRequiredForPath(_entity, settings, _entity.getActionPoints() - _skill.getActionPointCost(), opponentTile, _entity.getFaction());

								for( ; turnsRequired > 1.0;  )
								{
								}

								bestValue = value;
							}
						}
					}

					if (bestValue > bestTargetValue * this.Const.AI.Behavior.KnockBackBetterTargetPct)
					{
						score = score * this.Const.AI.Behavior.KnockBackEngageBetterTargetMult;
					}
				}

				if (score > bestScore)
				{
					bestTarget = target;
					bestScore = score;
				}
			}
		}

		if (isDisarm)
		{
			bestScore = bestScore * this.Const.AI.Behavior.KnockoutDisarmMult;
		}

		this.m.BestTarget = {
			Target = bestTarget,
			Score = bestScore
		};
		return true;
	}

});

