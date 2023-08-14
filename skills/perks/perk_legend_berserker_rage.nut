this.perk_legend_berserker_rage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_berserker_rage";
		this.m.Name = this.Const.Strings.PerkName.LegendBerserkerRage;
		this.m.Description = this.Const.Strings.PerkDescription.LegendBerserkerRage;
		this.m.Icon = "ui/perks/berserker_rage_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("effects.legend_berserker_rage"))
		{
			this.m.Container.add(this.new("scripts/skills/effects/legend_berserker_rage_effect"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("effects.legend_berserker_rage");
	}

});

