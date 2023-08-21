this.ai_horror <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		TargetScore = 0,
		PossibleSkills = [
			"actives.horror"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Horror;
		this.m.Order = this.Const.AI.Behavior.Order.Horror;
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

		return this.Const.AI.Behavior.Score.Horror * score + this.m.TargetScore;
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

			for( local i = 0; i < 6; i = ++i )
			{
				if (!tile.hasNextTile(i))
				{
				}
				else if (tile.Properties.Effect != null)
				{
				}
				else if (tile.getNextTile(i).IsOccupiedByActor)
				{
					targets.push(tile.getNextTile(i).getEntity());
				}
			}

			if (targets.len() == 0)
			{
				continue;
			}

			local score = 0.0;
			local numAffected = 0;

			foreach( target in targets )
			{
				if (_entity.isAlliedWith(target))
				{
					continue;
				}

				if (target.getMoraleState() == this.Const.MoraleState.Ignore || target.getMoraleState() == this.Const.MoraleState.Fleeing)
				{
					continue;
				}

				local targetTile = target.getTile();
				local target_score = this.m.Skill.getMaxRange() - _myTile.getDistanceTo(target.getTile());

				if (_myTile.getDistanceTo(targetTile) <= target.getIdealRange())
				{
					target_score = target_score + this.Const.AI.Behavior.HorrorAttackingMeBonus;
				}

				target_score = target_score + this.Const.AI.Behavior.HorrorZOCBonus * targetTile.getZoneOfControlCountOtherThan(target.getAlliedFactions());

				if (target.getMoraleState() == this.Const.MoraleState.Breaking)
				{
					target_score = target_score + this.Const.AI.Behavior.HorrorAlmostFleeingBonus;
				}

				if (targetTile.Properties.Effect != null && !targetTile.Properties.Effect.IsPositive && targetTile.Properties.Effect.Applicable(target))
				{
					target_score = target_score + this.Const.AI.Behavior.HorrorNegativeTileEffectBonus;
				}

				target_score = target_score * (1.0 - this.Math.minf(1.0, target.getCurrentProperties().getBravery() * 0.01));
				target_score = target_score * (1.0 / target.getCurrentProperties().MoraleCheckBraveryMult[this.Const.MoraleCheckType.MentalAttack]);

				if (target.isTurnDone() && target.getSkills().hasSkill("effects.adrenaline"))
				{
					target_score = target_score + this.Const.AI.Behavior.HorrorAdrenalineBonus;
				}

				target_score = target_score * target.getCurrentProperties().TargetAttractionMult;

				if (!target.isTurnDone())
				{
					target_score = target_score * this.Const.AI.Behavior.HorrorStillToActMult;
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

