this.skeleton_bodyguard_agent <- this.inherit("scripts/ai/tactical/agent", {
	m = {},
	function create()
	{
		this.agent.create();
		this.m.ID = this.Const.AI.Agent.ID.SkeletonMelee;
		this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.Shieldwall] = 1.5;
		this.m.Properties.TargetPriorityMoraleMult = 0.25;
		this.m.Properties.TargetPriorityBraveryMult = 0.25;
		this.m.Properties.OverallDefensivenessMult = 1.0;
		this.m.Properties.OverallFormationMult = 1.0;
		this.m.Properties.EngageTargetArmedWithRangedWeaponMult = 1.0;
		this.m.Properties.EngageWhenAlreadyEngagedMult = 0.1;
		this.m.Properties.EngageFlankingMult = 0.1;
		this.m.Properties.EngageTargetAlreadyBeingEngagedMult = 5.0;
		this.m.Properties.EngageTileLimit = 3;
		this.m.Properties.IgnoreTargetValueOnEngage = true;
		this.m.Properties.PreferWait = true;
	}

	function onAddBehaviors()
	{
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_engage_melee"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_break_free"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_protect"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_default"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_swing"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_reap"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_split"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_decapitate"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_defend"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_defend_shieldwall"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_defend_knock_back"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_defend_rotation"));
	}

	function onUpdate()
	{
		this.setEngageRangeBasedOnWeapon();
		local entities = this.Tactical.Entities.getInstancesOfFaction(this.getActor().getFaction());
		local hasLich = false;

		foreach( e in entities )
		{
			if (e.getType() == this.Const.EntityType.SkeletonLich)
			{
				hasLich = true;
				break;
			}
		}

		if (hasLich)
		{
			this.m.Properties.EngageTileLimit = 0;
		}
		else
		{
			this.m.Properties.EngageTileLimit = 3;
		}
	}

});

