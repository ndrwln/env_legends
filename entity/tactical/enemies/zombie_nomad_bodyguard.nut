this.zombie_nomad_bodyguard <- this.inherit("scripts/entity/tactical/enemies/zombie_nomad", {
	m = {},
	function create()
	{
		this.m.IsCreatingAgent = false;
		this.zombie_nomad.create();
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/zombie_bodyguard_agent");
		this.m.AIAgent.setActor(this);
	}

});

