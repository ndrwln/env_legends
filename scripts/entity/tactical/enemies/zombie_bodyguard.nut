this.zombie_bodyguard <- this.inherit("scripts/entity/tactical/enemies/zombie", {
	m = {},
	function create()
	{
		this.m.IsCreatingAgent = false;
		this.zombie.create();
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/zombie_bodyguard_agent");
		this.m.AIAgent.setActor(this);
	}

});

