this.ai_buff_command_undead <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		PossibleSkills = [
			"actives.command_undead"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.CommandUndead;
		this.m.Order = this.Const.AI.Behavior.Order.CommandUndead;
		this.m.IsThreaded = true;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		// Function is a generator.
		this.m.Skill = null;
		this.m.TargetTile = null;
		local time = this.Time.getExactTime();
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

		if (!this.getAgent().hasKnownAllies())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local targets = this.queryTargetsInMeleeRange();

		if (targets.len() != 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Skill = this.selectSkill(this.m.PossibleSkills);

		if (this.m.Skill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		score = score * this.getFatigueScoreMult(this.m.Skill);
		local targets = this.getAgent().getKnownAllies();
		local opponents = this.getAgent().getKnownOpponents();
		local potentialTargets = [];

		foreach( a in targets )
		{
			if (_entity.getTile().getDistanceTo(a.getTile()) <= this.m.Skill.getMaxRange() && a.getFlags().has("zombie_minion"))
			{
				if (this.isAllottedTimeReached(time))
				{
					yield null;
					time = this.Time.getExactTime();
				}

				if (!this.m.Skill.isUsableOn(a.getTile()))
				{
					continue;
				}

				local score = 0.0;
				local isAlreadyBuffed = a.getSkills().hasSkill("effects.command_undead");

				foreach( d in opponents )
				{
					if (d.Actor.isNull())
					{
						continue;
					}

					local danger = this.queryActorTurnsNearTarget(a, d.Actor.getTile(), a);
					local localDanger = (3.0 - this.Math.minf(3.0, danger.Turns)) * 0.3333 * this.Const.AI.Behavior.CommandUndeadTargetsInRangeMult;
					score = score + localDanger;
				}

				local hitpoints = a.getHitpoints() + a.getArmor(this.Const.BodyPart.Body) + a.getArmor(this.Const.BodyPart.Head);
				local hitpointsMax = a.getHitpointsMax() + a.getArmorMax(this.Const.BodyPart.Body) + a.getArmorMax(this.Const.BodyPart.Head);
				score = score * (hitpoints / hitpointsMax * this.Const.AI.Behavior.CommandUndeadHitpointsMult);

				if (a.getTile().hasZoneOfOccupationOtherThan(a.getAlliedFactions()))
				{
					score = score * this.Const.AI.Behavior.CommandUndeadEngagedMult;
				}

				if (isAlreadyBuffed)
				{
					score = score * this.Const.AI.Behavior.CommandUndeadRefreshMult;
				}

				if (a.getCurrentProperties().IsStunned || !a.getCurrentProperties().IsAbleToUseWeaponSkills)
				{
					score = score * this.Const.AI.Behavior.CommandUndeadStunnedMult;
				}

				if (!a.isTurnDone())
				{
					score = score * this.Const.AI.Behavior.CommandUndeadYetToActMult;
				}

				potentialTargets.push({
					Target = a,
					Score = score,
					IsAlreadyBuffed = isAlreadyBuffed
				});
			}
		}

		if (potentialTargets.len() == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.isAllottedTimeReached(time))
		{
			yield null;
			time = this.Time.getExactTime();
		}

		potentialTargets.sort(this.onSortByScore);
		local scoreMult = 1.0;
		this.m.TargetTile = potentialTargets[0].Target.getTile();

		if (potentialTargets[0].IsAlreadyBuffed)
		{
			scoreMult = scoreMult * this.Const.AI.Behavior.CommandUndeadRefreshMult;
		}

		foreach( d in opponents )
		{
			if (d.Actor.isNull())
			{
				continue;
			}

			local danger = this.queryActorTurnsNearTarget(d.Actor, _entity.getTile(), _entity);
			local localDanger = 1.0 - this.Math.minf(1.0, danger.Turns);
			scoreMult = scoreMult - localDanger * this.Const.AI.Behavior.CommandUndeadDangerMult;
		}

		return this.Const.AI.Behavior.Score.CommandUndead * this.Math.maxf(this.Const.AI.Behavior.CommandUndeadMinScoreMult, scoreMult) * score;
	}

	function onExecute( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToTarget(this.m.TargetTile);
			this.m.IsFirstExecuted = false;
			return false;
		}

		if (this.Const.AI.VerboseMode)
		{
			this.logInfo("* " + _entity.getName() + ": Using Command Undead on " + this.m.TargetTile.getEntity().getName() + "!");
		}

		this.m.Skill.use(this.m.TargetTile);

		if (!_entity.isHiddenToPlayer())
		{
			this.getAgent().declareAction();
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

