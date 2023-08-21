this.idle_agent <- this.inherit("scripts/ai/tactical/agent", {
	m = {},
	function create()
	{
		this.agent.create();
		this.m.ID = this.Const.AI.Agent.ID.Idle;
	}

	function onAddBehaviors()
	{
	}

	function onUpdate()
	{
	}

});

