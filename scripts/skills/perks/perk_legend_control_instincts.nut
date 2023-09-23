this.perk_legend_control_instincts <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_control_instincts";
		this.m.Name = this.Const.Strings.PerkName.LegendControlInstincts;
		this.m.Description = this.Const.Strings.PerkDescription.LegendControlInstincts;
		this.m.Icon = "ui/perks/control_instincts.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

