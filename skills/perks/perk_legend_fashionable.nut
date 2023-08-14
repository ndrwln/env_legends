this.perk_legend_fashionable <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_fashionable";
		this.m.Name = this.Const.Strings.PerkName.LegendFashionable;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFashionable;
		this.m.Icon = "ui/perks/evasion_circle.png";
		this.m.IconDisabled = "ui/perks/evasion_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

