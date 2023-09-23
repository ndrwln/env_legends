this.ai_attack_terror <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		TargetScore = 0.0,
		PossibleSkills = [
			"actives.horrific_scream"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Terror;
		this.m.Order = this.Const.AI.Behavior.Order.Terror;
		this.m.IsThreaded = true;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		// Function is a generator.
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
		local targets = [];
		local knownOpponents = this.getAgent().getKnownOpponents();
		local myTile = _entity.getTile();

		foreach( opp in knownOpponents )
		{
			if (opp.Actor.isNull())
			{
				continue;
			}

			local dist = myTile.getDistanceTo(opp.Actor.getTile());

			if (dist > this.m.Skill.getMaxRange() || dist < this.m.Skill.getMinRange())
			{
				continue;
			}

			targets.push(opp.Actor);
		}

		if (targets.len() == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local func = this.getBestTarget(_entity, this.m.Skill, targets);

		while (resume func == null)
		{
			yield null;
		}

		if (this.m.TargetTile == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		return this.Const.AI.Behavior.Score.Terror * this.m.TargetScore * score;
	}

	function onExecute( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToTarget(this.m.TargetTile);
			this.m.IsFirstExecuted = false;
			return false;
		}

		if (this.m.TargetTile != null)
		{
			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + _entity.getName() + ": Using Horrific Scream against " + this.m.TargetTile.getEntity().getName() + "!");
			}

			this.m.Skill.use(this.m.TargetTile);

			if (!_entity.isHiddenToPlayer() || this.m.TargetTile.IsVisibleForPlayer)
			{
				this.getAgent().declareAction();
			}

			this.m.TargetTile = null;
		}

		return true;
	}

	function getBestTarget( _entity, _skill, _targets )
	{
		// Function is a generator.
		this.m.TargetTile = null;
		this.m.TargetScore = 0.0;
		local bestTarget;
		local bestScore = 0.0;
		local myTile = _entity.getTile();
		local time = this.Time.getExactTime();

		foreach( target in _targets )
		{
			if (target.getMoraleState() == this.Const.MoraleState.Fleeing || target.getMoraleState() == this.Const.MoraleState.Ignore)
			{
				continue;
			}

			if (this.isAllottedTimeReached(time))
			{
				yield null;
				time = this.Time.getExactTime();
			}

			if (target.getCurrentProperties().IsStunned)
			{
				continue;
			}

			if (_skill.onVerifyTarget(_entity.getTile(), target.getTile()))
			{
				local score = this.Math.max(1, 120 - target.getBravery());
				score = score * (target.getHitpoints() / (target.getHitpointsMax() * 1.0));
				score = score * (target.getMoraleState() / (this.Const.MoraleState.Confident * 1.0));
				score = score * (1.0 / target.getCurrentProperties().MoraleCheckBraveryMult[this.Const.MoraleCheckType.MentalAttack]);

				if (target.getSkills().hasSkill("effects.spearwall"))
				{
					score = score * this.Const.AI.Behavior.TerrorSpearwallMult;
				}

				if (target.getSkills().hasSkill("effects.shieldwall"))
				{
					score = score * this.Const.AI.Behavior.TerrorShieldwallMult;
				}

				if (target.getSkills().hasSkill("effects.riposte"))
				{
					score = score * this.Const.AI.Behavior.TerrorRiposteMult;
				}

				if (target.getTile().getDistanceTo(myTile) == 1)
				{
					score = score * this.Const.AI.Behavior.TerrorMeleeBonus;
				}

				local ZoC = target.getTile().getZoneOfControlCountOtherThan(target.getAlliedFactions());

				if (ZoC > 0)
				{
					score = score * (ZoC * this.Const.AI.Behavior.TerrorZoCMult);
				}

				local d = target.getTile().getDistanceTo(myTile);

				if (d <= 2 && d <= target.getIdealRange())
				{
					score = score * this.Const.AI.Behavior.TerrorInMeleeWithMe;
				}
				else if (ZoC == 0)
				{
					local d = this.queryActorTurnsNearTarget(target, myTile, target);

					if (d.Turns <= 1.0)
					{
						score = score * this.Const.AI.Behavior.TerrorCanReachMe;
					}
				}

				if (score > bestScore)
				{
					bestTarget = target;
					bestScore = score;
				}
			}
		}

		this.m.TargetScore = bestScore * 0.05;

		if (bestTarget != null)
		{
			this.m.TargetTile = bestTarget.getTile();
		}

		return true;
	}

});

