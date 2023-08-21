this.ai_teleport <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		PossibleSkills = [
			"actives.teleport"
		],
		Skill = null,
		PossibleFollowupSkills = [
			"actives.gore"
		],
		FollowupSkill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Teleport;
		this.m.Order = this.Const.AI.Behavior.Order.Teleport;
		this.m.IsThreaded = true;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		// Function is a generator.
		this.m.Skill = null;
		this.m.TargetTile = null;
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

		if (_entity.getActionPoints() != _entity.getActionPointsMax())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.Time.getRound() == 1 || this.Tactical.State.isScenarioMode() && this.Time.getRound() == 2)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Skill = this.selectSkill(this.m.PossibleSkills);

		if (this.m.Skill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		score = score * this.getFatigueScoreMult(this.m.Skill);
		this.m.FollowupSkill = this.selectSkill(this.m.PossibleFollowupSkills);

		if (this.m.FollowupSkill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local opponents = this.getAgent().getKnownOpponents();
		local func = this.findBestTarget(_entity, opponents);

		while (resume func == null)
		{
			yield null;
		}

		if (this.m.TargetTile == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		return this.Const.AI.Behavior.Score.Teleport;
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
		this.getAgent().declareEvaluationDelay(3000);
		this.getAgent().declareAction();
		this.m.Skill = null;
		this.m.TargetTile = null;
		return true;
	}

	function findBestTarget( _entity, _targets )
	{
		// Function is a generator.
		local myTile = _entity.getTile();
		local myPos = myTile.SquareCoords;
		local mapSize = this.Tactical.getMapSize();
		local time = this.Time.getExactTime();

		do
		{
			local x = this.Math.rand(3, mapSize.X - 3);
			local y = this.Math.rand(3, mapSize.Y - 3);

			if (!this.Tactical.isValidTileSquare(x, y))
			{
			}
			else
			{
				local tile = this.Tactical.getTileSquare(x, y);

				if (!tile.IsEmpty)
				{
				}
				else if (!this.m.Skill.isUsableOn(tile, myTile))
				{
				}
				else
				{
					if (this.isAllottedTimeReached(time))
					{
						yield null;
						time = this.Time.getExactTime();
					}

					local usable = false;

					foreach( t in _targets )
					{
						local targetTile = t.Actor.getTile();
						local d = targetTile.getDistanceTo(tile);

						if (d > this.m.FollowupSkill.getMaxRange() + 1 || d + 1 < this.m.FollowupSkill.getMinRange())
						{
							continue;
						}

						for( local i = 0; i < 6; i = ++i )
						{
							if (!targetTile.hasNextTile(i))
							{
							}
							else
							{
								local adjacentTile = targetTile.getNextTile(i);

								if (this.m.FollowupSkill.isUsableOn(adjacentTile, tile))
								{
									usable = true;
									break;
								}
							}
						}

						if (usable)
						{
							break;
						}
					}

					if (usable)
					{
						this.m.TargetTile = tile;
						break;
					}
				}
			}
		}
		while (1);

		return true;
	}

});

