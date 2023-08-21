this.ai_world_idle <- this.inherit("scripts/ai/world/world_behavior", {
	m = {},
	function create()
	{
		this.m.ID = this.Const.World.AI.Behavior.ID.Idle;
		this.world_behavior.create();
	}

	function onEvaluate( _entity )
	{
		return this.Const.World.AI.Behavior.Score.Idle;
	}

	function onExecute( _entity, _hasChanged )
	{
		this.getController().setFinished(true);
		return true;
	}

});

