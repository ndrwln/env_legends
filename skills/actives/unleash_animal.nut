this.unleash_animal <- this.inherit("scripts/skills/skill", {
	m = {},
	function addAnimalSkills( entity )
	{
		if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_dogwhisperer"))
		{
			entity.getSkills().add(this.new("scripts/skills/perks/perk_fortified_mind"));
			entity.getSkills().add(this.new("scripts/skills/perks/perk_colossus"));
			entity.getSkills().add(this.new("scripts/skills/perks/perk_underdog"));
		}

		if (!this.getContainer().hasSkill("perk.legend_doghandling"))
		{
			return;
		}

		if (!this.getContainer().hasSkill("actives.legend_attack_target"))
		{
			this.getContainer().add(this.new("scripts/skills/actives/legend_attack_target"));
		}

		local skill = this.getContainer().getSkillByID("actives.legend_attack_target");
		skill.addPet(entity.getID());

		if (!this.getContainer().hasSkill("actives.legend_protect_target"))
		{
			this.getContainer().add(this.new("scripts/skills/actives/legend_protect_target"));
		}

		skill = this.getContainer().getSkillByID("actives.legend_protect_target");
		skill.addPet(entity.getID());
		local ai = entity.getAIAgent();
		ai.m.Properties.TargetPriorityHitchanceMult = 2.0;
		ai.m.Properties.EngageAgainstSpearwallMult = 0.5;
		ai.m.Properties.EngageAgainstSpearwallWithShieldwallMult = 0.25;
	}

});

