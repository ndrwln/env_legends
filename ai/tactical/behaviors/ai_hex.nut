this.ai_hex <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		Danger = 0.0,
		PossibleSkills = [
			"actives.hex"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Hex;
		this.m.Order = this.Const.AI.Behavior.Order.Hex;
		this.m.IsThreaded = true;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		// Function is a generator.
		this.m.Skill = null;
		this.m.TargetTile = null;
		this.m.Danger = 0.0;
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
		local opponents = this.getAgent().getKnownOpponents();
		local func = this.calculateDanger(_entity, opponents);

		while (resume func == null)
		{
			yield null;
		}

		if (this.m.Danger <= 1.0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local target = this.findBestTarget(_entity, opponents);

		if (target.Target == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.TargetTile = target.Target.getTile();

		if (_entity.getAttackedCount() == 0)
		{
			score = score * this.Const.AI.Behavior.HexNoAttacksMult;
		}

		if (_entity.getSkills().hasSkillOfType(this.Const.SkillType.DamageOverTime))
		{
			score = score * this.Const.AI.Behavior.HexDOTScoreMult;
		}

		score = score * (1.0 + _entity.getTile().getZoneOfControlCountOtherThan(_entity.getAlliedFactions()) * this.Const.AI.Behavior.HexZoneOfControlMult);
		return this.Const.AI.Behavior.Score.Hex * score + target.Score;
	}

	function onExecute( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToTarget(this.m.TargetTile);
			this.m.IsFirstExecuted = false;

			if (this.m.TargetTile.IsVisibleForPlayer && _entity.isHiddenToPlayer())
			{
				_entity.setDiscovered(true);
				_entity.getTile().addVisibilityForFaction(this.Const.Faction.Player);
			}

			return false;
		}

		this.m.Skill.use(this.m.TargetTile);
		this.getAgent().declareEvaluationDelay(500);

		if (!_entity.isHiddenToPlayer())
		{
			this.getAgent().declareAction();
		}

		this.m.Skill = null;
		this.m.TargetTile = null;
		return true;
	}

	function findBestTarget( _entity, _targets )
	{
		local myTile = _entity.getTile();
		local knownAllies = this.getAgent().getKnownAllies();
		local bestScore = 0.0;
		local bestTarget;
		local dotDamage = 0;
		local effects = _entity.getSkills().getAllSkillsOfType(this.Const.SkillType.DamageOverTime);

		foreach( dot in effects )
		{
			dotDamage = dotDamage + dot.getDamage();
		}

		foreach( opponent in _targets )
		{
			local target = opponent.Actor;
			local opponentTile = opponent.Actor.getTile();

			if (!this.m.Skill.isUsableOn(opponentTile))
			{
				continue;
			}

			local score = 10.0;

			if (target.getSkills().hasSkill("effects.hex"))
			{
				continue;
			}

			score = score * (target.getHitpointsPct() * (100.0 / target.getHitpoints()));
			score = score * (1.0 + target.getLevel() * this.Const.AI.Behavior.HexCharacterLevelMult);

			if (target.getHitpoints() <= dotDamage)
			{
				score = score * this.Const.AI.Behavior.HexDOTCanKillMult;
			}

			if (target.isPlayerControlled())
			{
				if (target.getLevel() <= 2 && this.getStrategy().getAveragePlayerLevel() >= 6 && target.getArmorMax(this.Const.BodyPart.Body) + target.getArmorMax(this.Const.BodyPart.Head) <= this.getStrategy().getAveragePlayerArmor() * 0.4)
				{
					score = score * this.Const.AI.Behavior.LikelyPlayerBaitMult;
				}
			}

			if (this.getAgent().getForcedOpponent() != null && this.getAgent().getForcedOpponent().getID() == target.getID())
			{
				score = score * 100.0;
			}

			if (target.getSkills().hasSkill("actives.indomitable"))
			{
				score = score * this.Const.AI.Behavior.HexAgainstIndomitable;
			}

			if (this.isKindOf(target, "player") || this.isKindOf(target, "firstborn") || this.isKindOf(target, "envoy"))
			{
				score = score * this.Const.AI.Behavior.HexPreferPlayerMult;
			}

			if (target.getSkills().hasSkill("effects.charmed") && !this.isKindOf(target, "player"))
			{
				score = score * this.Const.AI.Behavior.HexNotAGoodTargetMult;
			}

			score = score * target.getCurrentProperties().TargetAttractionMult;

			if (score > bestScore)
			{
				bestScore = score;
				bestTarget = target;
			}
		}

		return {
			Target = bestTarget,
			Score = bestScore * 0.1
		};
	}

	function calculateDanger( _entity, _targets )
	{
		// Function is a generator.
		local myTile = _entity.getTile();
		local currentDanger = 0.0;
		local time = this.Time.getExactTime();

		foreach( target in _targets )
		{
			if (this.isAllottedTimeReached(time))
			{
				yield null;
				time = this.Time.getExactTime();
			}

			local targetTile = target.Actor.getTile();
			local realDist = myTile.getDistanceTo(targetTile);

			if (realDist <= this.Const.AI.Behavior.RangedEngageMaxDangerDist && target.Actor.getMoraleState() != this.Const.MoraleState.Fleeing && !target.Actor.isNonCombatant() && targetTile.getZoneOfControlCountOtherThan(target.Actor.getAlliedFactions()) < this.Const.AI.Behavior.RangedEngageIgnoreDangerMinZones)
			{
				if (this.isRangedUnit(target.Actor) && realDist <= target.Actor.getIdealRange() + this.Math.max(0, targetTile.Level - myTile.Level))
				{
					currentDanger = currentDanger + 3.0;
				}
				else
				{
					currentDanger = currentDanger + this.getDangerFromActor(target.Actor, myTile, _entity);
				}

				if (currentDanger > 1.0)
				{
					break;
				}
			}
		}

		this.m.Danger = currentDanger;
		return true;
	}

	function getDangerFromActor( _actor, _target, _entity )
	{
		local d = this.queryActorTurnsNearTarget(_actor, _target, _entity);

		if (d.Turns <= this.Const.AI.Behavior.RangedEngageKeepMinTurnsAway && d.InZonesOfControl < 2)
		{
			if (d.InZonesOfOccupation != 0 || _actor.getCurrentProperties().IsRooted)
			{
				return 1.0;
			}
			else
			{
				return (1.0 - d.Turns) * 6.0;
			}
		}
		else
		{
			return 0.0;
		}
	}

});

