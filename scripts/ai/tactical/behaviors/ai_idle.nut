this.ai_idle <- this.inherit("scripts/ai/tactical/behavior", {
	m = {},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Idle;
		this.m.Order = this.Const.AI.Behavior.Order.Idle;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		if (this.getAgent().getID() != this.Const.AI.Agent.ID.Player && this.Tactical.State.isAutoRetreat() && !this.getStrategy().getStats().IsEngaged)
		{
			if (!_entity.getTile().IsVisibleForPlayer && !this.isRangedUnit(_entity))
			{
				return this.Const.AI.Behavior.Score.IdleOnPlayerRetreat;
			}

			local myTile = _entity.getTile();
			local targets = this.getAgent().getKnownOpponents();
			local closeEnough = false;

			foreach( t in targets )
			{
				local d = t.Actor.getTile().getDistanceTo(myTile);

				if (d <= 6 || d <= _entity.getIdealRange() || d <= this.getProperties().EngageRangeMax)
				{
					closeEnough = true;
					break;
				}
			}

			if (!closeEnough)
			{
				return this.Const.AI.Behavior.Score.IdleOnPlayerRetreat;
			}
		}

		if (this.getAgent().getIntentions().IsRecuperating)
		{
			return this.Const.AI.Behavior.Score.Recuperate;
		}

		return this.Const.AI.Behavior.Score.Idle;
	}

	function onExecute( _entity )
	{
		local attackSkill = _entity.getSkills().getAttackOfOpportunity();
		local apRequiredForAttack = this.Math.max(4, attackSkill != null ? attackSkill.getActionPointCost() : 4);
		local ignoreRetreatingPlayer = this.Tactical.State.isAutoRetreat() && !_entity.getTile().IsVisibleForPlayer && !this.isRangedUnit(_entity);

		if (!ignoreRetreatingPlayer && !_entity.isPlayerControlled() && _entity.getActionPoints() >= apRequiredForAttack && this.Tactical.TurnSequenceBar.hasEnemiesLeftToAct(_entity.getFaction()) && this.Tactical.TurnSequenceBar.entityWaitTurn(_entity))
		{
			if (this.Const.AI.VerboseMode && !_entity.isPlayerControlled())
			{
				this.logInfo("* " + _entity.getName() + ": Waiting with " + _entity.getActionPoints() + " of " + _entity.getActionPointsMax() + " AP left.");
				this.logInfo("* ---------------------------------------------------");
			}
		}
		else
		{
			this.getAgent().setFinished(true);

			if (this.Const.AI.VerboseMode && !_entity.isPlayerControlled())
			{
				this.logInfo("* " + _entity.getName() + ": Ending Turn with " + _entity.getActionPoints() + " of " + _entity.getActionPointsMax() + " AP left.");
				this.logInfo("* ---------------------------------------------------");
			}
		}

		return true;
	}

});

