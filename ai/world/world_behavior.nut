this.world_behavior <- {
	m = {
		ID = null,
		Controller = null,
		Score = 0,
		Thread = null,
		IsThreaded = false,
		IsFirstExecuted = false,
		IsEnabled = true
	},
	function getID()
	{
		return this.m.ID;
	}

	function getName()
	{
		return this.Const.World.AI.Behavior.Name[this.m.ID];
	}

	function getScore()
	{
		return this.m.Score;
	}

	function getController()
	{
		return this.m.Controller;
	}

	function getEntity()
	{
		return this.m.Controller.getEntity();
	}

	function getProperties()
	{
		return this.m.Controller.getProperties();
	}

	function setController( _a )
	{
		if (typeof _a == "instance")
		{
			this.m.Controller = _a;
		}
		else
		{
			this.m.Controller = this.WeakTableRef(_a);
		}
	}

	function create()
	{
	}

	function onSerialize( _out )
	{
		_out.writeBool(this.m.IsEnabled);
	}

	function onDeserialize( _in )
	{
		this.m.IsEnabled = _in.readBool();
	}

	function evaluate( _entity )
	{
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

			if (this.Const.AI.BenchmarkMode)
			{
				local timeTaken = this.Time.getExactTime() - startTime;
				this.logInfo("[] Evaluating " + this.getID() + " took " + timeTaken + " seconds.");
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

			if (this.Const.AI.BenchmarkMode)
			{
				local timeTaken = this.Time.getExactTime() - startTime;
				this.logInfo("[] Evaluating " + this.getID() + " took " + timeTaken + " seconds.");
			}

			return true;
		}

		return false;
	}

	function execute( _entity, _hasChanged )
	{
		return this.onExecute(_entity, _hasChanged);
	}

	function onEvaluate( _entity )
	{
		return 0;
	}

	function onExecute( _entity )
	{
		return true;
	}

	function onReset()
	{
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

	function isEnemyNear()
	{
		local opponents = this.getController().getKnownOpponents();
		local entity = this.getEntity();
		local myPos = entity.getPos();

		foreach( e in opponents )
		{
			if (e.Entity.isNull() || !e.Entity.isAlive())
			{
				continue;
			}

			if (!e.Entity.isAlliedWith(entity) && e.Entity.isParty() && e.Entity.getRole() != this.Const.World.PartyRole.Caravan)
			{
				if (this.getVecDistance(myPos, e.Pos) < this.Const.World.AI.Behavior.EnemyNearDist)
				{
					return true;
				}
			}
		}

		return false;
	}

};

