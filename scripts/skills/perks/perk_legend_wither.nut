this.perk_legend_wither <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_wither";
		this.m.Name = this.Const.Strings.PerkName.LegendWither;
		this.m.Description = this.Const.Strings.PerkDescription.LegendWither;
		this.m.Icon = "ui/perks/wither56_skill.png";
		this.m.IconDisabled = "ui/perks/wither56_skill_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_wither"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_wither"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_wither");
	}

});

