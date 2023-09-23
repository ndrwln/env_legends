this.mortar_agent <- this.inherit("scripts/ai/tactical/agent", {
	m = {},
	function create()
	{
		this.agent.create();
		this.m.ID = this.Const.AI.Agent.ID.Idle;
		this.m.Properties.OverallDefensivenessMult = 2.0;
		this.m.Properties.OverallMagnetismMult = 4.0;
	}

	function onAddBehaviors()
	{
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_mortar"));
	}

	function onUpdate()
	{
	}

});

