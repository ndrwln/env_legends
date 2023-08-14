this.assassin_agent <- this.inherit("scripts/ai/tactical/agent", {
	m = {},
	function create()
	{
		this.agent.create();
		this.m.ID = this.Const.AI.Agent.ID.Assassin;
		this.m.Properties.TargetPriorityHitchanceMult = 0.4;
		this.m.Properties.TargetPriorityHitpointsMult = 0.3;
		this.m.Properties.TargetPriorityRandomMult = 0.0;
		this.m.Properties.TargetPriorityDamageMult = 0.3;
		this.m.Properties.TargetPriorityFleeingMult = 0.75;
		this.m.Properties.TargetPriorityHittingAlliesMult = 0.1;
		this.m.Properties.TargetPriorityFinishOpponentMult = 3.0;
		this.m.Properties.TargetPriorityCounterSkillsMult = 0.5;
		this.m.Properties.TargetPriorityArmorMult = 0.75;
		this.m.Properties.TargetPriorityDebilitatedMult = 1.33;
		this.m.Properties.OverallDefensivenessMult = 0.5;
		this.m.Properties.OverallFormationMult = 0.5;
		this.m.Properties.EngageFlankingMult = 1.35;
		this.m.Properties.EngageTargetMultipleOpponentsMult = 1.5;
		this.m.Properties.EngageTargetAlreadyBeingEngagedMult = 0.35;
		this.m.Properties.PreferWait = true;
	}

	function onAddBehaviors()
	{
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_flee"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_retreat"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_engage_melee"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_break_free"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_wake_up_ally"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_disengage"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_default"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_deathblow"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_puncture"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_gash"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_throw_bomb"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_adrenaline"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_recover"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_switchto_melee"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_switchto_ranged"));
	}

	function onUpdate()
	{
		this.setEngageRangeBasedOnWeapon();
		local item = this.m.Actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

		if (item != null && item.isItemType(this.Const.Items.ItemType.Weapon) && item.isAoE())
		{
			this.m.Properties.EngageTargetMultipleOpponentsMult = 0.75;
		}
		else
		{
			this.m.Properties.EngageTargetMultipleOpponentsMult = 1.25;
		}
	}

});

