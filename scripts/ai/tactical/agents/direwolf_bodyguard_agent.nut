this.direwolf_bodyguard_agent <- this.inherit("scripts/ai/tactical/agents/direwolf_agent", {
	m = {},
	function create()
	{
		this.direwolf_agent.create();
	}

	function onAddBehaviors()
	{
		this.direwolf_agent.onAddBehaviors();
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_protect"));
	}

});

