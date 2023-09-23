this.perk_legend_lurker <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_lurker";
		this.m.Name = this.Const.Strings.PerkName.LegendLurker;
		this.m.Description = this.Const.Strings.PerkDescription.LegendLurker;
		this.m.Icon = "ui/perks/lurker.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		this.skill.onUpdate(_properties);
		local actor = this.getContainer().getActor();

		if (actor.getSkills().hasSkill("terrain.hidden"))
		{
			_properties.RangedSkill *= 1.25;
			_properties.FatigueRecoveryRate += 10;
		}

		if (actor.getSkills().hasSkill("effect.smoke"))
		{
			_properties.ActionPoints += 2;
		}
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("effects.lurker"))
		{
			this.m.Container.add(this.new("scripts/skills/effects/lurker_effect"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("effects.lurker");
	}

	function onAfterUpdate( _properties )
	{
		if (this.getContainer().getActor().getSkills().hasSkill("hidden_effect"))
		{
			if (this.getContainer().getActor().getSkills().hasSkill("hidden_effect").isActive())
			{
				_properties.FatigueRecoveryRate += 10;
			}
		}
	}

});

