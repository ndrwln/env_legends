this.ai_defend_spearwall <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		PossibleSkills = [
			"actives.spearwall"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Spearwall;
		this.m.Order = this.Const.AI.Behavior.Order.Spearwall;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.Skill = null;
		local scoreMult = this.getProperties().BehaviorMult[this.m.ID];

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

		scoreMult = scoreMult * this.getFatigueScoreMult(this.m.Skill);

		if (!this.getStrategy().isDefending())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getSkills().hasSkill("effects.adrenaline"))
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local targets = this.getPotentialDanger(false);
		local myTile = _entity.getTile();
		local currentDanger = 0;

		foreach( t in targets )
		{
			local danger = this.queryActorTurnsNearTarget(t, myTile, _entity);

			if (danger.Turns <= 1.0)
			{
				currentDanger = currentDanger + (1.0 - danger.Turns);
			}
		}

		if (currentDanger == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (currentDanger > 1.0)
		{
			scoreMult = scoreMult * currentDanger;
		}

		scoreMult = scoreMult * (1.0 + (1.0 - this.Math.minf(1.0, _entity.getCurrentProperties().FatigueEffectMult)) * 0.5);

		if (this.getAgent().getBehavior(this.Const.AI.Behavior.ID.Defend) != null && this.getAgent().getBehavior(this.Const.AI.Behavior.ID.Defend).getScore() >= this.Const.AI.Behavior.Score.Spearwall * scoreMult)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		return this.Const.AI.Behavior.Score.Spearwall * scoreMult;
	}

	function onBeforeExecute( _entity )
	{
		this.getAgent().getOrders().IsEngaging = false;
		this.getAgent().getOrders().IsDefending = true;
		this.getAgent().getIntentions().IsDefendingPosition = true;
	}

	function onExecute( _entity )
	{
		if (this.Const.AI.VerboseMode)
		{
			this.logInfo("* " + _entity.getName() + ": Using Spearwall!");
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

