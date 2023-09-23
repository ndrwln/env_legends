this.perk_legend_untouchable <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_untouchable";
		this.m.Name = this.Const.Strings.PerkName.LegendUntouchable;
		this.m.Description = this.Const.Strings.PerkDescription.LegendUntouchable;
		this.m.Icon = "ui/perks/untouchable_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

