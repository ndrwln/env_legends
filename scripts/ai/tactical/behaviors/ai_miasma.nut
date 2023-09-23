this.ai_miasma <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		TargetScore = 0,
		PossibleSkills = [
			"actives.miasma"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Miasma;
		this.m.Order = this.Const.AI.Behavior.Order.Miasma;
		this.m.IsThreaded = false;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.Skill = null;
		this.m.TargetTile = null;
		this.m.TargetScore = 0;
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
		this.selectBestTarget(_entity.getTile(), _entity, this.m.Skill);

		if (this.m.TargetTile == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		return this.Const.AI.Behavior.Score.Miasma * score + this.m.TargetScore;
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

		if (!_entity.isHiddenToPlayer())
		{
			this.getAgent().declareAction();
		}

		this.m.Skill = null;
		this.m.TargetTile = null;
		return true;
	}

	function selectBestTarget( _myTile, _entity, _skill )
	{
		local bestScore = -9000.0;
		local bestTarget;
		local potentialTiles = [];
		local usedIDs = [];
		local opponents = this.getAgent().getKnownOpponents();

		foreach( o in opponents )
		{
			local opponentTile = o.Actor.getTile();

			if (_myTile.getDistanceTo(opponentTile) > _skill.getMaxRange() + 1)
			{
				continue;
			}

			if (usedIDs.find(opponentTile.ID) == null)
			{
				potentialTiles.push(opponentTile);
				usedIDs.push(opponentTile.ID);
			}

			for( local i = 0; i < 6; i = ++i )
			{
				if (!opponentTile.hasNextTile(i))
				{
				}
				else
				{
					local adjacentTile = opponentTile.getNextTile(i);

					if (_myTile.getDistanceTo(opponentTile) > _skill.getMaxRange() + 1)
					{
					}
					else if (usedIDs.find(opponentTile.ID) == null)
					{
						potentialTiles.push(adjacentTile);
						usedIDs.push(adjacentTile.ID);
					}
				}
			}
		}

		if (potentialTiles.len() == 0)
		{
			return 0.0;
		}

		foreach( tile in potentialTiles )
		{
			if (!_skill.isInRange(tile, _myTile) || !_skill.onVerifyTarget(_myTile, tile))
			{
				continue;
			}

			local targets = [];

			if (tile.IsOccupiedByActor)
			{
				targets.push(tile.getEntity());
			}

			local score = 0.0;
			local numAffected = 0;

			for( local i = 0; i < 6; i = ++i )
			{
				if (!tile.hasNextTile(i))
				{
				}
				else
				{
					local nextTile = tile.getNextTile(i);

					if (nextTile.Properties.Effect != null && nextTile.Properties.Effect.Timeout - this.Time.getRound() >= 2)
					{
					}
					else if (nextTile.IsOccupiedByActor)
					{
						targets.push(tile.getNextTile(i).getEntity());
					}
				}
			}

			if (targets.len() == 0)
			{
				continue;
			}

			foreach( target in targets )
			{
				local targetTile = target.getTile();

				if (_entity.isAlliedWith(target) && !target.getFlags().get("undead"))
				{
					score = score - 1.0;
					continue;
				}

				local target_score = _skill.getMaxRange() - _myTile.getDistanceTo(target.getTile());
				target_score = target_score + this.Const.AI.Behavior.MiasmaZOCBonus * target.getTile().getZoneOfControlCountOtherThan(target.getAlliedFactions());

				if (target.getHitpoints() <= 10)
				{
					target_score = target_score + this.Const.AI.Behavior.MiasmaAlmostDeadBonus;
				}

				if (target.getCurrentProperties().IsStunned || target.getCurrentProperties().IsRooted)
				{
					target_score = target_score + this.Const.AI.Behavior.MiasmaStunnedBonus;
				}

				target_score = target_score * target.getCurrentProperties().TargetAttractionMult;

				if (targetTile.Properties.Effect != null && targetTile.Properties.Effect.Type == "miasma" && targetTile.Properties.Effect.Timeout - this.Time.getRound() == 1)
				{
					target_score = target_score * this.Const.AI.Behavior.MiasmaOneTurnLeftMult;
				}

				if (!target.getCurrentProperties().IsStunned && !target.getCurrentProperties().IsRooted && !target.getTile().hasZoneOfControlOtherThan(target.getAlliedFactions()) && !target.isAbleToWait())
				{
					target_score = target_score * this.Const.AI.Behavior.MiasmaVSWaitMult;
				}

				score = score + target_score;
				numAffected = ++numAffected;
			}

			if (numAffected > 1)
			{
				score = score * this.Math.pow(this.Const.AI.Behavior.RootNumAffectedPOW, numAffected - 1);
			}

			if (score > bestScore)
			{
				bestScore = score;
				bestTarget = tile;
			}
		}

		if (bestTarget != null)
		{
			this.m.TargetTile = bestTarget;
			this.m.TargetScore = bestScore;
			return this.Math.maxf(0.1, bestScore * 0.1);
		}
		else
		{
			return 0.0;
		}
	}

});

