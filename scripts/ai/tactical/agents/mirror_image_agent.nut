this.mirror_image_agent <- this.inherit("scripts/ai/tactical/agent", {
	m = {},
	function create()
	{
		this.agent.create();
		this.m.ID = this.Const.AI.Agent.ID.MirrorImage;
		this.m.Properties.TargetPriorityHitchanceMult = 0.5;
		this.m.Properties.TargetPriorityHitpointsMult = 0.5;
		this.m.Properties.TargetPriorityRandomMult = 0.0;
		this.m.Properties.TargetPriorityMoraleMult = 0.0;
		this.m.Properties.TargetPriorityBraveryMult = 0.0;
		this.m.Properties.TargetPriorityHittingAlliesMult = 1.0;
		this.m.Properties.OverallDefensivenessMult = 0.0;
		this.m.Properties.OverallFormationMult = 1.0;
		this.m.Properties.EngageRangeMin = 5;
		this.m.Properties.EngageRangeMax = 7;
		this.m.Properties.EngageRangeIdeal = 7;
	}

	function onAddBehaviors()
	{
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_engage_ranged"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_default"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_raise_undead"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_wither"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_lightning_storm"));
	}

	function onUpdate()
	{
		local entities = this.Tactical.Entities.getInstancesOfFaction(this.getActor().getFaction());
		local phylacteries = 0;

		foreach( e in entities )
		{
			if (e.getType() == this.Const.EntityType.SkeletonPhylactery)
			{
				phylacteries = ++phylacteries;
			}
		}

		phylacteries = this.Math.max(0, phylacteries - this.Time.getRound() / 9);

		if (phylacteries <= 1)
		{
			this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.LightningStorm] = 1.0;
		}
		else
		{
			this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.LightningStorm] = 0.0;
		}
	}

});

