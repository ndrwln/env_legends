this.behavior <- {
	m = {
		ID = null,
		Order = 0,
		Agent = null,
		Score = 0,
		Thread = null,
		IsShieldwallAvailable = null,
		IsThreaded = false,
		IsFirstExecuted = false
	},
	function getID()
	{
		return this.m.ID;
	}

	function getName()
	{
		return this.Const.AI.Behavior.Name[this.m.ID];
	}

	function getOrder()
	{
		return this.m.Order;
	}

	function getScore()
	{
		return this.m.Score;
	}

	function getAgent()
	{
		return this.m.Agent;
	}

	function getStrategy()
	{
		return this.Tactical.Entities.getStrategy(this.m.Agent.getActor().getFaction());
	}

	function setAgent( _a )
	{
		if (typeof _a == "instance")
		{
			this.m.Agent = _a;
		}
		else
		{
			this.m.Agent = this.WeakTableRef(_a);
		}
	}

	function create()
	{
	}

	function isAllottedTimeReached( _t )
	{
		return this.Time.getExactTime() - _t > this.Const.AI.AllottedTimePerEvaluationRun && (!this.Const.AI.ParallelizationMode || this.Root.isBackgroundTaskSuspended());
	}

	function evaluate( _entity )
	{
		if (this.getProperties().BehaviorMult[this.m.ID] == 0)
		{
			this.m.Score = 0;
			return true;
		}

		this.m.IsFirstExecuted = true;
		local startTime = this.Time.getExactTime();

		if (this.m.IsThreaded)
		{
			local score;

			if (this.m.Thread == null)
			{
				this.m.Thread = this.onEvaluate(_entity);
			}

			score = resume this.m.Thread;

			if (this.getID() != this.Const.AI.Behavior.ID.Idle && score > 0 && score < 10)
			{
				score = 10;
			}

			if (this.Const.AI.BenchmarkMode && !_entity.isPlayerControlled())
			{
				local timeTaken = this.Time.getExactTime() - startTime;
				this.logInfo("[] Evaluating " + this.Const.AI.Behavior.Name[this.getID()] + " took " + timeTaken + " seconds. Frame: " + this.Time.getFrame());
			}

			if (score != null)
			{
				this.m.Thread = null;
				this.m.Score = score;
				return true;
			}
		}
		else
		{
			this.m.Score = this.onEvaluate(_entity);

			if (this.getID() != this.Const.AI.Behavior.ID.Idle && this.m.Score > 0 && this.m.Score < 10)
			{
				this.m.Score = 10;
			}

			if (this.Const.AI.BenchmarkMode && !_entity.isPlayerControlled())
			{
				local timeTaken = this.Time.getExactTime() - startTime;
				this.logInfo("[] Evaluating " + this.Const.AI.Behavior.Name[this.getID()] + " took " + timeTaken + " seconds. Frame: " + this.Time.getFrame());
			}

			return true;
		}

		return false;
	}

	function execute( _entity )
	{
		return this.onExecute(_entity);
	}

	function onEvaluate( _entity )
	{
		return 0;
	}

	function onBeforeExecute( _entity )
	{
	}

	function onExecute( _entity )
	{
		return true;
	}

	function onTurnStarted()
	{
	}

	function onTurnResumed()
	{
	}

	function onReset()
	{
		this.m.IsShieldwallAvailable = null;
	}

	function getProperties()
	{
		return this.m.Agent.getProperties();
	}

	function interpolate( _a, _b, _f )
	{
		return this.Math.maxf(0.0, _a) * (1.0 - _f) + this.Math.maxf(0.0, _b) * _f;
	}

	function clamp( _a, _min, _max )
	{
		if (_a < _min)
		{
			_a = _min;
		}
		else if (_a > _max)
		{
			_a = _max;
		}

		return _a;
	}

	function queryTargetValue( _entity, _target, _skill = null )
	{
		local score = 0.0;
		local expectedDamage;
		local armorValue = _target.getArmor(this.Const.BodyPart.Body) * (_entity.getCurrentProperties().getHitchance(this.Const.BodyPart.Body) / 100.0) + _target.getArmor(this.Const.BodyPart.Head) * (_entity.getCurrentProperties().getHitchance(this.Const.BodyPart.Head) / 100.0);

		if (_skill != null)
		{
			expectedDamage = _skill.getExpectedDamage(_target);
		}
		else if (_entity.getSkills().getAttackOfOpportunity() != null)
		{
			expectedDamage = _entity.getSkills().getAttackOfOpportunity().getExpectedDamage(_target);
		}
		else
		{
			local critical = 1.0 + _entity.getCurrentProperties().getHitchance(this.Const.BodyPart.Head) / 100.0 * (_entity.getCurrentProperties().DamageAgainstMult[this.Const.BodyPart.Head] - 1.0);
			expectedDamage = {
				ArmorDamage = _entity.getCurrentProperties().getArmorDamageAverage(),
				HitpointDamage = 0,
				DirectDamage = 0,
				TotalDamage = 0
			};
			expectedDamage.DirectDamage = this.Math.max(0, _entity.getCurrentProperties().getRegularDamageAverage() * (_entity.getCurrentProperties().IsIgnoringArmorOnAttack ? 1.0 : 0.25) * critical - armorValue * this.Const.Combat.ArmorDirectDamageMitigationMult);
			expectedDamage.HitpointDamage = _entity.getCurrentProperties().getRegularDamageAverage() * critical - expectedDamage.DirectDamage;
			expectedDamage.TotalDamage = expectedDamage.ArmorDamage + expectedDamage.HitpointDamage + expectedDamage.DirectDamage;
		}

		local targetTile = _target.getTile();
		local myTile = _entity.getTile();
		local hitchance;

		if (_skill != null)
		{
			hitchance = _skill.getHitchance(_target);
		}
		else
		{
			hitchance = _entity.getCurrentProperties().getMeleeSkill() - _target.getCurrentProperties().getMeleeDefense();
		}

		local hitpoints = this.Math.minf(1.0, (expectedDamage.HitpointDamage + expectedDamage.DirectDamage) / _target.getHitpoints());

		if (!_entity.getCurrentProperties().IsIgnoringArmorOnAttack && (!_skill || _skill.getDirectDamage() < 1.0))
		{
			local armor = expectedDamage.ArmorDamage / this.Math.maxf(1.0, armorValue);
			local hpVSarmor = 1.0;

			if (armorValue > 0 && armorValue > _target.getHitpoints())
			{
				hpVSarmor = this.Math.minf(1.0, _target.getHitpoints() / armorValue);
			}
			else if (armorValue > 0 && armorValue < _target.getHitpoints())
			{
				hpVSarmor = 1.0 - this.Math.minf(1.0, armorValue / _target.getHitpoints());
			}
			else if (armorValue > 0 && armorValue == _target.getHitpoints())
			{
				hpVSarmor = 0.5;
			}

			hitpoints = this.Math.minf(1.0, hitpoints * hpVSarmor + armor * (1.0 - hpVSarmor));
		}

		score = score + hitchance / 100.0 * this.getProperties().TargetPriorityHitchanceMult * this.Const.AI.Behavior.GlobalHitchanceValueMult;

		if (expectedDamage.TotalDamage > 0)
		{
			score = score + expectedDamage.TotalDamage / this.Math.maxf(1, _entity.getCurrentProperties().getRegularDamageAverage() + _entity.getCurrentProperties().getArmorDamageAverage()) * this.getProperties().TargetPriorityDamageMult;
		}

		score = score + hitpoints * this.getProperties().TargetPriorityHitpointsMult;
		score = score + (1.0 - _target.getCurrentProperties().Bravery / 100.0) * this.getProperties().TargetPriorityBraveryMult;
		score = score + this.Math.rand(1, 100) * 0.01 * this.getProperties().TargetPriorityRandomMult;

		if (!_entity.getCurrentProperties().IsIgnoringArmorOnAttack && (!_skill || _skill.getDirectDamage() < 1.0))
		{
			local armorPriority = this.getProperties().TargetPriorityArmorMult * (0.75 + _entity.getCurrentProperties().getDamageArmorMult() * 0.25);

			if (armorPriority < 1.0)
			{
				score = score - (_target.getArmor(this.Const.BodyPart.Body) + _target.getArmor(this.Const.BodyPart.Head)) / 500.0 * (1.0 - armorPriority) * 0.5;
			}
			else if (armorPriority > 1.0)
			{
				score = score + this.Math.abs(1.0 - (_target.getArmor(this.Const.BodyPart.Body) + _target.getArmor(this.Const.BodyPart.Head)) / 500.0 * armorPriority) * 0.5;
			}
		}

		if (_target.getMoraleState() < this.Const.MoraleState.Confident)
		{
			score = score + 0.1 * (this.Const.MoraleState.Confident - _target.getMoraleState()) * this.getProperties().TargetPriorityMoraleMult;
		}

		if (_skill == null)
		{
			local weapon = _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
			local shield = _target.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

			if (shield != null && weapon != null && weapon.isAgainstShields())
			{
				score = score + 0.1;
			}
		}

		if (_skill == null && _target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && _target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isItemType(this.Const.Items.ItemType.TwoHanded) && !_target.getCurrentProperties().IsImmuneToStun)
		{
			if (_entity.getSkills().hasSkill("actives.knock_out") || _entity.getSkills().hasSkill("actives.strike_down") || _entity.getSkills().hasSkill("actives.knock_over") || _entity.getSkills().hasSkill("actives.charge") || _entity.getSkills().hasSkill("actives.disarm"))
			{
				score = score + 0.1;
			}
		}

		if (this.getProperties().TargetPriorityDebilitatedMult != 1.0)
		{
			if (_target.getSkills().hasSkill("effects.dazed") || _entity.getSkills().hasSkill("effects.stunned") || _entity.getSkills().hasSkill("effects.sleeping"))
			{
				score = score * this.getProperties().TargetPriorityDebilitatedMult;
			}
		}

		if (_skill != null && targetTile.getDistanceTo(myTile) == 1 && _target.getSkills().hasSkill("effects.riposte"))
		{
			score = score * this.getProperties().TargetPriorityCounterSkillsMult;
		}

		if (!_target.isNonCombatant())
		{
			if ((expectedDamage.HitpointDamage + expectedDamage.DirectDamage) * this.getProperties().TargetPriorityFinishTreshhold >= _target.getHitpoints())
			{
				score = score * (_skill != null ? this.getProperties().TargetPriorityFinishOpponentMult : this.Math.maxf(1.0, this.getProperties().TargetPriorityFinishOpponentMult * 0.66));
			}
			else if (_target.getHitpoints() <= 10 && (_target.getArmor(this.Const.BodyPart.Body) == 0 || _target.getArmor(this.Const.BodyPart.Head) == 0))
			{
				score = score * (_skill != null ? this.getProperties().TargetPriorityFinishOpponentMult : this.Math.maxf(1.0, this.getProperties().TargetPriorityFinishOpponentMult * 0.66));
			}

			if (expectedDamage.ArmorDamage * this.getProperties().TargetPriorityFinishTreshhold >= armorValue)
			{
				score = score * (_skill != null ? this.getProperties().TargetPriorityFinishArmorMult : this.Math.maxf(1.0, this.getProperties().TargetPriorityFinishArmorMult * 0.66));
			}
		}

		if (_target.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			score = score * this.getProperties().TargetPriorityFleeingMult;
		}

		if ((_skill == null || _skill.isRanged()) && this.isRangedUnit(_target))
		{
			score = score * this.getProperties().EngageTargetArmedWithRangedWeaponMult;
		}

		score = score * _target.getCurrentProperties().TargetAttractionMult;

		if (this.getAgent().getForcedOpponent() != null && this.getAgent().getForcedOpponent().getID() == _target.getID())
		{
			score = score * 1000.0;
		}
		else if (_target.isPlayerControlled())
		{
			if ((_target.getLevel() <= 2 && this.getStrategy().getAveragePlayerLevel() >= 6 || _target.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand) == null) && _target.getArmorMax(this.Const.BodyPart.Body) + _target.getArmorMax(this.Const.BodyPart.Head) <= this.getStrategy().getAveragePlayerArmor() * 0.33)
			{
				score = score * this.Const.AI.Behavior.LikelyPlayerBaitMult;
			}
		}
		else if ((this.isKindOf(_target, "wardog") || this.isKindOf(_target, "warhound")) && _target.getFaction() == this.Const.Faction.PlayerAnimals && _skill != null)
		{
			score = score * this.Const.AI.Behavior.LikelyPlayerBaitMult;
		}

		if (_entity.getHitpoints() <= 10 && (_entity.getSkills().hasSkill("effects.bleeding") || _entity.getSkills().hasSkill("effects.spider_poison")) || _entity.getHitpoints() <= 20 && _entity.getSkills().hasSkill("effects.holy_water"))
		{
			score = score * this.Const.AI.Behavior.AttackWhenAlmostDeadMult;
		}

		return this.Math.maxf(0.01, score);
	}

	function queryBestMeleeTarget( _entity, _skill, _targets )
	{
		local bestTarget;
		local bestScore = -9000;
		local ret = {
			Score = 0.0,
			Target = null
		};

		foreach( target in _targets )
		{
			if (_skill != null && !_skill.isUsableOn(target.getTile()))
			{
				continue;
			}

			local score = this.queryTargetValue(_entity, target, _skill);

			if (score > bestScore)
			{
				bestTarget = target;
				bestScore = score;
			}
		}

		if (bestTarget != null)
		{
			ret.Score = bestScore;
			ret.Target = bestTarget;
		}

		return ret;
	}

	function queryBestRangedTarget( _entity, _skill, _targets, _maxRange = 0 )
	{
		local bestTarget;
		local bestScore = -9000;
		local myTile = _entity.getTile();
		local ret = {
			Score = 0.0,
			Target = null
		};

		foreach( target in _targets )
		{
			local targetTile = target.getTile();

			if (_skill != null)
			{
				if (!_skill.isUsableOn(targetTile))
				{
					continue;
				}
			}
			else if (!targetTile.IsVisibleForEntity || myTile.getDistanceTo(targetTile) > _maxRange + this.Math.max(0, myTile.Level - targetTile.Level))
			{
				continue;
			}

			local score = this.queryTargetValue(_entity, target, _skill);
			local alliesAdjacent = 0;
			local blockedTiles = this.Const.Tactical.Common.getBlockedTiles(myTile, targetTile, _entity.getFaction());

			foreach( tile in blockedTiles )
			{
				if (!tile.IsOccupiedByActor || tile.getEntity().isAlliedWith(_entity))
				{
					score = score * this.Const.AI.Behavior.AttackLineOfFireBlockedMult;
					break;
				}
			}

			for( local i = 0; i < this.Const.Direction.COUNT; i = ++i )
			{
				if (!targetTile.hasNextTile(i))
				{
				}
				else
				{
					local tile = targetTile.getNextTile(i);

					if (tile.IsEmpty)
					{
					}
					else if (tile.IsOccupiedByActor)
					{
						if (tile.getEntity().isAlliedWith(_entity))
						{
							if (this.getProperties().TargetPriorityHittingAlliesMult < 1.0)
							{
								score = score - 1.0 / 6.0 * 4.0 * (1.0 - this.getProperties().TargetPriorityHittingAlliesMult);
							}

							alliesAdjacent = ++alliesAdjacent;
						}
						else
						{
							score = score + 1.0 / 6.0 * this.queryTargetValue(_entity, tile.getEntity(), null) * this.Const.AI.Behavior.AttackRangedHitBystandersMult;
						}
					}
				}
			}

			if (this.getProperties().TargetPriorityHittingAlliesMult < 1.0 && alliesAdjacent > this.Const.AI.Behavior.AttackRangedMaxAlliesAdjacent)
			{
				continue;
			}

			if (score > bestScore)
			{
				bestTarget = target;
				bestScore = score;
			}
		}

		if (bestTarget != null)
		{
			ret.Score = bestScore;
			ret.Target = bestTarget;
		}

		return ret;
	}

	function queryEnemiesInMeleeRange( _minRange = 1, _maxRange = 1, _for = null )
	{
		local entity = _for != null ? _for : this.getAgent().getActor();
		local result = {
			Actor = entity,
			Targets = []
		};
		this.Tactical.queryActorsInRange(entity.getTile(), _minRange, _maxRange, this.onQueryEnemyInMeleeRange, result);
		return result.Targets;
	}

	function queryAlliesInMeleeRange( _minRange = 1, _maxRange = 1, _for = null )
	{
		local entity = _for != null ? _for : this.getAgent().getActor();
		local result = {
			Actor = entity,
			Targets = []
		};
		this.Tactical.queryActorsInRange(entity.getTile(), _minRange, _maxRange, this.onQueryAllyInMeleeRange, result);
		return result.Targets;
	}

	function queryTargetsInMeleeRange( _minRange = 1, _maxRange = 1, _maxLevelDifference = 1, _origin = null )
	{
		if (_origin == null)
		{
			_origin = this.getAgent().getActor().getTile();
		}

		local result = {
			Actor = this.getAgent().getActor(),
			Targets = [],
			LevelDifference = _maxLevelDifference
		};
		this.Tactical.queryActorsInRange(_origin, _minRange, _maxRange, this.onQueryTargetInMeleeRange, result);
		return result.Targets;
	}

	function onQueryTargetInMeleeRange( _actor, _tag )
	{
		if (!_actor.isAlive() || !_actor.isAttackable())
		{
			return;
		}

		if (!_actor.getTile().IsVisibleForEntity || _actor.isAlliedWith(_tag.Actor))
		{
			return;
		}

		if (this.Math.abs(_actor.getTile().Level - _tag.Actor.getTile().Level) > _tag.LevelDifference)
		{
			return;
		}

		_tag.Targets.push(_actor);
	}

	function onQueryAllyInMeleeRange( _actor, _tag )
	{
		if (!_actor.isAlive() || !_actor.isAttackable())
		{
			return;
		}

		if (!_actor.getTile().IsVisibleForEntity || !_actor.isAlliedWith(_tag.Actor))
		{
			return;
		}

		if (this.Math.abs(_actor.getTile().Level - _tag.Actor.getTile().Level) > 1)
		{
			return;
		}

		_tag.Targets.push(_actor);
	}

	function onQueryEnemyInMeleeRange( _actor, _tag )
	{
		if (!_actor.isAlive() || !_actor.isAttackable())
		{
			return;
		}

		if (!_actor.getTile().IsVisibleForEntity || _actor.isAlliedWith(_tag.Actor))
		{
			return;
		}

		if (this.Math.abs(_actor.getTile().Level - _tag.Actor.getTile().Level) > 1)
		{
			return;
		}

		_tag.Targets.push(_actor);
	}

	function queryDestinationsInRange( _targetTile, _minRange, _maxRange, _maxLevelDifference = 1 )
	{
		if (_minRange == 1 && _maxRange == 1)
		{
			local result = [];

			for( local i = 0; i != this.Const.Direction.COUNT; i = ++i )
			{
				if (!_targetTile.hasNextTile(i))
				{
				}
				else
				{
					local tile = _targetTile.getNextTile(i);

					if (tile.IsEmpty && this.Math.abs(tile.Level - _targetTile.Level) <= 1)
					{
						result.push(tile);
					}
				}
			}

			return result;
		}
		else
		{
			local result = {
				TargetTile = _targetTile,
				Destinations = []
			};
			this.Tactical.queryTilesInRange(_targetTile, _minRange, _maxRange, true, [], _maxLevelDifference == 1 ? this.onQueryDestinationInMeleeRange : this.onQueryDestinationInRange, result);
			return result.Destinations;
		}
	}

	function onQueryDestinationInMeleeRange( _tile, _tag )
	{
		if (this.Math.abs(_tile.Level - _tag.TargetTile.Level) > 1)
		{
			return;
		}

		_tag.Destinations.push(_tile);
	}

	function onQueryDestinationInRange( _tile, _tag )
	{
		_tag.Destinations.push(_tile);
	}

	function querySpearwallValueForTile( _entity, _tile )
	{
		if (this.getProperties().EngageAgainstSpearwallMult == 0.0)
		{
			return 0.0;
		}

		local spearwallCount = 0;

		for( local j = 0; j < this.Const.Direction.COUNT; j = ++j )
		{
			if (!_tile.hasNextTile(j))
			{
			}
			else
			{
				local checkTile = _tile.getNextTile(j);

				if (!checkTile.IsOccupiedByActor || this.Math.abs(_tile.Level - checkTile.Level) > 1)
				{
				}
				else
				{
					local opponent = checkTile.getEntity();

					if (!opponent.isAlliedWith(_entity) && opponent.getCurrentProperties().IsAttackingOnZoneOfControlEnter && (!checkTile.hasZoneOfControlOtherThan(opponent.getAlliedFactions()) || opponent.getCurrentProperties().IsAttackingOnZoneOfControlAlways))
					{
						spearwallCount = ++spearwallCount;
					}
				}
			}
		}

		if (spearwallCount == 0)
		{
			return 0.0;
		}

		local score = spearwallCount * this.getProperties().EngageAgainstSpearwallMult;

		if (this.m.IsShieldwallAvailable == null)
		{
			this.m.IsShieldwallAvailable = _entity.getSkills().hasSkill("effects.shieldwall");
		}

		if (this.m.IsShieldwallAvailable)
		{
			score = score * this.getProperties().EngageAgainstSpearwallWithShieldwallMult;
		}

		return score;
	}

	function queryOpponentMagnitude( _tile, _maxDistance )
	{
		local ret = {
			Opponents = 0.0,
			AverageDistanceScore = 0.0,
			AverageEngaged = 0.0
		};
		local opponentsMelee = 0;
		_maxDistance = _maxDistance * 1.0;
		local targets = this.getAgent().getKnownOpponents();

		foreach( t in targets )
		{
			if (t.Actor.isNull())
			{
				continue;
			}

			if (t.Actor.getMoraleState() == this.Const.MoraleState.Fleeing)
			{
				continue;
			}

			local dist = t.Actor.getTile().getDistanceTo(_tile);

			if (dist <= _maxDistance)
			{
				++ret.Opponents;
				ret.AverageDistanceScore += (dist - 1) / _maxDistance;

				if (!t.Actor.isArmedWithRangedWeapon())
				{
					if (t.Actor.getAIAgent().getOrders().IsEngaging || t.Actor.getTile().hasZoneOfControlOtherThan(t.Actor.getAlliedFactions()))
					{
						++ret.AverageEngaged;
					}

					opponentsMelee = ++opponentsMelee;
				}
			}
		}

		if (ret.Opponents != 0)
		{
			ret.AverageDistanceScore /= ret.Opponents;
			ret.AverageEngaged /= this.Math.max(1, opponentsMelee);
		}

		return ret;
	}

	function queryAllyMagnitude( _tile, _maxDistance )
	{
		local ret = {
			Allies = 0.0,
			AverageDistanceScore = 0.0,
			AverageEngaged = 0.0,
			Magnetism = 0.0,
			AverageMagnetism = 0.0
		};
		local alliesMelee = 0;
		_maxDistance = _maxDistance * 1.0;
		local targets = this.getAgent().getKnownAllies();

		foreach( t in targets )
		{
			if (t.getMoraleState() == this.Const.MoraleState.Fleeing)
			{
				continue;
			}

			local dist = t.getTile().getDistanceTo(_tile);

			if (dist <= _maxDistance)
			{
				ret.Allies += 1.0;
				ret.AverageDistanceScore += 1.0 - (dist - 1) / _maxDistance;
				ret.Magnetism += t.getAIAgent().getProperties().OverallMagnetismMult * t.getCurrentProperties().TargetAttractionMult;

				if (!t.isArmedWithRangedWeapon())
				{
					if (t.getAIAgent().getOrders().IsEngaging || t.getTile().hasZoneOfControlOtherThan(t.getAlliedFactions()))
					{
						++ret.AverageEngaged;
					}

					alliesMelee = ++alliesMelee;
				}
			}
		}

		if (ret.Allies != 0)
		{
			ret.AverageDistanceScore /= ret.Allies;
			ret.AverageEngaged /= this.Math.max(1, alliesMelee);
			ret.AverageMagnetism = ret.Magnetism / ret.Allies;
		}

		return ret;
	}

	function queryActorTurnsNearTarget( _actor, _target, _entity )
	{
		local actorTile = _actor.getTile();
		local entityTile = _entity.getTile();
		local ret = {
			Turns = 9000.0,
			TurnsWithAttack = 9000.0,
			InZonesOfControl = actorTile.getZoneOfControlCountOtherThan(_actor.getAlliedFactions()),
			InZonesOfOccupation = actorTile.getZoneOfOccupationCountOtherThan(_actor.getAlliedFactions())
		};

		if (_actor.isNonCombatant())
		{
			return ret;
		}

		local distance = actorTile.getDistanceTo(_target);

		if (distance <= 1)
		{
			ret.Turns = 0.0;
			ret.TurnsWithAttack = 0.0;
			return ret;
		}
		else if (distance >= 10)
		{
			return ret;
		}

		local navigator = this.Tactical.getNavigator();
		local settings = navigator.createSettings();
		settings.ActionPointCosts = _actor.getActionPointCosts();
		settings.ActionPointCostPerLevel = _actor.getLevelActionPointCost();
		settings.FatigueCostFactor = 0.0;
		settings.AllowZoneOfControlPassing = true;
		settings.ZoneOfControlCost = 2;
		settings.AlliedFactions = _actor.getAlliedFactions();
		settings.Faction = _actor.getFaction();
		settings.TileToConsiderEmpty = entityTile;

		if (navigator.findPath(actorTile, _target, settings, 1))
		{
			ret.Turns = navigator.getTurnsRequiredForPath(_actor, settings, _actor.getActionPointsMax(), entityTile, _entity.getFaction());
			ret.TurnsWithAttack = ret.Turns + 1.0 / this.Math.maxf(1.0, _actor.getActionPointsMax()) * 4;
			return ret;
		}

		return ret;
	}

	function getPotentialDanger( _includeRanged )
	{
		local targets = this.getAgent().getKnownOpponents();
		local potentialDanger = [];

		foreach( t in targets )
		{
			if (t.Actor.isNull() || !t.Actor.isAlive())
			{
				continue;
			}

			if (t.Actor.getMoraleState() != this.Const.MoraleState.Fleeing && !t.Actor.getCurrentProperties().IsStunned && !t.Actor.getCurrentProperties().IsRooted && !t.Actor.isNonCombatant() && (_includeRanged || !this.isRangedUnit(t.Actor)) && t.Actor.getHitpoints() / t.Actor.getHitpointsMax() >= this.Const.AI.Behavior.MinDangerHitpointsPct && t.Actor.getTile().getZoneOfControlCountOtherThan(t.Actor.getAlliedFactions()) < this.Const.AI.Behavior.IgnoreDangerMinZones)
			{
				potentialDanger.push(t.Actor.get());
			}
		}

		return potentialDanger;
	}

	function selectSkill( _potentialSkills )
	{
		local entity = this.getAgent().getActor();
		local skills = [];
		local chance = 0;

		foreach( skillID in _potentialSkills )
		{
			local skill = entity.getSkills().getSkillByID(skillID);

			if (skill != null && skill.isUsable() && skill.isAffordable())
			{
				local thisChance = 0;
				thisChance = thisChance + 3 * (entity.getActionPoints() - skill.getActionPointCost());
				thisChance = thisChance + (entity.getFatigueMax() - skill.getFatigueCost() * entity.getCurrentProperties().FatigueEffectMult);
				chance = chance + thisChance;
				skills.push(skill);
			}
		}

		if (skills.len() == 0)
		{
			return null;
		}
		else if (skills.len() == 1)
		{
			return skills[0];
		}

		local pick = this.Math.rand(1, chance);

		foreach( skill in skills )
		{
			local thisChance = 0;
			thisChance = thisChance + 3 * (entity.getActionPoints() - skill.getActionPointCost());
			thisChance = thisChance + (entity.getFatigueMax() - skill.getFatigueCost() * entity.getCurrentProperties().FatigueEffectMult);

			if (pick <= thisChance)
			{
				return skill;
			}

			pick = pick - thisChance;
		}

		return null;
	}

	function getFatigueScoreMult( _skill )
	{
		local entity = this.getAgent().getActor();

		if (entity.getCurrentProperties().FatigueEffectMult == 0.0)
		{
			return 1.0;
		}

		local apPct = _skill.getActionPointCost() / (entity.getActionPointsMax() * 1.0);
		local fatigue = this.Math.max(0, _skill.getFatigueCost() - entity.getCurrentProperties().FatigueRecoveryRate * entity.getCurrentProperties().FatigueRecoveryRateMult * apPct);
		local currentFatigue = entity.getFatigue();
		local maxFatigue = entity.getFatigueMax();
		return 0.4 + (1.0 - fatigue / (maxFatigue - currentFatigue)) * 0.6;
	}

	function isRangedUnit( _entity )
	{
		local hasRangedWeapon = _entity.hasRangedWeapon();

		if (hasRangedWeapon && _entity.getCurrentProperties().getVision() > 4 && (_entity.isPlayerControlled() && _entity.getCurrentProperties().RangedSkill >= 45 || !_entity.isPlayerControlled() && _entity.getAIAgent().getProperties().IsRangedUnit))
		{
			return true;
		}

		return false;
	}

	function hasNegativeTileEffect( _tile, _entity )
	{
		return _tile.Properties.Effect != null && !_tile.Properties.Effect.IsPositive && _tile.Properties.Effect.Applicable(_entity);
	}

};

