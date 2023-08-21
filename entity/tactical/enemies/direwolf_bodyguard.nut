this.direwolf_bodyguard <- this.inherit("scripts/entity/tactical/enemies/direwolf_high", {
	m = {},
	function create()
	{
		this.direwolf_high.create();
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/direwolf_bodyguard_agent");
		this.m.AIAgent.setActor(this);
	}

});

