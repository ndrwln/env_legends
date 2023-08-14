this.perk_legend_true_form <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_true_form";
		this.m.Name = this.Const.Strings.PerkName.LegendTrueForm;
		this.m.Description = this.Const.Strings.PerkDescription.LegendTrueForm;
		this.m.Icon = "ui/perks/true_form_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

