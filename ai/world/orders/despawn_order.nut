this.despawn_order <- this.inherit("scripts/ai/world/world_behavior", {
	m = {},
	function create()
	{
		this.world_behavior.create();
		this.m.ID = this.Const.World.AI.Behavior.ID.Despawn;
	}

	function onSerialize( _out )
	{
		this.world_behavior.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.world_behavior.onDeserialize(_in);
	}

	function onExecute( _entity, _hasChanged )
	{
		_entity.fadeOutAndDie();
		this.getController().popOrder();
		return true;
	}

});

