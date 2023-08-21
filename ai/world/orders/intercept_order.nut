this.intercept_order <- this.inherit("scripts/ai/world/world_behavior", {
	m = {
		Target = null
	},
	function setTarget( _t )
	{
		if (_t == null)
		{
			this.m.Target = _t;
		}
		else
		{
			this.m.Target = this.WeakTableRef(_t);
		}
	}

	function create()
	{
		this.world_behavior.create();
		this.m.ID = this.Const.World.AI.Behavior.ID.Intercept;
	}

	function onSerialize( _out )
	{
		this.world_behavior.onSerialize(_out);

		if (this.m.Target != null && !this.m.Target.isNull())
		{
			_out.writeU32(this.m.Target.getID());
		}
		else
		{
			_out.writeU32(0);
		}
	}

	function onDeserialize( _in )
	{
		this.world_behavior.onDeserialize(_in);
		local target = _in.readU32();

		if (target != 0)
		{
			this.m.Target = this.WeakTableRef(this.World.getEntityByID(target));
		}
	}

	function onExecute( _entity, _hasChanged )
	{
		if (this.m.Target == null || this.m.Target.isNull() || this.m.Target.isPlayerControlled() && _entity.isAlliedWithPlayer())
		{
			this.getController().popOrder();
		}
		else
		{
			local attack = this.getController().getBehavior(this.Const.World.AI.Behavior.ID.Attack);
			attack.setTarget(this.m.Target);
			attack.onExecute(_entity, _hasChanged);
		}

		return true;
	}

});

