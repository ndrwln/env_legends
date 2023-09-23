this.ai_world_flee <- this.inherit("scripts/ai/world/world_behavior", {
	m = {
		DecidedToFleeTime = 0
	},
	function setEnabled( _e )
	{
		this.m.IsEnabled = _e;
	}

	function create()
	{
		this.m.ID = this.Const.World.AI.Behavior.ID.Flee;
		this.world_behavior.create();
	}

	function onSerialize( _out )
	{
		this.world_behavior.onSerialize(_out);
		_out.writeF32(this.m.DecidedToFleeTime);
	}

	function onDeserialize( _in )
	{
		this.world_behavior.onDeserialize(_in);
		this.m.DecidedToFleeTime = _in.readF32();
	}

	function onEvaluate( _entity )
	{
		local scoreMult = 1.0;

		if (!this.m.IsEnabled || scoreMult == 0 || !_entity.isAttackable())
		{
			return this.Const.World.AI.Behavior.Score.Zero;
		}

		if (_entity.getStrength() == 0)
		{
			return this.Const.World.AI.Behavior.Score.Zero;
		}

		if (_entity.isInCombat())
		{
			return this.Const.World.AI.Behavior.Score.Zero;
		}

		if (!this.getController().hasKnownOpponent())
		{
			return this.Const.World.AI.Behavior.Score.Zero;
		}

		if (this.getController().getCurrentOrder() != null && (this.getController().getCurrentOrder().getID() == this.Const.World.AI.Behavior.ID.Guard || this.getController().getCurrentOrder().getID() == this.Const.World.AI.Behavior.ID.Despawn))
		{
			return this.Const.World.AI.Behavior.Score.Zero;
		}

		if (this.Time.getVirtualTimeF() - this.m.DecidedToFleeTime <= this.Const.World.AI.Behavior.FleeMinTime)
		{
			return this.Const.World.AI.Behavior.Score.Flee;
		}

		local opponents = this.getController().getKnownOpponents();
		local myPos = _entity.getPos();
		local numToFleeFrom = 0;
		local canSeeEnemy = false;

		foreach( o in opponents )
		{
			if (o.Entity.isNull() || !o.Entity.isAlive() || !o.Entity.isAttackable() && !o.Entity.isLocation())
			{
				continue;
			}

			if (o.Entity.isLocation())
			{
				continue;
			}

			if (o.Entity.getStrength() == 0)
			{
				continue;
			}

			if (_entity.isAlwaysAttackingPlayer() && o.Entity.isPlayerControlled())
			{
				continue;
			}

			local score = 1.0;
			local dist = this.getVecDistance(myPos, o.Entity.getPos());

			if (dist > this.Const.World.AI.Behavior.AttackMaxRange)
			{
				continue;
			}

			score = score * (1.0 - this.Const.World.AI.Behavior.AttackDistanceMult + (1.0 - dist / this.Const.World.AI.Behavior.AttackMaxRange) * this.Const.World.AI.Behavior.AttackDistanceMult);

			if (_entity.isAbleToSee(o.Entity))
			{
				score = score * this.Const.World.AI.Behavior.FleeFromVisibleTargetMult;
				canSeeEnemy = true;
			}

			if (o.Entity.getStrength() / _entity.getStrength() <= 1.33)
			{
				continue;
			}

			score = score * (o.Entity.getStrength() / (_entity.getStrength() * 1.33));

			if (!o.Entity.isLocation() && _entity.getBaseMovementSpeed() < o.Entity.getBaseMovementSpeed())
			{
				score = score * 0.5 + score * (_entity.getBaseMovementSpeed() / o.Entity.getBaseMovementSpeed()) * 0.5;
			}

			if (score >= this.Const.World.AI.Behavior.FleeMinScore)
			{
				scoreMult = scoreMult + score;
				numToFleeFrom = ++numToFleeFrom;
			}
		}

		if (numToFleeFrom == 0)
		{
			return this.Const.World.AI.Behavior.Score.Zero;
		}

		return this.Const.World.AI.Behavior.Score.Flee;
	}

	function onExecute( _entity, _hasChanged )
	{
		if (_hasChanged || _entity.getPath() == null || this.Time.getVirtualTimeF() - this.m.DecidedToFleeTime >= this.Const.World.AI.Behavior.FleeMinTime)
		{
			this.m.DecidedToFleeTime = this.Time.getVirtualTimeF();
			local myTile = _entity.getTile();
			local myPos = _entity.getPos();
			local entities = clone this.getController().getKnownOpponents();
			entities.extend(this.getController().getKnownAllies());
			local dirs = [
				{
					Dir = 0,
					Score = 0
				},
				{
					Dir = 1,
					Score = 0
				},
				{
					Dir = 2,
					Score = 0
				},
				{
					Dir = 3,
					Score = 0
				},
				{
					Dir = 4,
					Score = 0
				},
				{
					Dir = 5,
					Score = 0
				}
			];

			foreach( o in entities )
			{
				if (o.Entity.isNull() || !o.Entity.isAlive() || !o.Entity.isAttackable() && !o.Entity.isLocation())
				{
					continue;
				}

				if (this.getVecDistance(myPos, o.Entity.getPos()) > this.Const.World.AI.Behavior.AttackMaxRange)
				{
					continue;
				}

				if (o.Entity.getStrength() / _entity.getStrength() <= 0.5)
				{
					continue;
				}

				local mult = _entity.isAlliedWith(o.Entity) ? -1 : 1;
				local dir = _entity.getDirectionTo(o.Entity.get());
				local dir_left = dir - 1 >= 0 ? dir - 1 : this.Const.Direction.COUNT - 1;
				local dir_farleft = dir - 2 >= 0 ? dir - 2 : this.Const.Direction.COUNT - 2;
				local dir_right = dir + 1 < this.Const.Direction.COUNT ? dir + 1 : 0;
				local dir_farright = dir + 2 < this.Const.Direction.COUNT ? dir + 2 : 1;
				dirs[dir].Score += 4 * mult;
				dirs[dir_left].Score += 3 * mult;
				dirs[dir_farleft].Score += 1 * mult;
				dirs[dir_right].Score += 3 * mult;
				dirs[dir_farright].Score += 1 * mult;
			}

			dirs.sort(this.onSortByLowestScore);
			local attempts = 0;
			local path;
			local navSettings = this.World.getNavigator().createSettings();
			navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost;
			navSettings.RoadMult = 1.0 / this.Const.World.MovementSettings.RoadMult;

			foreach( d in dirs )
			{
				for( local i = 0; i < this.Const.World.AI.Behavior.FleeMaxAttemptsPerDirection; i = ++i )
				{
					attempts = ++attempts;

					if (attempts > this.Const.World.AI.Behavior.FleeMaxAttempts)
					{
						break;
					}

					local x = myTile.X;
					local y = myTile.Y;
					local steps = this.Math.rand(2, 5);
					x = x + this.Const.DirectionStep[d.Dir][0] * steps;
					y = y + this.Const.DirectionStep[d.Dir][1] * steps;

					if (!this.World.isValidTile(x, y))
					{
					}
					else
					{
						local tile = this.World.getTile(x, y);

						if (tile.Type == this.Const.World.TerrainType.Ocean)
						{
						}
						else
						{
							path = this.World.getNavigator().findPath(myTile, tile, navSettings, 0);

							if (!path.isEmpty())
							{
								_entity.setPath(path);
								break;
							}
						}
					}
				}
			}
		}

		_entity.setOrders("Fleeing");
		return true;
	}

	function onSortByLowestScore( _d1, _d2 )
	{
		if (_d1.Score < _d2.Score)
		{
			return 1;
		}
		else if (_d1.Score > _d2.Score)
		{
			return -1;
		}

		return 0;
	}

});

