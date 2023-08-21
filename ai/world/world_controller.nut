this.world_controller <- {
	m = {
		ID = "",
		Entity = null,
		NextBehaviorToEvaluate = 0,
		LastRefreshTime = 0.0,
		Behaviors = [],
		Orders = [],
		ActiveBehavior = null,
		LastBehavior = null,
		KnownOpponents = [],
		KnownAllies = [],
		IsFinished = true,
		IsEvaluating = true,
		IsEvaluationInProgress = false,
		IsSharingKnowledge = true,
		IsVerbose = false
	},
	function setEntity( _a )
	{
		this.m.Entity = this.WeakTableRef(_a);
	}

	function getID()
	{
		return this.m.ID;
	}

	function getEntity()
	{
		return this.m.Entity;
	}

	function getKnownOpponents()
	{
		return this.m.KnownOpponents;
	}

	function getKnownAllies()
	{
		return this.m.KnownAllies;
	}

	function getActiveBehavior()
	{
		return this.m.LastBehavior;
	}

	function getBehaviorMult()
	{
		return this.m.BehaviorMult;
	}

	function isFinished()
	{
		return this.m.IsFinished;
	}

	function isEvaluating()
	{
		return this.m.IsEvaluating;
	}

	function setFinished( _f )
	{
		this.m.IsFinished = _f;
	}

	function setVerbose( _f )
	{
		this.m.IsVerbose = _f;
	}

	function isReady()
	{
		if (this.m.IsEvaluating)
		{
			return false;
		}

		return true;
	}

	function getBehavior( _id )
	{
		foreach( b in this.m.Behaviors )
		{
			if (b.getID() == _id)
			{
				return b;
			}
		}

		return null;
	}

	function getOrder( _id )
	{
		foreach( o in this.m.Orders )
		{
			if (o.getID() == _id)
			{
				return o;
			}
		}

		return null;
	}

	function getOrders()
	{
		return this.m.Orders;
	}

	function addOrderInFront( _order )
	{
		_order.setController(this);
		this.m.Orders.insert(0, _order);
	}

	function addOrder( _order )
	{
		_order.setController(this);
		this.m.Orders.push(_order);
	}

	function popOrder()
	{
		if (this.m.Orders.len() != 0)
		{
			this.m.Orders.remove(0);
		}
	}

	function getCurrentOrder()
	{
		if (this.m.Orders.len() == 0)
		{
			return null;
		}
		else
		{
			return this.m.Orders[0];
		}
	}

	function clearOrders()
	{
		this.m.Orders = [];
	}

	function hasOrders()
	{
		return this.m.Orders.len() != 0;
	}

	function create()
	{
		this.addBehavior(this.new("scripts/ai/world/behaviors/ai_world_idle"));
		this.addBehavior(this.new("scripts/ai/world/behaviors/ai_world_attack"));
		this.addBehavior(this.new("scripts/ai/world/behaviors/ai_world_flee"));
	}

	function onSerialize( _out )
	{
		local num = 0;

		foreach( o in this.m.KnownOpponents )
		{
			if (o.Entity != null && !o.Entity.isNull() && o.Entity.isAlive())
			{
				num = ++num;
			}
		}

		_out.writeU16(num);

		foreach( o in this.m.KnownOpponents )
		{
			if (o.Entity == null || o.Entity.isNull() || !o.Entity.isAlive())
			{
				continue;
			}

			_out.writeU32(o.Entity.getID());
			_out.writeF32(o.Pos.X);
			_out.writeF32(o.Pos.Y);
			_out.writeI32(o.TTL);
		}

		foreach( b in this.m.Behaviors )
		{
			b.onSerialize(_out);
		}

		_out.writeU8(this.m.Orders.len());

		foreach( o in this.m.Orders )
		{
			_out.writeI32(o.ClassNameHash);
			o.onSerialize(_out);
		}
	}

	function onDeserialize( _in )
	{
		local numOpponents = _in.readU16();

		for( local i = 0; i < numOpponents; i = ++i )
		{
			local o = {
				Entity = null,
				Pos = null,
				TTL = 0
			};
			local id = _in.readU32();

			if (id != 0)
			{
				o.Entity = this.WeakTableRef(this.World.getEntityByID(id));
			}

			local x = _in.readF32();
			local y = _in.readF32();
			o.Pos = this.createVec(x, y);
			o.TTL = _in.readI32();
			this.m.KnownOpponents.push(o);
		}

		foreach( b in this.m.Behaviors )
		{
			b.onDeserialize(_in);
		}

		local numOrders = _in.readU8();

		for( local i = 0; i < numOrders; i = ++i )
		{
			local order = this.new(this.IO.scriptFilenameByHash(_in.readI32()));
			order.onDeserialize(_in);
			this.addOrder(order);
		}
	}

	function think()
	{
		if (this.m.Entity.isNull() || !this.m.Entity.isAlive())
		{
			return;
		}

		if (this.m.IsFinished)
		{
			this.onRefresh();
		}

		if (this.m.IsEvaluating)
		{
			this.evaluate(this.m.Entity);
		}

		if (this.isReady())
		{
			this.m.IsEvaluating = this.execute(this.m.Entity);

			if (this.m.IsEvaluating || !this.m.Entity.isAlive())
			{
				this.setFinished(true);
			}
		}
	}

	function evaluate( _entity )
	{
		this.m.ActiveBehavior = null;
		this.m.IsEvaluationInProgress = true;

		if (this.m.NextBehaviorToEvaluate == 0)
		{
			this.onUpdate();
		}

		while (this.m.NextBehaviorToEvaluate < this.m.Behaviors.len())
		{
			if (this.m.Behaviors[this.m.NextBehaviorToEvaluate].evaluate(_entity))
			{
				++this.m.NextBehaviorToEvaluate;
			}
			else
			{
				break;
			}
		}

		if (this.m.NextBehaviorToEvaluate >= this.m.Behaviors.len())
		{
			this.m.IsEvaluating = false;
			this.m.NextBehaviorToEvaluate = 0;
			this.m.ActiveBehavior = this.pickBehavior();

			foreach( b in this.m.Behaviors )
			{
				b.onReset();
			}
		}
	}

	function execute( _entity )
	{
		if (this.m.ActiveBehavior != null)
		{
			if (this.m.ActiveBehavior.execute(_entity, this.m.LastBehavior != this.m.ActiveBehavior))
			{
				this.m.LastBehavior = this.m.ActiveBehavior;
				return true;
			}
			else
			{
				return false;
			}
		}
	}

	function onUpdate()
	{
	}

	function onOpponentSighted( _entity )
	{
		if (_entity.isLocation())
		{
			return;
		}

		if (typeof _entity != "instance")
		{
			_entity = this.WeakTableRef(_entity);
		}

		foreach( o in this.m.KnownOpponents )
		{
			if (!o.Entity.isNull() && o.Entity.getID() == _entity.getID())
			{
				o.Pos = _entity.getPos();
				o.TTL = this.Time.getVirtualTime() + (_entity.isParty() ? this.Const.World.AI.Controller.OpponentPartyTTL : this.Const.World.AI.Controller.OpponentLocationTTL);
				return;
			}
		}

		local e = {
			Entity = _entity,
			Pos = _entity.getPos(),
			TTL = this.Time.getVirtualTime() + (_entity.isParty() ? this.Const.World.AI.Controller.OpponentPartyTTL : this.Const.World.AI.Controller.OpponentLocationTTL)
		};
		this.m.KnownOpponents.push(e);
	}

	function onAllySighted( _entity )
	{
		if (this.m.IsSharingKnowledge && _entity.isParty() && _entity.getController() != null)
		{
			local sharedKnowledge = _entity.getController().getKnownOpponents();

			foreach( k in sharedKnowledge )
			{
				if (k.Entity.isNull() || !k.Entity.isAlive())
				{
					continue;
				}

				local known = false;

				foreach( o in this.m.KnownOpponents )
				{
					if (!o.Entity.isNull() && o.Entity.getID() == k.Entity.getID())
					{
						known = true;

						if (o.TTL <= k.TTL)
						{
							o.TTL = k.TTL;
							o.Pos = k.Pos;
						}
					}
				}

				if (!known)
				{
					local e = {
						Entity = k.Entity,
						Pos = k.Pos,
						TTL = k.TTL
					};
					this.m.KnownOpponents.push(e);
				}
			}
		}

		local e = {
			Entity = this.WeakTableRef(_entity),
			Pos = _entity.getPos(),
			TTL = 0
		};
		this.m.KnownAllies.push(e);
	}

	function onRefresh()
	{
		this.m.IsEvaluating = true;
		this.m.IsEvaluationInProgress = false;
		this.m.IsFinished = false;

		if (this.Time.getVirtualTimeF() - this.m.LastRefreshTime < this.Const.World.AI.RefreshTime)
		{
			return;
		}

		this.m.LastRefreshTime = this.Time.getVirtualTimeF();
		local entities = this.World.getAllEntitiesVisibleAtPos(this.m.Entity.getPos(), this.m.Entity.getVisionRadius());
		this.m.KnownAllies = [];

		foreach( e in entities )
		{
			if (!e.isAlive() || e.getID() == this.m.Entity.getID())
			{
				continue;
			}

			if (this.m.Entity.isAlliedWith(e))
			{
				this.onAllySighted(e);
			}
			else
			{
				this.onOpponentSighted(e);
			}
		}

		local garbage = [];

		foreach( i, o in this.m.KnownOpponents )
		{
			if (o.TTL <= this.Time.getVirtualTime() || o.Entity.isNull() || !o.Entity.isAlive() || o.Entity.isLocation())
			{
				garbage.push(i);
			}
		}

		garbage.reverse();

		foreach( i in garbage )
		{
			this.m.KnownOpponents.remove(i);
		}
	}

	function addBehavior( _behavior )
	{
		_behavior.setController(this);
		this.m.Behaviors.push(_behavior);
	}

	function removeBehavior( _id )
	{
		foreach( i, behavior in this.m.Behaviors )
		{
			if (behavior.getID() == _id)
			{
				behavior.setController(null);
				this.m.Behaviors.remove(i);
				return;
			}
		}
	}

	function clearBehaviors()
	{
		foreach( behavior in this.m.Behaviors )
		{
			behavior.setController(null);
		}

		this.m.Behaviors = [];
	}

	function pickBehavior()
	{
		local bestBehavior;
		local bestScore = 0;

		foreach( b in this.m.Behaviors )
		{
			if (b.getScore() > bestScore)
			{
				bestBehavior = b;
				bestScore = b.getScore();
			}
		}

		if (this.m.Orders.len() != 0 && (bestScore < this.Const.World.AI.Behavior.Score.Order || this.m.Orders[0].getID() == this.Const.World.AI.Behavior.ID.Sleep))
		{
			return this.m.Orders[0];
		}
		else
		{
			return bestBehavior;
		}
	}

	function hasKnownOpponent()
	{
		return this.m.KnownOpponents.len() != 0;
	}

	function hasVisibleOpponent()
	{
		if (this.m.KnownOpponents.len() == 0)
		{
			return false;
		}

		foreach( o in this.m.KnownOpponents )
		{
			if (o.Tile.IsVisibleForEntity && !o.Actor.isNull() && o.Actor.isAlive())
			{
				return true;
			}
		}

		return false;
	}

};

