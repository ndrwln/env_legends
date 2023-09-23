this.perk_legend_clarity <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_clarity";
		this.m.Name = this.Const.Strings.PerkName.LegendClarity;
		this.m.Description = this.Const.Strings.PerkDescription.LegendClarity;
		this.m.Icon = "ui/perks/clarity_circle.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();

		if (!actor.getSkills().hasSkill("effects.dazed") && !actor.getSkills().hasSkill("effects.drunk") && !actor.getSkills().hasSkill("effects.taunted") && !actor.getSkills().hasSkill("effects.hangover") && !actor.getSkills().hasSkill("effects.staggered") && !actor.getSkills().hasSkill("effects.horrified") && !actor.getSkills().hasSkill("injury.severe_concussion") && this.getContainer().getActor().getMoraleState() >= this.Const.MoraleState.Wavering)
		{
			_properties.DamageDirectAdd += 0.1;
		}

		if (actor.getSkills().hasSkill("effects.iron_will") || actor.getSkills().hasSkill("effects.recovery_potion") || actor.getSkills().hasSkill("effects.lionheart_potion") || actor.getSkills().hasSkill("effects.cat_potion") || actor.getSkills().hasSkill("effects.legend_hexe_ichor_potion"))
		{
			_properties.DamageDirectAdd += 0.1;
		}
	}

});

