this.skeleton_melee_agent <- this.inherit("scripts/ai/tactical/agent", {
	m = {},
	function create()
	{
		this.agent.create();
		this.m.ID = this.Const.AI.Agent.ID.SkeletonMelee;
		this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.Shieldwall] = 8.0;
		this.m.Properties.TargetPriorityMoraleMult = 0.25;
		this.m.Properties.TargetPriorityBraveryMult = 0.25;
		this.m.Properties.OverallDefensivenessMult = 0.25;
		this.m.Properties.OverallFormationMult = 1.0;
		this.m.Properties.EngageTargetArmedWithRangedWeaponMult = 1.0;
		this.m.Properties.EngageWhenAlreadyEngagedMult = 0.1;
		this.m.Properties.EngageFlankingMult = 0.1;
		this.m.Properties.EngageTargetAlreadyBeingEngagedMult = 5.0;
		this.m.Properties.EngageTileLimit = 3;
		this.m.Properties.IgnoreTargetValueOnEngage = true;
	}

	function onAddBehaviors()
	{
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_engage_melee"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_break_free"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_default"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_swing"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_reap"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_split"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_decapitate"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_gash"));
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

			if (!this.getStrategy().getStats().IsEngaged && this.getStrategy().getStats().ShortestDistanceToEnemyNotMoved == 4)
			{
				this.m.Properties.DontEngage = true;
			}
			else
			{
				this.m.Properties.DontEngage = false;
			}
		}

		if (this.m.Properties.EngageRangeIdeal > 1)
		{
			this.m.Properties.OverallMagnetismMult = 1.25;
		}
		else
		{
			this.m.Properties.OverallMagnetismMult = 1.0;
		}

		if (this.Tactical.Entities.getStrategy(this.getActor().getFaction()).getStats().IsEngaged)
		{
			this.m.Properties.OverallFormationMult = 2.0;
		}
		else
		{
			this.m.Properties.OverallFormationMult = 1.0;
		}
	}

});

