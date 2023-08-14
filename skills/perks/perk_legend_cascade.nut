this.perk_legend_cascade <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_cascade";
		this.m.Name = this.Const.Strings.PerkName.LegendCascade;
		this.m.Description = this.Const.Strings.PerkDescription.LegendCascade;
		this.m.Icon = "ui/perks/triplestrike56.png";
		this.m.IconDisabled = "ui/perks/triplestrike56_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

