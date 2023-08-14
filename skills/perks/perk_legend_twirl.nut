this.perk_legend_twirl <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_twirl";
		this.m.Name = this.Const.Strings.PerkName.LegendTwirl;
		this.m.Description = this.Const.Strings.PerkDescription.LegendTwirl;
		this.m.Icon = "ui/perks/twirl_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

