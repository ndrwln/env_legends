this.spider_bodyguard_agent <- this.inherit("scripts/ai/tactical/agents/spider_agent", {
	m = {},
	function create()
	{
		this.spider_agent.create();
	}

	function onAddBehaviors()
	{
		this.spider_agent.onAddBehaviors();
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_protect"));
	}

});

